// Cloudflare Workers Web Crypto Auth Module

function toHex(buffer) {
  return Array.from(new Uint8Array(buffer))
    .map((b) => b.toString(16).padStart(2, '0'))
    .join('')
}

export async function hashPassword(password, salt) {
  const enc = new TextEncoder()
  const keyMaterial = await crypto.subtle.importKey(
    'raw',
    enc.encode(password),
    { name: 'PBKDF2' },
    false,
    ['deriveBits']
  )
  const bits = await crypto.subtle.deriveBits(
    {
      name: 'PBKDF2',
      salt: enc.encode(salt),
      iterations: 10000,
      hash: 'SHA-256',
    },
    keyMaterial,
    256
  )
  return toHex(bits)
}

export function generateRandomCode(length = 8) {
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
  const randomBytes = new Uint8Array(length)
  crypto.getRandomValues(randomBytes)
  return Array.from(randomBytes).map((b) => chars[b % chars.length]).join('')
}

export async function sha256(text) {
  const msgBuffer = new TextEncoder().encode(text)
  const hashBuffer = await crypto.subtle.digest('SHA-256', msgBuffer)
  return toHex(hashBuffer)
}

export async function getSessionUser(request, env) {
  const authHeader = request.headers.get('authorization') || ''
  const token = authHeader.replace(/^Bearer\s+/i, '').trim()
  if (!token) return null

  const tokenHash = await sha256(token)
  const now = new Date().toISOString()

  const session = await env.DB.prepare(
    `SELECT s.id, s.user_id, s.expires_at, u.account, u.display_name, u.role, u.points, u.invite_code, u.referred_by
     FROM sessions s
     JOIN users u ON s.user_id = u.id
     WHERE s.token_hash = ? AND s.expires_at > ?`
  ).bind(tokenHash, now).first()

  if (!session) return null
  return session
}

export async function handleAuth(request, env, pathname) {
  const method = request.method

  // POST /api/auth/register
  if (pathname === '/api/auth/register' && method === 'POST') {
    const body = await request.json().catch(() => ({}))
    const account = String(body.account || '').trim()
    const password = String(body.password || '').trim()
    const displayName = String(body.displayName || account).trim()
    const refCode = String(body.inviteCode || body.ref || '').trim().toUpperCase()

    if (!account || account.length < 3) {
      return Response.json({ error: '账号长度至少3位' }, { status: 400 })
    }
    if (!password || password.length < 6) {
      return Response.json({ error: '密码长度至少6位' }, { status: 400 })
    }

    const existing = await env.DB.prepare('SELECT id FROM users WHERE account = ?').bind(account).first()
    if (existing) {
      return Response.json({ error: '该账号已存在' }, { status: 409 })
    }

    const userId = crypto.randomUUID()
    const salt = crypto.randomUUID()
    const passwordHash = await hashPassword(password, salt)
    const myInviteCode = generateRandomCode(8)
    const initialPoints = 100 // 注册送 100 积分

    // 检查邀请人
    let inviter = null
    if (refCode) {
      inviter = await env.DB.prepare('SELECT id, account, points FROM users WHERE invite_code = ?').bind(refCode).first()
    }

    // 事务写入
    const stmts = [
      env.DB.prepare(
        `INSERT INTO users (id, account, display_name, password_salt, password_hash, role, points, invite_code, referred_by)
         VALUES (?, ?, ?, ?, ?, 'member', ?, ?, ?)`
      ).bind(userId, account, displayName, salt, passwordHash, initialPoints + (inviter ? 50 : 0), myInviteCode, inviter ? inviter.id : null),
      env.DB.prepare(
        `INSERT INTO points_ledger (id, user_id, amount, balance_after, action_type, remark)
         VALUES (?, ?, ?, ?, 'register_reward', '新用户注册欢迎礼')`
      ).bind(crypto.randomUUID(), userId, initialPoints, initialPoints)
    ]

    // 若有邀请人，双方各得 50 积分
    if (inviter) {
      const inviterBonus = 50
      const inviterBalanceAfter = inviter.points + inviterBonus
      stmts.push(
        env.DB.prepare('UPDATE users SET points = points + ? WHERE id = ?').bind(inviterBonus, inviter.id),
        env.DB.prepare(
          `INSERT INTO points_ledger (id, user_id, amount, balance_after, action_type, related_id, remark)
           VALUES (?, ?, ?, ?, 'invite_reward', ?, '成功邀请好友注册奖励')`
        ).bind(crypto.randomUUID(), inviter.id, inviterBonus, inviterBalanceAfter, userId),
        env.DB.prepare(
          `INSERT INTO points_ledger (id, user_id, amount, balance_after, action_type, related_id, remark)
           VALUES (?, ?, ?, ?, 'invitee_bonus', ?, '通过好友邀请注册专属加赠')`
        ).bind(crypto.randomUUID(), userId, 50, initialPoints + 50, inviter.id)
      )
    }

    await env.DB.batch(stmts)

    // 创建会话 token
    const token = crypto.randomUUID() + '-' + crypto.randomUUID()
    const tokenHash = await sha256(token)
    const expiresAt = new Date(Date.now() + 30 * 24 * 60 * 60 * 1000).toISOString()

    await env.DB.prepare(
      `INSERT INTO sessions (id, user_id, token_hash, expires_at)
       VALUES (?, ?, ?, ?)`
    ).bind(crypto.randomUUID(), userId, tokenHash, expiresAt).run()

    return Response.json({
      token,
      user: {
        id: userId,
        account,
        displayName,
        role: 'member',
        points: initialPoints + (inviter ? 50 : 0),
        inviteCode: myInviteCode,
      }
    })
  }

  // POST /api/auth/login
  if (pathname === '/api/auth/login' && method === 'POST') {
    const body = await request.json().catch(() => ({}))
    const account = String(body.account || '').trim()
    const password = String(body.password || '').trim()

    const user = await env.DB.prepare(
      'SELECT id, account, display_name, password_salt, password_hash, role, points, invite_code FROM users WHERE account = ?'
    ).bind(account).first()

    if (!user) {
      return Response.json({ error: '账号或密码错误' }, { status: 401 })
    }

    const hash = await hashPassword(password, user.password_salt)
    if (hash !== user.password_hash) {
      return Response.json({ error: '账号或密码错误' }, { status: 401 })
    }

    const token = crypto.randomUUID() + '-' + crypto.randomUUID()
    const tokenHash = await sha256(token)
    const expiresAt = new Date(Date.now() + 30 * 24 * 60 * 60 * 1000).toISOString()

    await env.DB.prepare(
      `INSERT INTO sessions (id, user_id, token_hash, expires_at)
       VALUES (?, ?, ?, ?)`
    ).bind(crypto.randomUUID(), user.id, tokenHash, expiresAt).run()

    return Response.json({
      token,
      user: {
        id: user.id,
        account: user.account,
        displayName: user.display_name,
        role: user.role,
        points: user.points,
        inviteCode: user.invite_code,
      }
    })
  }

  // GET /api/auth/me
  if (pathname === '/api/auth/me' && method === 'GET') {
    const user = await getSessionUser(request, env)
    if (!user) return Response.json({ error: '未登录' }, { status: 401 })
    return Response.json({ user })
  }

  // POST /api/auth/logout
  if (pathname === '/api/auth/logout' && method === 'POST') {
    const authHeader = request.headers.get('authorization') || ''
    const token = authHeader.replace(/^Bearer\s+/i, '').trim()
    if (token) {
      const tokenHash = await sha256(token)
      await env.DB.prepare('DELETE FROM sessions WHERE token_hash = ?').bind(tokenHash).run()
    }
    return Response.json({ success: true })
  }

  return null
}
