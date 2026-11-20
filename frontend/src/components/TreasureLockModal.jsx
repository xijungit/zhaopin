import { useState, useEffect } from 'react'
import { apiClient } from '../apiClient.js'

export function TreasureLockModal({ isOpen, onClose, onSuccess, currentUser, onOpenLogin }) {
  if (!isOpen) return null

  const [channel, setChannel] = useState('wechat')
  const [loading, setLoading] = useState(false)
  const [order, setOrder] = useState(null)
  const [step, setStep] = useState('dialog') // 'dialog' | 'pay' | 'success'
  const [error, setError] = useState('')

  // 轮询订单支付状态
  useEffect(() => {
    if (step !== 'pay' || !order?.orderId) return
    const timer = setInterval(async () => {
      try {
        const res = await apiClient.queryPayOrder(order.orderId)
        if (res.isPaid) {
          clearInterval(timer)
          setStep('success')
          if (onSuccess) onSuccess()
        }
      } catch {}
    }, 2000)
    return () => clearInterval(timer)
  }, [step, order, onSuccess])

  const handleStartPay = async () => {
    if (!currentUser) {
      if (onOpenLogin) onOpenLogin()
      return
    }
    setLoading(true)
    setError('')
    try {
      const res = await apiClient.createTreasureVipOrder({ channel })
      setOrder(res)
      setStep('pay')
    } catch (err) {
      setError(err.message || '创建订单失败')
    } finally {
      setLoading(false)
    }
  }

  const handleConfirmPay = async () => {
    if (!order?.orderId) return
    setLoading(true)
    setError('')
    try {
      const res = await apiClient.selfConfirmPayOrder(order.orderId)
      if (res.isPaid) {
        setStep('success')
        if (onSuccess) onSuccess()
      }
    } catch (err) {
      setError(err.message || '开通失败，请稍后重试')
    } finally {
      setLoading(false)
    }
  }

  const currentQrUrl = channel === 'alipay' ? '/assets/pay_alipay_99.jpg' : '/assets/pay_wechat_99.png'

  return (
    <div className="modal-backdrop treasure-modal-backdrop" onClick={onClose}>
      <div className="modal-sheet treasure-modal-sheet" onClick={(e) => e.stopPropagation()}>
        <button className="modal-close treasure-modal-close" onClick={onClose}>✕</button>

        {step === 'dialog' && (
          <div className="treasure-lock-container">
            {/* 卡通萌龙吉祥物与动效光环 */}
            <div className="mascot-stage">
              <div className="mascot-aura"></div>
              <div className="mascot-glow-ring"></div>
              <img
                src="/assets/dragon_mascot.jpg"
                alt="藏宝阁守护神兽小蓝龙"
                className="mascot-avatar-img dragon-animated"
              />
              <div className="mascot-tag">🏰 藏宝阁机缘守护使</div>
            </div>

            {/* 专属台词文案对话气泡 */}
            <div className="dragon-speech-bubble">
              <div className="bubble-arrow"></div>
              <p className="bubble-quote">
                “你是否希望用 <strong>9.9 元</strong> 激活藏宝阁？这 9.9 元不是买卖，是你开启财富法门的钥匙。买不了吃亏，买不了上当，只为筛选有缘人。”
              </p>
            </div>

            {/* 会员专属特权清单 */}
            <div className="treasure-perks-box">
              <div className="perk-title">👑 开通藏宝阁永久 VIP 特权</div>
              <div className="perk-item">
                <span className="perk-icon">💡</span>
                <div className="perk-text">
                  <strong>名企深度面经复盘</strong>
                  <span>大厂高频真题、核心考点、避坑建议全流程免积分畅读（原需5积分/篇）</span>
                </div>
              </div>
              <div className="perk-item">
                <span className="perk-icon">📚</span>
                <div className="perk-text">
                  <strong>校招通关真题题库</strong>
                  <span>各大厂笔试试卷、在线评测真题解析、网盘资源免积分下载（原需10积分/套）</span>
                </div>
              </div>
              <div className="perk-item">
                <span className="perk-icon">♾️</span>
                <div className="perk-text">
                  <strong>一次激活，终身畅享</strong>
                  <span>告别繁琐单篇兑换，后续持续更新的所有名企求职秘籍全部免费查阅！</span>
                </div>
              </div>
            </div>

            {error && <div className="auth-error-banner">{error}</div>}

            {/* 支付操作通道 */}
            <div className="treasure-action-bar">
              <div className="treasure-price-tag">
                <span className="price-label">结缘价：</span>
                <span className="price-currency">¥</span>
                <span className="price-number">9.9</span>
                <span className="price-original">原价 ¥99</span>
              </div>

              <div className="pay-channel-pills">
                <button
                  type="button"
                  className={`channel-pill ${channel === 'wechat' ? 'active' : ''}`}
                  onClick={() => setChannel('wechat')}
                >
                  🟢 微信支付
                </button>
                <button
                  type="button"
                  className={`channel-pill ${channel === 'alipay' ? 'active' : ''}`}
                  onClick={() => setChannel('alipay')}
                >
                  🔵 支付宝
                </button>
              </div>

              <button
                className="btn-unlock-treasure"
                onClick={handleStartPay}
                disabled={loading}
              >
                {loading ? '正在唤醒龙神法门...' : '🪙 9.9 元立即结缘激活'}
              </button>
            </div>
          </div>
        )}

        {step === 'pay' && order && (
          <div className="treasure-pay-stage">
            <div className="pay-header">
              <div className="pay-mascot-sm">
                <img src="/assets/dragon_mascot.jpg" alt="小蓝龙" className="dragon-mini" />
                <span className="pay-title">正在开启藏宝阁法门...</span>
              </div>
              <div className="pay-amount-display">
                应付金额：<span className="big-amount">¥9.90</span>
              </div>
            </div>

            {/* 支付渠道随时一键切换 */}
            <div className="pay-channel-pills pay-stage-pills">
              <button
                type="button"
                className={`channel-pill ${channel === 'wechat' ? 'active' : ''}`}
                onClick={() => setChannel('wechat')}
              >
                🟢 微信支付
              </button>
              <button
                type="button"
                className={`channel-pill ${channel === 'alipay' ? 'active' : ''}`}
                onClick={() => setChannel('alipay')}
              >
                🔵 支付宝
              </button>
            </div>

            <div className="qr-box">
              <img
                src={currentQrUrl}
                alt={channel === 'wechat' ? '微信收款码' : '支付宝收款码'}
                className="qr-img"
              />
              <div className="qr-hint">
                {channel === 'wechat' ? '请使用手机微信扫一扫完成支付' : '请使用手机支付宝扫一扫完成支付'}
              </div>
              <div className="qr-pay-tip">
                💡 扫码将直接显示预设金额 <strong>¥9.90</strong>，付款后请点击下方按钮激活
              </div>
              <div className="qr-order-no">订单号：{order.orderId}</div>
            </div>

            {error && <div className="auth-error-banner">{error}</div>}

            <div className="self-confirm-wrap">
              <button className="btn-confirm-pay" onClick={handleConfirmPay} disabled={loading}>
                {loading ? '正在激活尊享会员...' : '✅ 我已完成扫码支付，立即开通'}
              </button>
              <p className="confirm-note">
                付款后点击上方按钮即可秒级开通；如有疑问可联系客服
              </p>
            </div>

            <button className="btn-back-link" onClick={() => setStep('dialog')}>
              ← 返回重选特权详情
            </button>
          </div>
        )}

        {step === 'success' && (
          <div className="treasure-success-stage">
            <div className="success-confetti">🎉 👑 🗝️</div>
            <div className="mascot-stage">
              <img src="/assets/dragon_mascot.jpg" alt="小蓝龙" className="mascot-avatar-img dragon-bounce" />
            </div>
            <h3 className="success-title">恭喜有缘人！藏宝阁已成功激活</h3>
            <p className="success-subtitle">
              小蓝龙已为您开启财富法门！全场名企面经复盘与真题题库均已免积分无限制开放。
            </p>
            <button className="btn-enter-treasure" onClick={onClose}>
              🚀 立即进入藏宝阁
            </button>
          </div>
        )}
      </div>
    </div>
  )
}
