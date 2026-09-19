import { useState } from 'react'

export function ResourceCard({ resource, onUnlock, onToast }) {
  const [copied, setCopied] = useState(false)

  const handleCopyDrive = () => {
    const text = `资料名称：${resource.title}\n网盘链接：${resource.drive_url}\n提取密码：${resource.access_code}`
    navigator.clipboard.writeText(text).then(() => {
      setCopied(true)
      onToast('网盘链接与提取密码已复制！')
      setTimeout(() => setCopied(false), 2000)
    }).catch(() => {
      onToast('复制失败，请手动选择复制')
    })
  }

  return (
    <div className="card res-card">
      <div className="res-header">
        <div className="res-icon">
          {resource.file_format?.includes('PDF') ? '📄' : '📦'}
        </div>
        <div className="res-info">
          <div className="res-cat-row">
            <span className="res-cat-tag">{resource.category}</span>
            <span className="res-format-tag">{resource.file_format}</span>
          </div>
          <h3 className="res-title">{resource.title}</h3>
        </div>
      </div>

      <div className="res-desc">
        {resource.description}
      </div>

      <div className="res-footer">
        <div className="res-stats">
          🔥 已有 {resource.download_count || 12} 位同学兑换下载
        </div>

        {resource.is_unlocked ? (
          <div className="res-unlocked-action">
            <button className="btn-success btn-copy-drive" onClick={handleCopyDrive}>
              {copied ? '✓ 已复制网盘信息' : '📋 复制网盘与提取码'}
            </button>
            <a
              href={resource.drive_url}
              target="_blank"
              rel="noopener noreferrer"
              className="btn-link"
            >
              直接打开网盘 ›
            </a>
          </div>
        ) : (
          <button
            className="btn-primary btn-unlock"
            onClick={() => onUnlock(resource)}
          >
            消耗 {resource.points_required} 积分兑换
          </button>
        )}
      </div>
    </div>
  )
}
