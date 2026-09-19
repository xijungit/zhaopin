import { useState, useEffect } from 'react'
import { apiClient, getAuthToken, setAuthToken } from './apiClient.js'
import { JobsView } from './views/JobsView.jsx'
import { ExperiencesView } from './views/ExperiencesView.jsx'
import { ResourcesView } from './views/ResourcesView.jsx'
import { ProfileView } from './views/ProfileView.jsx'
import { AdminView } from './views/AdminView.jsx'
import { PaymentModal } from './components/PaymentModal.jsx'
import { UnlockModal } from './components/UnlockModal.jsx'
import './App.css'

export default function App() {
  const [activeTab, setActiveTab] = useState('jobs') // 'jobs' | 'experiences' | 'resources' | 'profile' | 'admin'
  const [currentUser, setCurrentUser] = useState(null)
  const [toastMsg, setToastMsg] = useState('')

  // 弹窗状态
  const [showAuthModal, setShowAuthModal] = useState(false)
  const [authMode, setAuthMode] = useState('login') // 'login' | 'register'
  const [authAccount, setAuthAccount] = useState('')
  const [authPassword, setAuthPassword] = useState('')
  const [authDisplayName, setAuthDisplayName] = useState('')
  const [authInviteCode, setAuthInviteCode] = useState('')
  const [authLoading, setAuthLoading] = useState(false)
  const [authError, setAuthError] = useState('')

  const [showPayModal, setShowPayModal] = useState(false)
  const [unlockTarget, setUnlockTarget] = useState(null) // { item, type: 'experience' | 'resource' }

  // 检查 URL 邀请参数 ?ref=XXXX
  useEffect(() => {
    const params = new URLSearchParams(window.location.search)
    const ref = params.get('ref')
    if (ref) {
      setAuthInviteCode(ref.toUpperCase())
      if (!getAuthToken()) {
        setShowAuthModal(true)
        setAuthMode('register')
      }
    }
  }, [])

  // 加载当前登录用户
  useEffect(() => {
    if (getAuthToken()) {
      apiClient.me().then((res) => {
        if (res.user) setCurrentUser(res.user)
      }).catch(() => {
        setAuthToken('')
      })
    }
  }, [])

  const showToast = (msg) => {
    setToastMsg(msg)
    setTimeout(() => setToastMsg(''), 3000)
  }

  const handleAuthSubmit = async (e) => {
    e.preventDefault()
    setAuthLoading(true)
    setAuthError('')
    try {
      let res
      if (authMode === 'login') {
        res = await apiClient.login({ account: authAccount, password: authPassword })
      } else {
        res = await apiClient.register({
          account: authAccount,
          password: authPassword,
          displayName: authDisplayName || authAccount,
          inviteCode: authInviteCode,
        })
      }
      setAuthToken(res.token)
      setCurrentUser(res.user)
      setShowAuthModal(false)
      showToast(authMode === 'login' ? '登录成功！' : '注册成功！已赠送 100 初始积分')
    } catch (err) {
      setAuthError(err.message || '操作失败')
    } finally {
      setAuthLoading(false)
    }
  }

  const handleLogout = async () => {
    await apiClient.logout().catch(() => {})
    setCurrentUser(null)
    setActiveTab('jobs')
    showToast('已安全退出登录')
  }

  const handleUnlockSuccess = (updatedItem, balanceAfter) => {
    if (currentUser) {
      setCurrentUser({ ...currentUser, points: balanceAfter })
    }
    showToast('🎉 解锁成功！内容已永久归档至“我的已解锁”')
  }

  const handlePaySuccess = (pointsAdded) => {
    if (currentUser) {
      setCurrentUser({ ...currentUser, points: currentUser.points + pointsAdded })
    }
    showToast(`充值到账成功！增加 ${pointsAdded} 积分`)
  }

  return (
    <div className="app-layout">
      {/* 顶部标题栏 */}
      <header className="app-topbar">
        <div className="topbar-logo-wrap">
          <span className="logo-icon">🚀</span>
          <span className="logo-text">校招内推与名企求职通</span>
        </div>
        <div className="topbar-user-wrap">
          {currentUser ? (
            <div className="points-pill" onClick={() => setShowPayModal(true)}>
              🪙 <span>{currentUser.points} 分</span>
              <span className="plus-sign">+</span>
            </div>
          ) : (
            <button className="btn-login-sm" onClick={() => { setAuthMode('login'); setShowAuthModal(true); }}>
              登录/注册
            </button>
          )}
        </div>
      </header>

      {/* 主界面切换 */}
      <main className="app-content">
        {activeTab === 'jobs' && <JobsView onToast={showToast} />}
        {activeTab === 'experiences' && (
          <ExperiencesView
            currentUser={currentUser}
            onToast={showToast}
            onTriggerUnlock={(item, type) => {
              if (!currentUser) {
                setShowAuthModal(true)
                return
              }
              setUnlockTarget({ item, type })
            }}
          />
        )}
        {activeTab === 'resources' && (
          <ResourcesView
            onToast={showToast}
            onTriggerUnlock={(item, type) => {
              if (!currentUser) {
                setShowAuthModal(true)
                return
              }
              setUnlockTarget({ item, type })
            }}
          />
        )}
        {activeTab === 'profile' && (
          <ProfileView
            currentUser={currentUser}
            onOpenLogin={() => { setAuthMode('login'); setShowAuthModal(true); }}
            onLogout={handleLogout}
            onOpenRecharge={() => setShowPayModal(true)}
            onOpenAdmin={() => setActiveTab('admin')}
            onToast={showToast}
          />
        )}
        {activeTab === 'admin' && (
          <AdminView
            onBack={() => setActiveTab('profile')}
            onToast={showToast}
          />
        )}
      </main>

      {/* 移动端底部导航栏 (Tabbar) */}
      <nav className="app-tabbar">
        <button
          className={`tab-btn ${activeTab === 'jobs' ? 'active' : ''}`}
          onClick={() => setActiveTab('jobs')}
        >
          <span className="tab-icon">🔥</span>
          <span className="tab-label">内推广场</span>
        </button>

        <button
          className={`tab-btn ${activeTab === 'experiences' ? 'active' : ''}`}
          onClick={() => setActiveTab('experiences')}
        >
          <span className="tab-icon">💡</span>
          <span className="tab-label">面经复盘</span>
        </button>

        <button
          className={`tab-btn ${activeTab === 'resources' ? 'active' : ''}`}
          onClick={() => setActiveTab('resources')}
        >
          <span className="tab-icon">📚</span>
          <span className="tab-label">真题资料</span>
        </button>

        <button
          className={`tab-btn ${activeTab === 'profile' || activeTab === 'admin' ? 'active' : ''}`}
          onClick={() => setActiveTab('profile')}
        >
          <span className="tab-icon">👤</span>
          <span className="tab-label">我的中心</span>
        </button>
      </nav>

      {/* 登录/注册弹窗 */}
      {showAuthModal && (
        <div className="modal-backdrop" onClick={() => setShowAuthModal(false)}>
          <div className="modal-sheet" onClick={(e) => e.stopPropagation()}>
            <div className="modal-header">
              <div className="modal-tabs">
                <button
                  className={`modal-tab ${authMode === 'login' ? 'active' : ''}`}
                  onClick={() => setAuthMode('login')}
                >
                  登录
                </button>
                <button
                  className={`modal-tab ${authMode === 'register' ? 'active' : ''}`}
                  onClick={() => setAuthMode('register')}
                >
                  注册 (送100积分)
                </button>
              </div>
              <button className="modal-close" onClick={() => setShowAuthModal(false)}>✕</button>
            </div>

            <form onSubmit={handleAuthSubmit} className="auth-form">
              <label className="form-item">
                <span>账号 / 手机号 / 邮箱</span>
                <input
                  type="text"
                  placeholder="请输入登录账号"
                  value={authAccount}
                  onChange={(e) => setAuthAccount(e.target.value)}
                  required
                />
              </label>

              <label className="form-item">
                <span>密码</span>
                <input
                  type="password"
                  placeholder="请输入密码 (至少6位)"
                  value={authPassword}
                  onChange={(e) => setAuthPassword(e.target.value)}
                  required
                />
              </label>

              {authMode === 'register' && (
                <>
                  <label className="form-item">
                    <span>昵称 / 称谓</span>
                    <input
                      type="text"
                      placeholder="例如：27届求职者小张"
                      value={authDisplayName}
                      onChange={(e) => setAuthDisplayName(e.target.value)}
                    />
                  </label>
                  <label className="form-item">
                    <span>邀请码 (可选，填入双方各+50积分)</span>
                    <input
                      type="text"
                      placeholder="请输入好友的邀请码"
                      value={authInviteCode}
                      onChange={(e) => setAuthInviteCode(e.target.value.toUpperCase())}
                    />
                  </label>
                </>
              )}

              {authError && <div className="error-tip">{authError}</div>}

              <button type="submit" className="btn-primary btn-block" disabled={authLoading}>
                {authLoading ? '处理中...' : (authMode === 'login' ? '立即登录' : '立即注册领取 100 积分')}
              </button>
            </form>
          </div>
        </div>
      )}

      {/* 支付与卡密兑换弹窗 */}
      {showPayModal && (
        <PaymentModal
          onClose={() => setShowPayModal(false)}
          onSuccess={handlePaySuccess}
          onToast={showToast}
        />
      )}

      {/* 积分解锁确认弹窗 */}
      {unlockTarget && (
        <UnlockModal
          item={unlockTarget.item}
          type={unlockTarget.type}
          currentUser={currentUser}
          onClose={() => setUnlockTarget(null)}
          onSuccess={handleUnlockSuccess}
          onOpenRecharge={() => setShowPayModal(true)}
        />
      )}

      {/* 全局轻提示 Toast */}
      {toastMsg && (
        <div className="global-toast">
          {toastMsg}
        </div>
      )}
    </div>
  )
}
