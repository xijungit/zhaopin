import { getSessionUser } from './auth.js'

export async function handleExperiences(request, env, pathname) {
  const url = new URL(request.url)
  const method = request.method

  // GET /api/experiences
  if (pathname === '/api/experiences' && method === 'GET') {
    const q = (url.searchParams.get('q') || '').trim()
    const company = (url.searchParams.get('company') || '').trim()
    const questionType = (url.searchParams.get('questionType') || '').trim()
    const limit = Math.min(parseInt(url.searchParams.get('limit') || '20', 10), 100)
    const offset = Math.max(parseInt(url.searchParams.get('offset') || '0', 10), 0)

    const user = await getSessionUser(request, env)
    const isVip = !!(user && (user.is_treasure_vip || user.role === 'admin'))

    let unlockedIds = new Set()
    if (user && !isVip) {
      const unlocks = await env.DB.prepare(
        'SELECT target_id FROM user_unlocks WHERE user_id = ? AND target_type = "experience"'
      ).bind(user.user_id).all()
      unlockedIds = new Set((unlocks.results || []).map((u) => u.target_id))
    }

    let sql = 'SELECT * FROM interview_experiences WHERE 1=1'
    const params = []

    if (q) {
      sql += ' AND (title LIKE ? OR company_name LIKE ? OR summary LIKE ?)'
      params.push(`%${q}%`, `%${q}%`, `%${q}%`)
    }
    if (company && company !== '全部') {
      sql += ' AND company_name = ?'
      params.push(company)
    }
    if (questionType && questionType !== '全部') {
      sql += ' AND question_type = ?'
      params.push(questionType)
    }

    sql += ' ORDER BY created_at DESC LIMIT ? OFFSET ?'
    params.push(limit, offset)

    const { results } = await env.DB.prepare(sql).bind(...params).all()

    const formatted = (results || []).map((row) => {
      const isUnlocked = isVip || row.points_required === 0 || unlockedIds.has(row.id)
      return {
        id: row.id,
        title: row.title,
        company_name: row.company_name,
        position_type: row.position_type,
        round_tag: row.round_tag,
        question_type: row.question_type,
        summary: row.summary,
        points_required: row.points_required,
        source_platform: row.source_platform,
        view_count: row.view_count,
        created_at: row.created_at,
        is_unlocked: isUnlocked,
        is_vip_unlocked: isVip,
        detail_content: isUnlocked ? row.detail_content : null,
      }
    })

    return Response.json({
      items: formatted,
      hasMore: formatted.length === limit,
    })
  }

  // GET /api/experiences/:id
  const detailMatch = pathname.match(/^\/api\/experiences\/([^/]+)$/)
  if (detailMatch && method === 'GET') {
    const expId = detailMatch[1]
    const user = await getSessionUser(request, env)
    const isVip = !!(user && (user.is_treasure_vip || user.role === 'admin'))

    const exp = await env.DB.prepare('SELECT * FROM interview_experiences WHERE id = ?').bind(expId).first()
    if (!exp) return Response.json({ error: '面经不存在' }, { status: 404 })

    let isUnlocked = isVip || exp.points_required === 0
    if (user && !isUnlocked) {
      const unlock = await env.DB.prepare(
        'SELECT id FROM user_unlocks WHERE user_id = ? AND target_type = "experience" AND target_id = ?'
      ).bind(user.user_id, expId).first()
      if (unlock) isUnlocked = true
    }

    // 更新阅读数
    await env.DB.prepare('UPDATE interview_experiences SET view_count = view_count + 1 WHERE id = ?').bind(expId).run()

    return Response.json({
      item: {
        ...exp,
        is_unlocked: isUnlocked,
        is_vip_unlocked: isVip,
        detail_content: isUnlocked ? exp.detail_content : null,
      }
    })
  }

  // POST /api/experiences/:id/unlock
  const unlockMatch = pathname.match(/^\/api\/experiences\/([^/]+)\/unlock$/)
  if (unlockMatch && method === 'POST') {
    const expId = unlockMatch[1]
    const user = await getSessionUser(request, env)
    if (!user) return Response.json({ error: '请先登录' }, { status: 401 })

    const exp = await env.DB.prepare('SELECT * FROM interview_experiences WHERE id = ?').bind(expId).first()
    if (!exp) return Response.json({ error: '面经不存在' }, { status: 404 })

    // 藏宝阁 VIP 直接全场免积分解锁
    if (user.is_treasure_vip || user.role === 'admin') {
      return Response.json({
        success: true,
        isUnlocked: true,
        detailContent: exp.detail_content,
        balanceAfter: user.points,
        isVipUnlocked: true,
      })
    }

    // 检查是否已解锁
    const already = await env.DB.prepare(
      'SELECT id FROM user_unlocks WHERE user_id = ? AND target_type = "experience" AND target_id = ?'
    ).bind(user.user_id, expId).first()

    if (already) {
      return Response.json({
        success: true,
        isUnlocked: true,
        detailContent: exp.detail_content,
        balanceAfter: user.points,
      })
    }

    // 积分判断
    if (user.points < exp.points_required) {
      return Response.json({
        error: `积分不足，解锁需要 ${exp.points_required} 积分，当前仅剩 ${user.points} 积分，请充值或开通藏宝阁会员`,
        insufficientPoints: true,
        pointsRequired: exp.points_required,
        currentPoints: user.points,
      }, { status: 400 })
    }

    const balanceAfter = user.points - exp.points_required
    const unlockId = crypto.randomUUID()
    const ledgerId = crypto.randomUUID()

    // 事务扣积分并记录解锁
    await env.DB.batch([
      env.DB.prepare('UPDATE users SET points = ? WHERE id = ?').bind(balanceAfter, user.user_id),
      env.DB.prepare(
        `INSERT INTO user_unlocks (id, user_id, target_type, target_id, points_spent)
         VALUES (?, ?, 'experience', ?, ?)`
      ).bind(unlockId, user.user_id, expId, exp.points_required),
      env.DB.prepare(
        `INSERT INTO points_ledger (id, user_id, amount, balance_after, action_type, related_id, remark)
         VALUES (?, ?, ?, ?, 'unlock_experience', ?, ?)`
      ).bind(ledgerId, user.user_id, -exp.points_required, balanceAfter, expId, `解锁面经《${exp.title}》`)
    ])

    return Response.json({
      success: true,
      isUnlocked: true,
      detailContent: exp.detail_content,
      balanceAfter,
    })
  }

  return null
}
