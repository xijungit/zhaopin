import { useState } from 'react'
import { ExperiencesView } from './ExperiencesView.jsx'
import { ResourcesView } from './ResourcesView.jsx'

export function TreasureView({
  currentUser,
  onOpenVipModal,
  onTriggerUnlock,
  onToast,
}) {
  const [subTab, setSubTab] = useState('experiences') // 'experiences' | 'resources'
  const isVip = Boolean(
    currentUser && (currentUser.isTreasureVip || currentUser.is_treasure_vip || currentUser.role === 'admin')
  )

  return (
    <div className="treasure-view-root">
      {/* 顶部会员身份与权益状态卡片 */}
      <div className={`treasure-hero-banner ${isVip ? 'is-vip' : 'is-locked'}`}>
        <div className="treasure-hero-left">
          <div className="dragon-avatar-wrap" onClick={!isVip ? onOpenVipModal : undefined}>
            <img
              src="/assets/dragon_mascot.jpg"
              alt="藏宝阁机缘神兽"
              className={`dragon-hero-img ${isVip ? 'dragon-gold' : 'dragon-float-loop'}`}
            />
            <span className="dragon-badge">{isVip ? '👑 金牌会员' : '🗝️ 待激活'}</span>
          </div>
          <div className="treasure-hero-info">
            <div className="treasure-title-row">
              <h2 className="treasure-main-title">🏰 名企求职 · 藏宝阁</h2>
              {isVip ? (
                <span className="vip-status-tag active">已激活终身特权</span>
              ) : (
                <span className="vip-status-tag pending" onClick={onOpenVipModal}>
                  9.9元结缘解锁 ›
                </span>
              )}
            </div>
            <p className="treasure-hero-desc">
              {isVip
                ? '✨ 财富法门已开启！大厂深度面经复盘与校招笔试真题全场免积分无限制查阅'
                : '聚合大厂核心考点复盘与绝密真题资料，一站式直通名企 Offer'}
            </p>
          </div>
        </div>

        {!isVip && (
          <button className="btn-activate-treasure-hero" onClick={onOpenVipModal}>
            🪙 9.9元一键开启法门
          </button>
        )}
      </div>

      {/* 未激活会员时的萌宠卡通动效门禁引导条 */}
      {!isVip && (
        <div className="treasure-gate-prompt-card" onClick={onOpenVipModal}>
          <div className="prompt-mascot-row">
            <div className="mini-dragon-stage">
              <img
                src="/assets/dragon_mascot.jpg"
                alt="藏宝阁守护神兽小蓝龙"
                className="dragon-mascot-bubble-img"
              />
              <span className="mascot-calling-dot"></span>
            </div>
            <div className="dragon-dialog-bubble">
              <div className="bubble-pointer"></div>
              <p className="dialog-text">
                “你是否希望用 <strong>9.9 元</strong> 激活藏宝阁？这 9.9 元不是买卖，是你开启财富法门的钥匙。买不了吃亏，买不了上当，只为筛选有缘人。”
              </p>
              <div className="dialog-action-hint">
                <span>点击召唤神兽立即激活 ›</span>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* 藏宝阁二级收缩导航 Tab */}
      <div className="treasure-subtabs-nav">
        <button
          className={`treasure-subtab-btn ${subTab === 'experiences' ? 'active' : ''}`}
          onClick={() => setSubTab('experiences')}
        >
          <span className="subtab-icon">💡</span>
          <span className="subtab-text">面经复盘</span>
          <span className="subtab-tag">{isVip ? '已免积分' : '限时专享'}</span>
        </button>
        <button
          className={`treasure-subtab-btn ${subTab === 'resources' ? 'active' : ''}`}
          onClick={() => setSubTab('resources')}
        >
          <span className="subtab-icon">📚</span>
          <span className="subtab-text">真题资料</span>
          <span className="subtab-tag">{isVip ? '已免积分' : '精品题库'}</span>
        </button>
      </div>

      {/* 内容区域：未开通时若用户点击解锁可唤起 9.9 元特权弹窗 */}
      <div className="treasure-content-area">
        {subTab === 'experiences' && (
          <ExperiencesView
            currentUser={currentUser}
            onToast={onToast}
            onTriggerUnlock={(item, type) => {
              if (!isVip) {
                onOpenVipModal()
              } else {
                onTriggerUnlock(item, type)
              }
            }}
          />
        )}

        {subTab === 'resources' && (
          <ResourcesView
            currentUser={currentUser}
            onToast={onToast}
            onTriggerUnlock={(item, type) => {
              if (!isVip) {
                onOpenVipModal()
              } else {
                onTriggerUnlock(item, type)
              }
            }}
          />
        )}
      </div>
    </div>
  )
}
