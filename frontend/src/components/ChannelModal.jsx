import { useState } from 'react'
import { apiClient } from '../apiClient.js'

export function ChannelModal({ onClose, onSuccess, onToast }) {
  const [companyName, setCompanyName] = useState('')
  const [category, setCategory] = useState('央国企')
  const [portalUrl, setPortalUrl] = useState('')
  const [apiEndpoint, setApiEndpoint] = useState('')
  const [parserType, setParserType] = useState('html_selector')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  const handleSubmit = async (e) => {
    e.preventDefault()
    if (!companyName.trim() || !portalUrl.trim()) {
      setError('企业名称和官网网址必填')
      return
    }
    setLoading(true)
    setError('')
    try {
      await apiClient.createAdminSource({
        company_name: companyName.trim(),
        category,
        portal_url: portalUrl.trim(),
        api_endpoint: apiEndpoint.trim() || null,
        parser_type: parserType,
      })
      onToast(`已成功添加企业官网【${companyName}】至监控池！`)
      onSuccess()
      onClose()
    } catch (err) {
      setError(err.message || '添加失败')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="modal-backdrop" onClick={onClose}>
      <div className="modal-sheet" onClick={(e) => e.stopPropagation()}>
        <div className="modal-header">
          <h3>添加企业招聘官网监控源</h3>
          <button className="modal-close" onClick={onClose}>✕</button>
        </div>

        <form onSubmit={handleSubmit} className="channel-form">
          <label className="form-item">
            <span>企业全称 / 通用名称 *</span>
            <input
              type="text"
              placeholder="例如：中国航天科技集团"
              value={companyName}
              onChange={(e) => setCompanyName(e.target.value)}
              required
            />
          </label>

          <label className="form-item">
            <span>企业梯队分类</span>
            <select value={category} onChange={(e) => setCategory(e.target.value)}>
              <option value="央国企">央国企</option>
              <option value="互联网大厂">互联网大厂</option>
              <option value="中国500强">中国500强</option>
              <option value="智能制造">智能制造/半导体</option>
              <option value="金融券商">金融大行/券商</option>
            </select>
          </label>

          <label className="form-item">
            <span>校招官网直达网址 *</span>
            <input
              type="url"
              placeholder="https://..."
              value={portalUrl}
              onChange={(e) => setPortalUrl(e.target.value)}
              required
            />
          </label>

          <label className="form-item">
            <span>解析器类型</span>
            <select value={parserType} onChange={(e) => setParserType(e.target.value)}>
              <option value="html_selector">网页结构化解析 (通用)</option>
              <option value="moka_api">Moka 招聘 ATS 接口</option>
              <option value="beisen_api">北森 (Beisen) 校园招聘接口</option>
              <option value="dayee_api">大易 (Dayee) 招聘接口</option>
            </select>
          </label>

          <label className="form-item">
            <span>开放 API 接口地址 (可选)</span>
            <input
              type="text"
              placeholder="例如 Moka 或北森公开接口 URL"
              value={apiEndpoint}
              onChange={(e) => setApiEndpoint(e.target.value)}
            />
          </label>

          {error && <div className="error-tip">{error}</div>}

          <div className="modal-footer-actions">
            <button type="button" className="btn-secondary" onClick={onClose}>取消</button>
            <button type="submit" className="btn-primary" disabled={loading}>
              {loading ? '正在添加...' : '确认添加'}
            </button>
          </div>
        </form>
      </div>
    </div>
  )
}
