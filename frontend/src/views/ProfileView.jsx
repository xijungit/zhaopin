import { useState, useEffect } from 'react'
import { apiClient } from '../apiClient.js'

export function ProfileView({
  currentUser,
  onOpenLogin,
  onLogout,
  onOpenRecharge,
  onOpenAdmin,
  onOpenTreasureVip,
  onUpdateUser,
  onToast
}) {
  const [pointsInfo, setPointsInfo] = useState({ points: 0, inviteCode: '', invitedCount: 0, unlocksCount: 0 })
  const [subTab, setSubTab] = useState('unlocks') // 'unlocks' | 'invite' | 'ledger'
  const [unlocks, setUnlocks] = useState([])
  const [ledger, setLedger] = useState([])
  const [loading, setLoading] = useState(false)

  const [showEditName, setShowEditName] = useState(false)
  const [newNickname, setNewNickname] = useState('')
  const [savingName, setSavingName] = useState(false)

  const isVip = Boolean(
    currentUser && (currentUser.isTreasureVip || currentUser.is_treasure_vip || currentUser.role === 'admin')
  )

  const safeDisplayName = currentUser
    ? (currentUser.displayName || (currentUser.account?.includes('@') ? currentUser.account.split('@')[0] : '求职同学'))
    : ''

  useEffect(() => {
    if (!currentUser) return
    apiClient.getPointsMe().then(setPointsInfo).catch(() => {})
  }, [currentUser])

  useEffect(() => {
    if (!currentUser) return
    if (subTab === 'unlocks') {
      setLoading(true)
      apiClient.getUserUnlocks().then((res) => setUnlocks(res.items || [])).finally(() => setLoading(false))
    } else if (subTab === 'ledger') {
      setLoading(true)
      apiClient.getPointsLedger().then((res) => setLedger(res.items || [])).finally(() => setLoading(false))
    }
  }, [subTab, currentUser])

  const handleCopyInviteLink = () => {
    const link = `${window.location.origin}/?ref=${pointsInfo.inviteCode || currentUser.inviteCode}`
    const text = `同学你好！推荐你使用这个【2027名企校招内推与题库大全】，最新大厂/央国企官网实时同步，注册即送100积分，点击链接免费领取：${link}`
    navigator.clipboard.writeText(text).then(() => {
      onToast('🎉 专属邀请文案与链接已复制！快去分享给同学吧')
    }).catch(() => {
      onToast('复制失败，请手动长按复制')
    })
  }

  const handleSaveNickname = async (e) => {
    e.preventDefault()
    const trimmed = newNickname.trim()
    if (!trimmed) {
      onToast('请输入有效的个性昵称')
      return
    }
    setSavingName(true)
    try {
      const res = await apiClient.updateProfile({ displayName: trimmed })
      if (res.success) {
        if (onUpdateUser) onUpdateUser({ displayName: trimmed })
        setShowEditName(false)
        onToast('昵称修改成功！')
      }
    } catch (err) {
      onToast(err.message || '修改失败')
    } finally {
      setSavingName(false)
    }
  }

  if (!currentUser) {
    return (
      <div className="view-container profile-guest">
        <div className="guest-card">
          <div className="guest-avatar">👤</div>
          <h2>欢迎来到校招求职通</h2>
          <p>登录即可查看积分钱包、享受新人注册 100 积分大礼包，并同步已解锁的所有资料与面经。</p>
          <button className="btn-primary btn-block" onClick={onOpenLogin}>
            立即登录 / 免费注册
          </button>
        </div>
      </div>
    )
  }

  return (
    <div className="view-container profile-view">
      {/* 顶部个人卡片 */}
      <div className="user-profile-card">
        <div className="user-info-row">
          <div className="user-avatar-circle">{safeDisplayName.slice(0, 1).toUpperCase() || '用'}</div>
          <div className="user-details">
            <div className="user-name-line">
              <span className="user-name">{safeDisplayName}</span>
              {currentUser.role === 'admin' && <span className="admin-badge">管理员</span>}
              {isVip && <span className="profile-vip-badge">👑 藏宝阁会员</span>}
              <button
                type="button"
                className="btn-edit-name-link"
                onClick={() => {
                  setNewNickname(safeDisplayName)
                  setShowEditName(true)
                }}
                title="修改昵称"
              >
                ✏️ 修改
              </button>
            </div>
            <div className="user-account">账号: {currentUser.account}</div>
          </div>
          <button className="btn-logout" onClick={onLogout}>退出</button>
        </div>

        {/* 藏宝阁专属权益卡 */}
        <div className={`treasure-vip-card ${isVip ? 'active' : 'inactive'}`}>
          <div className="vip-card-left">
            <div className="vip-icon-circle">{isVip ? '👑' : '🏰'}</div>
            <div className="vip-card-info">
              <div className="vip-card-title">
                {isVip ? '藏宝阁终身 VIP 会员' : '藏宝阁特权 · 财富法门'}
              </div>
              <div className="vip-card-desc">
                {isVip
                  ? '已享有全场名企面经复盘与题库资源免积分畅读'
                  : '仅需 9.9 元，开启大厂核心面经与真题无门槛畅享'}
              </div>
            </div>
          </div>
          {!isVip && (
            <button className="btn-vip-upgrade" onClick={onOpenTreasureVip}>
              9.9元激活
            </button>
          )}
        </div>

        {/* 积分钱包卡片 */}
        <div className="points-wallet-box">
          <div className="wallet-left">
            <div className="wallet-label">账户剩余可用积分</div>
            <div className="wallet-number">{currentUser.points} <span className="unit">分</span></div>
          </div>
          <div className="wallet-actions">
            <button className="btn-wallet-recharge" onClick={onOpenRecharge}>
              充值 / 卡密兑换
            </button>
          </div>
        </div>
      </div>

      {/* 修改昵称弹窗 */}
      {showEditName && (
        <div className="modal-backdrop" onClick={() => setShowEditName(false)}>
          <div className="modal-sheet modal-sm" onClick={(e) => e.stopPropagation()}>
            <div className="modal-header">
              <h3>修改个人昵称</h3>
              <button className="modal-close" onClick={() => setShowEditName(false)}>✕</button>
            </div>
            <form onSubmit={handleSaveNickname} className="auth-form">
              <label className="form-item">
                <span>个性昵称 / 称谓</span>
                <input
                  type="text"
                  placeholder="请输入您的专属昵称（请勿输入密码）"
                  value={newNickname}
                  onChange={(e) => setNewNickname(e.target.value)}
                  maxLength={20}
                  required
                />
              </label>
              <div className="modal-actions-row">
                <button type="button" className="btn-secondary" onClick={() => setShowEditName(false)}>
                  取消
                </button>
                <button type="submit" className="btn-primary" disabled={savingName}>
                  {savingName ? '保存中...' : '确认保存'}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* 管理员专属入口 */}
      {currentUser.role === 'admin' && (
        <div className="admin-entry-card" onClick={onOpenAdmin}>
          <div className="admin-entry-left">
            <span className="admin-icon">⚙️</span>
            <div>
              <div className="admin-entry-title">管理后台控制台</div>
              <div className="admin-entry-desc">官网监控调度、卡密批量生成、表格数据导入</div>
            </div>
          </div>
          <span className="arrow-icon">›</span>
        </div>
      )}

      {/* 二级功能导航 */}
      <div className="profile-subtabs">
        <button
          className={`subtab-btn ${subTab === 'unlocks' ? 'active' : ''}`}
          onClick={() => setSubTab('unlocks')}
        >
          📁 已解锁内容 ({pointsInfo.unlocksCount || unlocks.length})
        </button>
        <button
          className={`subtab-btn ${subTab === 'invite' ? 'active' : ''}`}
          onClick={() => setSubTab('invite')}
        >
          🎁 邀请有礼 (已邀 {pointsInfo.invitedCount} 人)
        </button>
        <button
          className={`subtab-btn ${subTab === 'ledger' ? 'active' : ''}`}
          onClick={() => setSubTab('ledger')}
        >
          📜 积分明细流水
        </button>
      </div>

      {/* 子内容区 */}
      <div className="subtab-content">
        {subTab === 'unlocks' && (
          <div className="unlocks-list">
            {unlocks.length === 0 && !loading && (
              <div className="empty-state">
                <p>暂无已解锁的资料，可在面经或题库中解锁体验</p>
              </div>
            )}
            {unlocks.map((u) => (
              <div key={u.id} className="card unlocked-item-card">
                <div className="unlocked-header">
                  <span className="unlocked-type-tag">
                    {u.target_type === 'resource' ? '📦 题库资料' : '💡 面经复盘'}
                  </span>
                  <span className="unlocked-date">{new Date(u.created_at).toLocaleDateString('zh-CN')}</span>
                </div>
                <div className="unlocked-title">{u.title}</div>
                {u.target_type === 'resource' && u.drive_url && (
                  <div className="unlocked-drive-info">
                    <div>网盘：<a href={u.drive_url} target="_blank" rel="noreferrer">{u.drive_url}</a></div>
                    <div>提取码：<strong>{u.access_code}</strong></div>
                  </div>
                )}
              </div>
            ))}
          </div>
        )}

        {subTab === 'invite' && (
          <div className="card invite-card">
            <h3>🎁 好友邀请裂变计划</h3>
            <p className="invite-rule">
              专属邀请码：<strong className="invite-code-highlight">{pointsInfo.inviteCode}</strong>
            </p>
            <div className="invite-benefits">
              <div className="benefit-item">
                <div className="benefit-icon">👫</div>
                <div className="benefit-text">好友通过您的专属链接注册，立得 <strong>+50 积分</strong> 特权礼</div>
              </div>
              <div className="benefit-item">
                <div className="benefit-icon">💰</div>
                <div className="benefit-text">您将实时获赠 <strong>+50 积分/人</strong>，多邀多得，永不过期！</div>
              </div>
            </div>

            <button className="btn-primary btn-block btn-invite-share" onClick={handleCopyInviteLink}>
              一键复制专属邀请文案与短链
            </button>
          </div>
        )}

        {subTab === 'ledger' && (
          <div className="ledger-list">
            {ledger.map((item) => (
              <div key={item.id} className="ledger-row">
                <div className="ledger-left">
                  <div className="ledger-remark">{item.remark}</div>
                  <div className="ledger-time">{new Date(item.created_at).toLocaleString('zh-CN', { hour12: false })}</div>
                </div>
                <div className={`ledger-amount ${item.amount > 0 ? 'plus' : 'minus'}`}>
                  {item.amount > 0 ? `+${item.amount}` : item.amount}
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  )
}
