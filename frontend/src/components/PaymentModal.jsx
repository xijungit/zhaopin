import { useState, useEffect } from 'react'
import { apiClient } from '../apiClient.js'

export function PaymentModal({ onClose, onSuccess, onToast }) {
  const [tab, setTab] = useState('recharge') // 'recharge' | 'redeem'
  
  // 充值状态
  const [plans, setPlans] = useState([])
  const [selectedPkgId, setSelectedPkgId] = useState('')
  const [channel, setChannel] = useState('wechat')
  const [step, setStep] = useState('select') // 'select' | 'pay' | 'success'
  const [loading, setLoading] = useState(false)
  const [order, setOrder] = useState(null)
  const [error, setError] = useState('')

  // 卡密兑换状态
  const [redeemCode, setRedeemCode] = useState('')
  const [redeemLoading, setRedeemLoading] = useState(false)
  const [redeemMsg, setRedeemMsg] = useState('')

  useEffect(() => {
    apiClient.getPayPlans().then((res) => {
      const pkgs = res.packages || []
      setPlans(pkgs)
      if (pkgs.length) setSelectedPkgId(pkgs[1]?.id || pkgs[0].id)
    }).catch((err) => setError(err.message))
  }, [])

  // 轮询订单支付结果
  useEffect(() => {
    if (step !== 'pay' || !order?.orderId) return
    const timer = setInterval(async () => {
      try {
        const res = await apiClient.queryPayOrder(order.orderId)
        if (res.isPaid) {
          clearInterval(timer)
          setStep('success')
          onSuccess(res.points)
        }
      } catch {}
    }, 1500)
    return () => clearInterval(timer)
  }, [step, order, onSuccess])

  const handleCreateOrder = async () => {
    if (!selectedPkgId) return
    setLoading(true)
    setError('')
    try {
      const res = await apiClient.createPayOrder({ packageId: selectedPkgId, channel })
      setOrder(res)
      setStep('pay')
    } catch (err) {
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }

  const handleMockPay = async () => {
    if (!order?.orderId) return
    setLoading(true)
    try {
      const res = await apiClient.mockPayComplete(order.orderId)
      if (res.isPaid) {
        setStep('success')
        onSuccess(order.points)
      }
    } catch (err) {
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }

  const handleRedeem = async (e) => {
    e.preventDefault()
    if (!redeemCode.trim()) return
    setRedeemLoading(true)
    setRedeemMsg('')
    try {
      const res = await apiClient.redeemPoints(redeemCode.trim())
      onSuccess(res.pointsAdded)
      onToast(`🎉 ${res.message}`)
      onClose()
    } catch (err) {
      setRedeemMsg(err.message || '卡密兑换失败')
    } finally {
      setRedeemLoading(false)
    }
  }

  return (
    <div className="modal-backdrop" onClick={onClose}>
      <div className="modal-sheet" onClick={(e) => e.stopPropagation()}>
        <div className="modal-header">
          <div className="modal-tabs">
            <button
              className={`modal-tab ${tab === 'recharge' ? 'active' : ''}`}
              onClick={() => setTab('recharge')}
            >
              在线充值
            </button>
            <button
              className={`modal-tab ${tab === 'redeem' ? 'active' : ''}`}
              onClick={() => setTab('redeem')}
            >
              卡密兑换 (闲鱼/淘宝)
            </button>
          </div>
          <button className="modal-close" onClick={onClose}>✕</button>
        </div>

        {tab === 'recharge' ? (
          <div className="modal-body recharge-body">
            {step === 'select' && (
              <>
                <div className="plans-grid">
                  {plans.map((pkg) => (
                    <div
                      key={pkg.id}
                      className={`plan-card ${selectedPkgId === pkg.id ? 'active' : ''} ${pkg.popular ? 'popular' : ''}`}
                      onClick={() => setSelectedPkgId(pkg.id)}
                    >
                      {pkg.popular && <span className="badge-corner">超值推荐</span>}
                      <div className="plan-points">{pkg.points} 积分</div>
                      <div className="plan-price">¥ {(pkg.amountCents / 100).toFixed(0)}</div>
                      <div className="plan-desc">{pkg.desc}</div>
                    </div>
                  ))}
                </div>

                <div className="channel-select">
                  <label className={`channel-item ${channel === 'wechat' ? 'active' : ''}`}>
                    <input type="radio" name="pay_ch" checked={channel === 'wechat'} onChange={() => setChannel('wechat')} />
                    <span>🟢 微信支付</span>
                  </label>
                  <label className={`channel-item ${channel === 'alipay' ? 'active' : ''}`}>
                    <input type="radio" name="pay_ch" checked={channel === 'alipay'} onChange={() => setChannel('alipay')} />
                    <span>🔵 支付宝</span>
                  </label>
                </div>

                {error && <div className="error-tip">{error}</div>}

                <button
                  className="btn-primary btn-block btn-pay-now"
                  disabled={loading || !selectedPkgId}
                  onClick={handleCreateOrder}
                >
                  {loading ? '正在创建订单...' : '立即支付'}
                </button>
              </>
            )}

            {step === 'pay' && order && (
              <div className="pay-qr-box">
                <div className="qr-title">请使用{channel === 'wechat' ? '微信' : '支付宝'}扫码支付</div>
                <div className="qr-amount">¥ {(order.amountCents / 100).toFixed(2)}</div>
                <div className="qr-img-wrap">
                  <img src={order.qrCodeUrl} alt="支付二维码" />
                </div>
                <div className="qr-order-id">订单号: {order.orderId}</div>

                <button className="btn-success btn-mock-pay" onClick={handleMockPay} disabled={loading}>
                  {loading ? '处理中...' : '模拟支付成功 (开发者调试)'}
                </button>
                <button className="btn-secondary" onClick={() => setStep('select')}>
                  返回重选
                </button>
              </div>
            )}

            {step === 'success' && (
              <div className="pay-success-box">
                <div className="success-icon">🎉</div>
                <h3>充值成功！</h3>
                <p>获得积分已实时到账，可直接用于解锁面经与题库。</p>
                <button className="btn-primary" onClick={onClose}>完成</button>
              </div>
            )}
          </div>
        ) : (
          <div className="modal-body redeem-body">
            <div className="redeem-guide">
              💡 在淘宝、闲鱼或合作发卡平台购买卡密后，在下方输入 16 位卡密（如 <code>ZPIN-XXXX-XXXX-XXXX</code>）即可秒级兑换。
            </div>

            <form onSubmit={handleRedeem} className="redeem-form">
              <input
                type="text"
                placeholder="请输入 ZPIN-XXXX-XXXX-XXXX"
                value={redeemCode}
                onChange={(e) => setRedeemCode(e.target.value.toUpperCase())}
                className="input-code"
                autoFocus
              />
              {redeemMsg && <div className="error-tip">{redeemMsg}</div>}
              <button
                type="submit"
                className="btn-primary btn-block"
                disabled={redeemLoading || !redeemCode.trim()}
              >
                {redeemLoading ? '核销中...' : '立即兑换到账'}
              </button>
            </form>
          </div>
        )}
      </div>
    </div>
  )
}
