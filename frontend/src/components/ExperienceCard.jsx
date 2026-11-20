import { useState } from 'react'

export function ExperienceCard({ exp, onUnlock, currentUser }) {
  const [expanded, setExpanded] = useState(false)

  return (
    <div className="card exp-card">
      <div className="exp-header">
        <div className="exp-meta-row">
          <span className="exp-company-tag">{exp.company_name}</span>
          <span className="exp-round-tag">{exp.round_tag || '综合面试'}</span>
          <span className="exp-type-tag">{exp.question_type || '综合题型'}</span>
        </div>
        <h3 className="exp-title">{exp.title}</h3>
      </div>

      <div className="exp-summary">
        <div className="summary-title">【考察重点与背景】</div>
        <p>{exp.summary}</p>
      </div>

      {exp.is_unlocked ? (
        <div className="exp-unlocked-content">
          <div className="content-badge">✓ 已解锁深度答题解析 (STAR法则)</div>
          <div className="detail-markdown">
            {exp.detail_content?.split('\n').map((line, idx) => (
              <p key={idx}>{line}</p>
            ))}
          </div>
        </div>
      ) : (
        <div className="exp-locked-box">
          <div className="blur-preview" aria-hidden="true">
            <p><strong>【STAR 法则深度拆解】</strong></p>
            <p>Situation：业务背景、业务体量与核心系统架构关键指标梳理...</p>
            <p>Task：面试官追问的核心痛点、深挖考察方向与技术难点攻关...</p>
            <p>Action：个人技术选型、核心算法优化及系统高可用方案权衡...</p>
            <p>Result：最终量化业务成果、经验复盘与标准解题高分模板...</p>
          </div>
          <div className="lock-overlay">
            <div className="lock-icon">🔒</div>
            <div className="lock-text">解锁完整复盘与标准解题模板</div>
            <div className="lock-subtext">含 STAR 原则逐问拆解 · 真实面试官评分点</div>
            <button
              className="btn-primary btn-unlock"
              onClick={() => onUnlock(exp)}
            >
              消耗 {exp.points_required} 积分解锁
            </button>
          </div>
        </div>
      )}
    </div>
  )
}
