import { getSessionUser } from './auth.js'

export const PAY_PACKAGES = [
  { id: 'pkg_10', points: 500, amountCents: 1000, label: '体验包 (500积分)', desc: '可解锁约25~50篇名企面经' },
  { id: 'pkg_20', points: 1200, amountCents: 2000, label: '热门包 (1200积分)', desc: '赠送200积分，全套笔试真题任选', popular: true },
  { id: 'pkg_50', points: 3500, amountCents: 5000, label: '冲刺包 (3500积分)', desc: '赠送1000积分，秋招春招终身无忧' },
]

export async function handlePoints(request, env, pathname) {
  const url = new URL(request.url)
  const method = request.method

  // GET /api/points/me
  if (pathname === '/api/points/me' && method === 'GET') {
    const user = await getSessionUser(request, env)
    if (!user) return Response.json({ error: '未登录' }, { status: 401 })

    const invitedCount = await env.DB.prepare(
      'SELECT count(*) as count FROM users WHERE referred_by = ?'
    ).bind(user.user_id).first()

    const unlocksCount = await env.DB.prepare(
      'SELECT count(*) as count FROM user_unlocks WHERE user_id = ?'
    ).bind(user.user_id).first()

    return Response.json({
      points: user.points,
      inviteCode: user.invite_code,
      invitedCount: invitedCount ? invitedCount.count : 0,
      unlocksCount: unlocksCount ? unlocksCount.count : 0,
    })
  }

  // GET /api/points/ledger
  if (pathname === '/api/points/ledger' && method === 'GET') {
    const user = await getSessionUser(request, env)
    if (!user) return Response.json({ error: '未登录' }, { status: 401 })

    const { results } = await env.DB.prepare(
      'SELECT * FROM points_ledger WHERE user_id = ? ORDER BY created_at DESC LIMIT 50'
    ).bind(user.user_id).all()

    return Response.json({ items: results || [] })
  }

  // GET /api/pay/plans
  if (pathname === '/api/pay/plans' && method === 'GET') {
    return Response.json({ packages: PAY_PACKAGES })
  }

  // POST /api/pay/create
  if (pathname === '/api/pay/create' && method === 'POST') {
    const user = await getSessionUser(request, env)
    if (!user) return Response.json({ error: '请先登录' }, { status: 401 })

    const body = await request.json().catch(() => ({}))
    const packageId = body.packageId
    const channel = body.channel || 'wechat'

    const pkg = PAY_PACKAGES.find((p) => p.id === packageId)
    if (!pkg) return Response.json({ error: '无效的充值套餐' }, { status: 400 })

    const orderId = 'ORD_' + Date.now() + '_' + Math.random().toString(36).substring(2, 8).toUpperCase()

    // 模拟或真实支付二维码
    const qrCodeUrl = `https://api.qrserver.com/v1/create-qr-code/?size=250x250&data=pay:${orderId}`

    await env.DB.prepare(
      `INSERT INTO payment_orders (id, user_id, points, amount_cents, channel, status, qr_code_url)
       VALUES (?, ?, ?, ?, ?, 'pending', ?)`
    ).bind(orderId, user.user_id, pkg.points, pkg.amountCents, channel, qrCodeUrl).run()

    return Response.json({
      orderId,
      points: pkg.points,
      amountCents: pkg.amountCents,
      qrCodeUrl,
      channel,
      status: 'pending',
    })
  }

  // GET /api/pay/query
  if (pathname === '/api/pay/query' && method === 'GET') {
    const orderId = url.searchParams.get('orderId')
    if (!orderId) return Response.json({ error: '缺少 orderId' }, { status: 400 })

    const order = await env.DB.prepare('SELECT * FROM payment_orders WHERE id = ?').bind(orderId).first()
    if (!order) return Response.json({ error: '订单不存在' }, { status: 404 })

    return Response.json({
      orderId: order.id,
      status: order.status,
      isPaid: order.status === 'paid',
      points: order.points,
    })
  }

  // GET /api/pay/mock-complete (开发调试模拟支付)
  if (pathname === '/api/pay/mock-complete') {
    const orderId = url.searchParams.get('orderId')
    const order = await env.DB.prepare('SELECT * FROM payment_orders WHERE id = ?').bind(orderId).first()
    if (!order) return Response.json({ error: '订单不存在' }, { status: 404 })

    if (order.status === 'paid') {
      return Response.json({ success: true, message: '已经支付' })
    }

    const user = await env.DB.prepare('SELECT id, points FROM users WHERE id = ?').bind(order.user_id).first()
    const balanceAfter = (user ? user.points : 0) + order.points

    await env.DB.batch([
      env.DB.prepare(
        'UPDATE payment_orders SET status = "paid", paid_at = CURRENT_TIMESTAMP WHERE id = ?'
      ).bind(orderId),
      env.DB.prepare('UPDATE users SET points = ? WHERE id = ?').bind(balanceAfter, order.user_id),
      env.DB.prepare(
        `INSERT INTO points_ledger (id, user_id, amount, balance_after, action_type, related_id, remark)
         VALUES (?, ?, ?, ?, 'recharge', ?, ?)`
      ).bind(crypto.randomUUID(), order.user_id, order.points, balanceAfter, orderId, `在线充值到账 ${order.points} 积分`)
    ])

    return Response.json({ success: true, isPaid: true, balanceAfter })
  }

  // POST /api/points/redeem (卡密兑换 - 具备乐观锁防刷与事务补偿回滚)
  if (pathname === '/api/points/redeem' && method === 'POST') {
    const user = await getSessionUser(request, env)
    if (!user) return Response.json({ error: '请先登录' }, { status: 401 })

    const body = await request.json().catch(() => ({}))
    const rawCode = String(body.code || '').trim().toUpperCase()

    if (!rawCode) return Response.json({ error: '请输入卡密兑换码' }, { status: 400 })

    // 1. 查询卡密
    const card = await env.DB.prepare('SELECT * FROM redemption_codes WHERE code = ?').bind(rawCode).first()
    if (!card) {
      return Response.json({ error: '卡密不存在或输入有误，请核对后重试' }, { status: 404 })
    }
    if (card.status !== 'unused') {
      return Response.json({ error: '该卡密已被兑换或已作废' }, { status: 400 })
    }
    if (card.expires_at && new Date(card.expires_at) < new Date()) {
      return Response.json({ error: '该卡密已过期' }, { status: 400 })
    }

    // 2. 乐观锁占位
    const updateResult = await env.DB.prepare(
      `UPDATE redemption_codes 
       SET status = 'used', used_by = ?, used_at = CURRENT_TIMESTAMP 
       WHERE code = ? AND status = 'unused'`
    ).bind(user.user_id, rawCode).run()

    if (!updateResult.meta.changes) {
      return Response.json({ error: '卡密已被他人兑换，请勿重复提交' }, { status: 409 })
    }

    // 3. 为用户增加积分与账本流水
    const balanceAfter = user.points + card.points
    try {
      await env.DB.batch([
        env.DB.prepare('UPDATE users SET points = ? WHERE id = ?').bind(balanceAfter, user.user_id),
        env.DB.prepare(
          `INSERT INTO points_ledger (id, user_id, amount, balance_after, action_type, related_id, remark)
           VALUES (?, ?, ?, ?, 'code_redeem', ?, ?)`
        ).bind(crypto.randomUUID(), user.user_id, card.points, balanceAfter, card.id, `卡密兑换到账 ${card.points} 积分`)
      ])
    } catch (err) {
      // 4. 异常补偿回滚：还原卡密状态为 unused，彻底杜绝吞码！
      await env.DB.prepare(
        `UPDATE redemption_codes 
         SET status = 'unused', used_by = NULL, used_at = NULL 
         WHERE code = ? AND status = 'used' AND used_by = ?`
      ).bind(rawCode, user.user_id).run()

      return Response.json({ error: '系统入账异常，已自动回滚卡密状态，请重试' }, { status: 500 })
    }

    return Response.json({
      success: true,
      pointsAdded: card.points,
      balanceAfter,
      message: `成功兑换 ${card.points} 积分！`,
    })
  }

  return null
}
