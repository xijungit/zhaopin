import { getSessionUser } from './auth.js'

export async function handleResources(request, env, pathname) {
  const url = new URL(request.url)
  const method = request.method

  // GET /api/resources
  if (pathname === '/api/resources' && method === 'GET') {
    const q = (url.searchParams.get('q') || '').trim()
    const category = (url.searchParams.get('category') || '').trim()
    const limit = Math.min(parseInt(url.searchParams.get('limit') || '20', 10), 100)
    const offset = Math.max(parseInt(url.searchParams.get('offset') || '0', 10), 0)

    const user = await getSessionUser(request, env)
    let unlockedIds = new Set()
    if (user) {
      const unlocks = await env.DB.prepare(
        'SELECT target_id FROM user_unlocks WHERE user_id = ? AND target_type = "resource"'
      ).bind(user.user_id).all()
      unlockedIds = new Set((unlocks.results || []).map((u) => u.target_id))
    }

    let sql = 'SELECT * FROM resource_materials WHERE 1=1'
    const params = []

    if (q) {
      sql += ' AND (title LIKE ? OR description LIKE ?)'
      params.push(`%${q}%`, `%${q}%`)
    }
    if (category && category !== '全部') {
      sql += ' AND category = ?'
      params.push(category)
    }

    sql += ' ORDER BY created_at DESC LIMIT ? OFFSET ?'
    params.push(limit, offset)

    const { results } = await env.DB.prepare(sql).bind(...params).all()

    const formatted = (results || []).map((row) => {
      const isUnlocked = row.points_required === 0 || unlockedIds.has(row.id) || (user && user.role === 'admin')
      return {
        id: row.id,
        title: row.title,
        category: row.category,
        description: row.description,
        file_format: row.file_format,
        points_required: row.points_required,
        download_count: row.download_count,
        created_at: row.created_at,
        is_unlocked: isUnlocked,
        drive_url: isUnlocked ? row.drive_url : null,
        access_code: isUnlocked ? row.access_code : null,
      }
    })

    return Response.json({
      items: formatted,
      hasMore: formatted.length === limit,
    })
  }

  // POST /api/resources/:id/unlock
  const unlockMatch = pathname.match(/^\/api\/resources\/([^/]+)\/unlock$/)
  if (unlockMatch && method === 'POST') {
    const resId = unlockMatch[1]
    const user = await getSessionUser(request, env)
    if (!user) return Response.json({ error: '请先登录' }, { status: 401 })

    const resItem = await env.DB.prepare('SELECT * FROM resource_materials WHERE id = ?').bind(resId).first()
    if (!resItem) return Response.json({ error: '资料不存在' }, { status: 404 })

    const existing = await env.DB.prepare(
      'SELECT id FROM user_unlocks WHERE user_id = ? AND target_type = "resource" AND target_id = ?'
    ).bind(user.user_id, resId).first()

    if (existing) {
      return Response.json({
        success: true,
        is_unlocked: true,
        drive_url: resItem.drive_url,
        access_code: resItem.access_code,
      })
    }

    const pointsNeeded = resItem.points_required || 0
    if (user.points < pointsNeeded) {
      return Response.json({
        error: `积分不足，兑换该资料需要 ${pointsNeeded} 积分，当前剩余 ${user.points} 积分`,
        pointsNeeded,
        currentPoints: user.points,
      }, { status: 402 })
    }

    const balanceAfter = user.points - pointsNeeded
    await env.DB.batch([
      env.DB.prepare('UPDATE users SET points = ? WHERE id = ?').bind(balanceAfter, user.user_id),
      env.DB.prepare(
        `INSERT INTO points_ledger (id, user_id, amount, balance_after, action_type, related_id, remark)
         VALUES (?, ?, ?, ?, 'unlock_resource', ?, ?)`
      ).bind(crypto.randomUUID(), user.user_id, -pointsNeeded, balanceAfter, resId, `兑换求职资料《${resItem.title}》`),
      env.DB.prepare(
        `INSERT INTO user_unlocks (id, user_id, target_type, target_id, points_spent)
         VALUES (?, ?, 'resource', ?, ?)`
      ).bind(crypto.randomUUID(), user.user_id, resId, pointsNeeded),
      env.DB.prepare('UPDATE resource_materials SET download_count = download_count + 1 WHERE id = ?').bind(resId)
    ])

    return Response.json({
      success: true,
      is_unlocked: true,
      balance_after: balanceAfter,
      drive_url: resItem.drive_url,
      access_code: resItem.access_code,
    })
  }

  // GET /api/user/unlocks (我的已解锁资料与面经)
  if (pathname === '/api/user/unlocks' && method === 'GET') {
    const user = await getSessionUser(request, env)
    if (!user) return Response.json({ error: '未登录' }, { status: 401 })

    const unlocks = await env.DB.prepare(
      `SELECT u.*, 
        CASE 
          WHEN u.target_type = 'resource' THEN r.title 
          WHEN u.target_type = 'experience' THEN e.title 
        END as title,
        r.drive_url, r.access_code, r.file_format,
        e.company_name, e.round_tag
       FROM user_unlocks u
       LEFT JOIN resource_materials r ON u.target_type = 'resource' AND u.target_id = r.id
       LEFT JOIN interview_experiences e ON u.target_type = 'experience' AND u.target_id = e.id
       WHERE u.user_id = ?
       ORDER BY u.created_at DESC`
    ).bind(user.user_id).all()

    return Response.json({ items: unlocks.results || [] })
  }

  return null
}
