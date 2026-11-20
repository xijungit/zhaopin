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
      isTreasureVip: !!user.is_treasure_vip,
      treasureVipActivatedAt: user.treasure_vip_activated_at,
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

  // POST /api/pay/create (积分包充值)
  if (pathname === '/api/pay/create' && method === 'POST') {
    const user = await getSessionUser(request, env)
    if (!user) return Response.json({ error: '请先登录' }, { status: 401 })

    const body = await request.json().catch(() => ({}))
    const packageId = body.packageId
    const channel = body.channel || 'wechat'

    const pkg = PAY_PACKAGES.find((p) => p.id === packageId)
    if (!pkg) return Response.json({ error: '无效的充值套餐' }, { status: 400 })

    const orderId = 'ORD_' + Date.now() + '_' + Math.random().toString(36).substring(2, 8).toUpperCase()
    const qrCodeUrl = channel === 'alipay' ? '/assets/pay_alipay_99.jpg' : '/assets/pay_wechat_99.png'

    await env.DB.prepare(
      `INSERT INTO payment_orders (id, user_id, points, amount_cents, channel, status, qr_code_url, order_type)
       VALUES (?, ?, ?, ?, ?, 'pending', ?, 'points')`
    ).bind(orderId, user.user_id, pkg.points, pkg.amountCents, channel, qrCodeUrl).run()

    return Response.json({
      orderId,
      points: pkg.points,
      amountCents: pkg.amountCents,
      qrCodeUrl,
      channel,
      status: 'pending',
      orderType: 'points',
    })
  }

  // POST /api/pay/treasure-vip (9.9元激活藏宝阁专属会员)
  if (pathname === '/api/pay/treasure-vip' && method === 'POST') {
    const user = await getSessionUser(request, env)
    if (!user) return Response.json({ error: '请先登录' }, { status: 401 })

    const body = await request.json().catch(() => ({}))
    const channel = body.channel || 'wechat'
    const orderId = 'VIP_' + Date.now() + '_' + Math.random().toString(36).substring(2, 8).toUpperCase()
    const qrCodeUrl = channel === 'alipay' ? '/assets/pay_alipay_99.jpg' : '/assets/pay_wechat_99.png'
    const amountCents = 990 // 9.90 元

    await env.DB.prepare(
      `INSERT INTO payment_orders (id, user_id, points, amount_cents, channel, status, qr_code_url, order_type)
       VALUES (?, ?, 990, ?, ?, 'pending', ?, 'treasure_vip')`
    ).bind(orderId, user.user_id, amountCents, channel, qrCodeUrl).run()

    return Response.json({
      orderId,
      amountCents,
      amountYuan: '9.9',
      qrCodeUrl,
      channel,
      status: 'pending',
      orderType: 'treasure_vip',
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
      orderType: order.order_type || 'points',
    })
  }

  // POST /api/pay/self-confirm (用户自主确认支付完成)
  if (pathname === '/api/pay/self-confirm' && method === 'POST') {
    const user = await getSessionUser(request, env)
    if (!user) return Response.json({ error: '请先登录' }, { status: 401 })

    let body = {}
    try { body = await request.json() } catch {}
    const orderId = body.orderId
    if (!orderId) return Response.json({ error: '缺少 orderId' }, { status: 400 })

    const order = await env.DB.prepare('SELECT * FROM payment_orders WHERE id = ?').bind(orderId).first()
    if (!order) return Response.json({ error: '订单不存在' }, { status: 404 })
    if (order.user_id !== user.user_id) return Response.json({ error: '无权操作此订单' }, { status: 403 })

    if (order.status === 'paid') {
      return Response.json({ success: true, message: '已经开通', isPaid: true, orderType: order.order_type })
    }

    const orderType = order.order_type || 'points'

    if (orderType === 'treasure_vip') {
      // 激活藏宝阁终身 VIP 权益
      await env.DB.batch([
        env.DB.prepare(
          'UPDATE payment_orders SET status = "paid", paid_at = CURRENT_TIMESTAMP, channel_trade_no = "SELF_CONFIRMED" WHERE id = ?'
        ).bind(orderId),
        env.DB.prepare(
          'UPDATE users SET is_treasure_vip = 1, treasure_vip_activated_at = CURRENT_TIMESTAMP WHERE id = ?'
        ).bind(order.user_id),
        env.DB.prepare(
          `INSERT INTO points_ledger (id, user_id, amount, balance_after, action_type, related_id, remark)
           VALUES (?, ?, 0, (SELECT points FROM users WHERE id = ?), 'treasure_vip_activation', ?, '9.9元自助激活藏宝阁终身会员权益')`
        ).bind(crypto.randomUUID(), order.user_id, order.user_id, orderId)
      ])
      return Response.json({ success: true, isPaid: true, isTreasureVip: true, orderType })
    } else {
      // 普通积分充值
      const dbUser = await env.DB.prepare('SELECT id, points FROM users WHERE id = ?').bind(order.user_id).first()
      const balanceAfter = (dbUser ? dbUser.points : 0) + order.points

      await env.DB.batch([
        env.DB.prepare(
          'UPDATE payment_orders SET status = "paid", paid_at = CURRENT_TIMESTAMP, channel_trade_no = "SELF_CONFIRMED" WHERE id = ?'
        ).bind(orderId),
        env.DB.prepare('UPDATE users SET points = ? WHERE id = ?').bind(balanceAfter, order.user_id),
        env.DB.prepare(
          `INSERT INTO points_ledger (id, user_id, amount, balance_after, action_type, related_id, remark)
           VALUES (?, ?, ?, ?, 'recharge', ?, ?)`
        ).bind(crypto.randomUUID(), order.user_id, order.points, balanceAfter, orderId, `在线充值到账 ${order.points} 积分 (自助确认)`)
      ])
      return Response.json({ success: true, isPaid: true, balanceAfter, orderType })
    }
  }

  // GET/POST /api/pay/mock-complete (开发调试模拟支付完成)
  if (pathname === '/api/pay/mock-complete') {
    let body = {}
    if (method === 'POST') { try { body = await request.json() } catch {} }
    const orderId = url.searchParams.get('orderId') || body.orderId
    const order = await env.DB.prepare('SELECT * FROM payment_orders WHERE id = ?').bind(orderId).first()
    if (!order) return Response.json({ error: '订单不存在' }, { status: 404 })

    if (order.status === 'paid') {
      return Response.json({ success: true, message: '已经支付', isPaid: true, orderType: order.order_type })
    }

    const orderType = order.order_type || 'points'

    if (orderType === 'treasure_vip') {
      // 激活藏宝阁终身 VIP 权益
      await env.DB.batch([
        env.DB.prepare(
          'UPDATE payment_orders SET status = "paid", paid_at = CURRENT_TIMESTAMP WHERE id = ?'
        ).bind(orderId),
        env.DB.prepare(
          'UPDATE users SET is_treasure_vip = 1, treasure_vip_activated_at = CURRENT_TIMESTAMP WHERE id = ?'
        ).bind(order.user_id),
        env.DB.prepare(
          `INSERT INTO points_ledger (id, user_id, amount, balance_after, action_type, related_id, remark)
           VALUES (?, ?, 0, (SELECT points FROM users WHERE id = ?), 'treasure_vip_activation', ?, '9.9元激活藏宝阁终身会员权益')`
        ).bind(crypto.randomUUID(), order.user_id, order.user_id, orderId)
      ])
      return Response.json({ success: true, isPaid: true, isTreasureVip: true, orderType })
    } else {
      // 普通积分充值
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
      return Response.json({ success: true, isPaid: true, balanceAfter, orderType })
    }
  }

  // POST /api/points/redeem (卡密兑换 - 具备乐观锁防刷与事务补偿回滚)
  if (pathname === '/api/points/redeem' && method === 'POST') {
    const user = await getSessionUser(request, env)
    if (!user) return Response.json({ error: '请先登录' }, { status: 401 })

    const body = await request.json().catch(() => ({}))
    const rawCode = String(body.code || '').trim().toUpperCase()

    if (!rawCode) return Response.json({ error: '请输入卡密兑换码' }, { status: 400 })

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

    const updateResult = await env.DB.prepare(
      `UPDATE redemption_codes 
       SET status = 'used', used_by = ?, used_at = CURRENT_TIMESTAMP 
       WHERE code = ? AND status = 'unused'`
    ).bind(user.user_id, rawCode).run()

    if (updateResult.meta.changes === 0) {
      return Response.json({ error: '手慢了，该卡密刚刚已被他人兑换！' }, { status: 409 })
    }

    const newBalance = user.points + card.points
    try {
      await env.DB.batch([
        env.DB.prepare('UPDATE users SET points = ? WHERE id = ?').bind(newBalance, user.user_id),
        env.DB.prepare(
          `INSERT INTO points_ledger (id, user_id, amount, balance_after, action_type, related_id, remark)
           VALUES (?, ?, ?, ?, 'redeem_code', ?, ?)`
        ).bind(crypto.randomUUID(), user.user_id, card.points, newBalance, card.id, `兑换卡密 [${card.batch_id}] 获得 ${card.points} 积分`)
      ])
    } catch (err) {
      await env.DB.prepare(
        "UPDATE redemption_codes SET status = 'unused', used_by = NULL, used_at = NULL WHERE code = ?"
      ).bind(rawCode).run()
      return Response.json({ error: '兑换入账异常，已自动回滚卡密状态，请重试' }, { status: 500 })
    }

    return Response.json({
      success: true,
      pointsAdded: card.points,
      balanceAfter: newBalance,
      message: `🎉 成功兑换 ${card.points} 积分！`,
    })
  }

  return null
}
