import { useState, useEffect } from 'react'
import { apiClient } from '../apiClient.js'
import { ChannelModal } from '../components/ChannelModal.jsx'

export function AdminView({ onBack, onToast }) {
  const [activeTab, setActiveTab] = useState('stats') // 'stats' | 'sources' | 'codes' | 'import'
  const [stats, setStats] = useState(null)
  const [sources, setSources] = useState([])
  const [showChannelModal, setShowChannelModal] = useState(false)
  const [syncing, setSyncing] = useState(false)

  // 卡密生成表单
  const [codePoints, setCodePoints] = useState(750)
  const [codeCents, setCodeCents] = useState(1000)
  const [codeCount, setCodeCount] = useState(20)
  const [channelTag, setChannelTag] = useState('xianyu')
  const [batchId, setBatchId] = useState('TB_202610')
  const [generatedCodes, setGeneratedCodes] = useState([])
  const [generating, setGenerating] = useState(false)

  const loadStats = () => {
    apiClient.getAdminStats().then(setStats).catch(() => {})
  }

  const loadSources = () => {
    apiClient.getAdminSources().then((res) => setSources(res.items || [])).catch(() => {})
  }

  useEffect(() => {
    if (activeTab === 'stats') loadStats()
    if (activeTab === 'sources') loadSources()
  }, [activeTab])

  const handleSyncAll = async () => {
    setSyncing(true)
    try {
      await apiClient.syncAllAdminSources()
      onToast('全网活跃官网渠道同步完成！')
      loadSources()
      loadStats()
    } catch (err) {
      onToast(err.message || '同步失败')
    } finally {
      setSyncing(false)
    }
  }

  const handleGenerateCodes = async (e) => {
    e.preventDefault()
    setGenerating(true)
    try {
      const res = await apiClient.generateAdminCodes({
        count: codeCount,
        points: codePoints,
        faceValueCents: codeCents,
        channelTag,
        batchId,
      })
      setGeneratedCodes(res.codes || [])
      onToast(`成功生成 ${res.count} 张卡密！`)
    } catch (err) {
      onToast(err.message || '卡密生成失败')
    } finally {
      setGenerating(false)
    }
  }

  const handleExportCodesCsv = () => {
    if (!generatedCodes.length) return
    const content = '卡密兑换码,面值(元),积分,生成批次,渠道\n' +
      generatedCodes.map((c) => `${c},${codeCents / 100},${codePoints},${batchId},${channelTag}`).join('\n')
    const blob = new Blob([content], { type: 'text/csv;charset=utf-8;' })
    const url = URL.createObjectURL(blob)
    const link = document.createElement('a')
    link.href = url
    link.setAttribute('download', `卡密_${batchId}_${generatedCodes.length}张.csv`)
    document.body.appendChild(link)
    link.click()
    document.body.removeChild(link)
    onToast('卡密 CSV 文件已下载！可直接用于电商批量发货')
  }

  return (
    <div className="view-container admin-view">
      <div className="admin-header">
        <button className="btn-back" onClick={onBack}>‹ 返回个人中心</button>
        <h2>🛡️ 管理控制台</h2>
      </div>

      <div className="admin-nav-tabs">
        <button className={`admin-nav-btn ${activeTab === 'stats' ? 'active' : ''}`} onClick={() => setActiveTab('stats')}>
          📊 运营看板
        </button>
        <button className={`admin-nav-btn ${activeTab === 'sources' ? 'active' : ''}`} onClick={() => setActiveTab('sources')}>
          🏛️ 官网监控源
        </button>
        <button className={`admin-nav-btn ${activeTab === 'codes' ? 'active' : ''}`} onClick={() => setActiveTab('codes')}>
          🎟️ 电商卡密生成
        </button>
      </div>

      {activeTab === 'stats' && stats && (
        <div className="admin-tab-pane stats-pane">
          <div className="stats-grid">
            <div className="stat-card">
              <div className="stat-val">{stats.totalJobs}</div>
              <div className="stat-label">总在招岗位</div>
            </div>
            <div className="stat-card highlight">
              <div className="stat-val">{stats.todayNewJobs}</div>
              <div className="stat-label">今日首发岗位</div>
            </div>
            <div className="stat-card">
              <div className="stat-val">{stats.totalSources}</div>
              <div className="stat-label">监控企业官网</div>
            </div>
            <div className="stat-card">
              <div className="stat-val">{stats.totalUsers}</div>
              <div className="stat-label">注册用户数</div>
            </div>
            <div className="stat-card">
              <div className="stat-val">{stats.totalUnlocks}</div>
              <div className="stat-label">累计解锁次数</div>
            </div>
            <div className="stat-card">
              <div className="stat-val">{stats.totalPointsSpent}</div>
              <div className="stat-label">消耗总积分</div>
            </div>
          </div>
        </div>
      )}

      {activeTab === 'sources' && (
        <div className="admin-tab-pane sources-pane">
          <div className="sources-action-bar">
            <button className="btn-primary" onClick={() => setShowChannelModal(true)}>
              + 添加新企业官网
            </button>
            <button className="btn-secondary" onClick={handleSyncAll} disabled={syncing}>
              {syncing ? '正在全网同步...' : '⚡ 立即触发全网同步'}
            </button>
          </div>

          <div className="sources-table-wrap">
            <table className="admin-table">
              <thead>
                <tr>
                  <th>企业名称</th>
                  <th>分类</th>
                  <th>解析类型</th>
                  <th>抓取职位数</th>
                  <th>状态</th>
                  <th>官网入口</th>
                </tr>
              </thead>
              <tbody>
                {sources.map((s) => (
                  <tr key={s.id}>
                    <td><strong>{s.company_name}</strong></td>
                    <td><span className="table-badge">{s.category}</span></td>
                    <td><code>{s.parser_type}</code></td>
                    <td>{s.last_job_count || 0}</td>
                    <td>
                      <span className={`status-dot ${s.status}`}></span>
                      {s.status === 'active' ? '监控中' : s.status}
                    </td>
                    <td>
                      <a href={s.portal_url} target="_blank" rel="noreferrer" className="btn-link">查看直达 ›</a>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}

      {activeTab === 'codes' && (
        <div className="admin-tab-pane codes-pane">
          <div className="card code-gen-card">
            <h3>🎟️ 闲鱼/淘宝卡密批量生成器</h3>
            <p className="sub-desc">批量生成高强度防伪卡密（格式 <code>ZPIN-XXXX-XXXX-XXXX</code>），防吞码自愈并可一键导出 CSV 用于发卡网或电商自动发货。</p>

            <form onSubmit={handleGenerateCodes} className="code-gen-form">
              <div className="form-row">
                <label className="form-item">
                  <span>面值金额（元）</span>
                  <input
                    type="number"
                    value={codeCents / 100}
                    onChange={(e) => setCodeCents(parseFloat(e.target.value) * 100)}
                    required
                  />
                </label>
                <label className="form-item">
                  <span>兑换积分点数 (建议1.5倍)</span>
                  <input
                    type="number"
                    value={codePoints}
                    onChange={(e) => setCodePoints(parseInt(e.target.value, 10))}
                    required
                  />
                </label>
              </div>

              <div className="form-row">
                <label className="form-item">
                  <span>生成数量（张）</span>
                  <input
                    type="number"
                    value={codeCount}
                    min="1"
                    max="500"
                    onChange={(e) => setCodeCount(parseInt(e.target.value, 10))}
                    required
                  />
                </label>
                <label className="form-item">
                  <span>渠道标识 (闲鱼/淘宝)</span>
                  <input
                    type="text"
                    value={channelTag}
                    onChange={(e) => setChannelTag(e.target.value)}
                    required
                  />
                </label>
                <label className="form-item">
                  <span>批次编号</span>
                  <input
                    type="text"
                    value={batchId}
                    onChange={(e) => setBatchId(e.target.value)}
                    required
                  />
                </label>
              </div>

              <button type="submit" className="btn-primary" disabled={generating}>
                {generating ? '正在安全生成...' : '立即批量生成卡密'}
              </button>
            </form>

            {generatedCodes.length > 0 && (
              <div className="generated-result">
                <div className="result-header">
                  <span>已成功生成 {generatedCodes.length} 张卡密：</span>
                  <button className="btn-success btn-sm" onClick={handleExportCodesCsv}>
                    📥 导出卡密 CSV 表格
                  </button>
                </div>
                <div className="codes-preview-box">
                  {generatedCodes.map((code, idx) => (
                    <div key={idx} className="code-line">{code}</div>
                  ))}
                </div>
              </div>
            )}
          </div>
        </div>
      )}

      {showChannelModal && (
        <ChannelModal
          onClose={() => setShowChannelModal(false)}
          onSuccess={loadSources}
          onToast={onToast}
        />
      )}
    </div>
  )
}
