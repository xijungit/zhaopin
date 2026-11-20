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
    const isVip = !!(user && (user.is_treasure_vip || user.role === 'admin'))

    let unlockedIds = new Set()
    if (user && !isVip) {
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
      const isUnlocked = isVip || row.points_required === 0 || unlockedIds.has(row.id)
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
        is_vip_unlocked: isVip,
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

    // 藏宝阁 VIP 直接免积分解锁
    if (user.is_treasure_vip || user.role === 'admin') {
      return Response.json({
        success: true,
        isUnlocked: true,
        driveUrl: resItem.drive_url,
        accessCode: resItem.access_code,
        balanceAfter: user.points,
        isVipUnlocked: true,
      })
    }

    // 检查是否已解锁
    const already = await env.DB.prepare(
      'SELECT id FROM user_unlocks WHERE user_id = ? AND target_type = "resource" AND target_id = ?'
    ).bind(user.user_id, resId).first()

    if (already) {
      return Response.json({
        success: true,
        isUnlocked: true,
        driveUrl: resItem.drive_url,
        accessCode: resItem.access_code,
        balanceAfter: user.points,
      })
    }

    if (user.points < resItem.points_required) {
      return Response.json({
        error: `积分不足，下载需要 ${resItem.points_required} 积分，当前仅剩 ${user.points} 积分，请充值或开通藏宝阁会员`,
        insufficientPoints: true,
        pointsRequired: resItem.points_required,
        currentPoints: user.points,
      }, { status: 400 })
    }

    const balanceAfter = user.points - resItem.points_required
    const unlockId = crypto.randomUUID()
    const ledgerId = crypto.randomUUID()

    await env.DB.batch([
      env.DB.prepare('UPDATE users SET points = ? WHERE id = ?').bind(balanceAfter, user.user_id),
      env.DB.prepare(
        `INSERT INTO user_unlocks (id, user_id, target_type, target_id, points_spent)
         VALUES (?, ?, 'resource', ?, ?)`
      ).bind(unlockId, user.user_id, resId, resItem.points_required),
      env.DB.prepare(
        `INSERT INTO points_ledger (id, user_id, amount, balance_after, action_type, related_id, remark)
         VALUES (?, ?, ?, ?, 'unlock_resource', ?, ?)`
      ).bind(ledgerId, user.user_id, -resItem.points_required, balanceAfter, resId, `兑换资料《${resItem.title}》`)
    ])

    return Response.json({
      success: true,
      isUnlocked: true,
      driveUrl: resItem.drive_url,
      accessCode: resItem.access_code,
      balanceAfter,
    })
  }

  return null
}
