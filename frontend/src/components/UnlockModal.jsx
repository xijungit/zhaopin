import { useState } from 'react'
import { apiClient } from '../apiClient.js'

export function UnlockModal({ item, type, currentUser, onClose, onSuccess, onOpenRecharge }) {
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  const pointsNeeded = item.points_required || 0
  const isEnough = (currentUser?.points || 0) >= pointsNeeded

  const handleConfirm = async () => {
    setLoading(true)
    setError('')
    try {
      if (type === 'experience') {
        const res = await apiClient.unlockExperience(item.id)
        onSuccess({ ...item, is_unlocked: true, detail_content: res.detail_content }, res.balance_after)
      } else {
        const res = await apiClient.unlockResource(item.id)
        onSuccess({ ...item, is_unlocked: true, drive_url: res.drive_url, access_code: res.access_code }, res.balance_after)
      }
      onClose()
    } catch (err) {
      setError(err.message || '解锁失败')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="modal-backdrop" onClick={onClose}>
      <div className="modal-sheet" onClick={(e) => e.stopPropagation()}>
        <div className="modal-header">
          <h3>积分解锁确认</h3>
          <button className="modal-close" onClick={onClose}>✕</button>
        </div>

        <div className="unlock-body">
          <div className="unlock-item-title">{item.title}</div>
          <div className="unlock-calc-box">
            <div className="calc-row">
              <span>所需积分：</span>
              <strong className="text-warning">{pointsNeeded} 积分</strong>
            </div>
            <div className="calc-row">
              <span>当前账户余额：</span>
              <span>{currentUser?.points || 0} 积分</span>
            </div>
            <div className="calc-divider"></div>
            <div className="calc-row">
              <span>解锁后剩余：</span>
              <span className={isEnough ? 'text-success' : 'text-danger'}>
                {isEnough ? (currentUser.points - pointsNeeded) : '积分不足'}
              </span>
            </div>
          </div>

          {error && <div className="error-tip">{error}</div>}

          {isEnough ? (
            <div className="modal-footer-actions">
              <button className="btn-secondary" onClick={onClose} disabled={loading}>
                稍后再看
              </button>
              <button className="btn-primary" onClick={handleConfirm} disabled={loading}>
                {loading ? '正在解锁...' : '确认扣减并解锁'}
              </button>
            </div>
          ) : (
            <div className="not-enough-actions">
              <div className="tip-msg">您的积分不足以解锁此内容，可在线充值或使用闲鱼/淘宝卡密兑换。</div>
              <button
                className="btn-primary btn-block"
                onClick={() => { onClose(); onOpenRecharge(); }}
              >
                立即获取积分（充值 / 卡密兑换）
              </button>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}
