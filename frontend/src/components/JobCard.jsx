import { useState } from 'react'
import { apiClient } from '../apiClient.js'

export function JobCard({ job, onToast }) {
  const [copied, setCopied] = useState(false)

  const handleCopyCode = (e) => {
    e.stopPropagation()
    if (!job.referral_code) return
    navigator.clipboard.writeText(job.referral_code).then(() => {
      setCopied(true)
      onToast(`内推码 ${job.referral_code} 已复制到剪贴板`)
      setTimeout(() => setCopied(false), 2000)
    }).catch(() => {
      onToast('复制失败，请手动选择复制')
    })
  }

  const handleApply = () => {
    apiClient.viewJob(job.id).catch(() => {})
    window.open(job.apply_url, '_blank', 'noopener,noreferrer')
  }

  return (
    <div className="job-card" onClick={handleApply}>
      <div className="job-header">
        <div className="job-company-wrap">
          <div className="job-company-avatar">{job.company_name.slice(0, 2)}</div>
          <div>
            <div className="job-company-name">{job.company_name}</div>
            <div className="job-company-sub">
              <span>{job.industry}</span>
              {job.source_category && <span className="category-pill">{job.source_category}</span>}
            </div>
          </div>
        </div>
        <div className="job-badges">
          {job.is_today_new && <span className="badge-new">🔥 今日首发</span>}
          {job.is_official_sync === 1 && <span className="badge-sync">⚡ 官网直通</span>}
        </div>
      </div>

      <div className="job-title-row">
        <h3 className="job-title">{job.job_title}</h3>
        <span className="job-type-tag">{job.recruitment_type}</span>
      </div>

      <div className="job-tags-row">
        {job.cities?.map((city, idx) => (
          <span key={idx} className="tag city-tag">📍 {city}</span>
        ))}
        {job.job_categories?.map((cat, idx) => (
          <span key={idx} className="tag cat-tag">{cat}</span>
        ))}
      </div>

      {job.highlights && (
        <div className="job-highlights">
          💡 {job.highlights}
        </div>
      )}

      <div className="job-footer">
        <div className="job-deadline">
          截止：{job.deadline || '招满即止'}
        </div>
        <div className="job-actions">
          {job.referral_code ? (
            <button
              className={`btn-copy ${copied ? 'copied' : ''}`}
              onClick={handleCopyCode}
            >
              {copied ? '✓ 已复制' : `内推码: ${job.referral_code}`}
            </button>
          ) : (
            <span className="no-code-tip">官方直申通道</span>
          )}
          <button className="btn-apply" onClick={(e) => { e.stopPropagation(); handleApply(); }}>
            去投递 ›
          </button>
        </div>
      </div>
    </div>
  )
}
