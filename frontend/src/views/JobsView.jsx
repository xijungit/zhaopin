import { useState, useEffect } from 'react'
import { apiClient } from '../apiClient.js'
import { JobCard } from '../components/JobCard.jsx'

export function JobsView({ onToast }) {
  const [jobs, setJobs] = useState([])
  const [loading, setLoading] = useState(true)
  const [q, setQ] = useState('')
  const [activeTab, setActiveTab] = useState('all') // 'all' | 'today' | 'soe' | 'bigtech' | 'top500'
  const [industry, setIndustry] = useState('全部')
  const [city, setCity] = useState('全部')
  const [type, setType] = useState('全部')
  const [filters, setFilters] = useState({ industries: [], recruitmentTypes: [], cities: [] })
  const [offset, setOffset] = useState(0)
  const [hasMore, setHasMore] = useState(false)

  // 顶层名企官网快捷导航推荐
  const topPortals = [
    { name: '国家电网', url: 'https://zhaopin.sgcc.com.cn', icon: '⚡' },
    { name: '中国移动', url: 'https://job.10086.cn', icon: '📶' },
    { name: '中国电信', url: 'http://job.chinatelecom.com.cn', icon: '📡' },
    { name: '腾讯招聘', url: 'https://join.qq.com', icon: '🐧' },
    { name: '字节跳动', url: 'https://jobs.bytedance.com/campus', icon: '🎵' },
    { name: '华为招聘', url: 'https://career.huawei.com', icon: '📱' },
    { name: '工商银行', url: 'https://job.icbc.com.cn', icon: '🏦' },
    { name: '比亚迪', url: 'https://job.byd.com', icon: '🚗' },
  ]

  useEffect(() => {
    apiClient.getJobFilters().then(setFilters).catch(() => {})
  }, [])

  const fetchJobs = (reset = false) => {
    setLoading(true)
    const newOffset = reset ? 0 : offset
    const params = {
      q,
      offset: newOffset,
      limit: 20,
    }

    if (activeTab === 'today') params.onlyToday = '1'
    if (activeTab === 'soe') params.sourceCategory = '央国企'
    if (activeTab === 'bigtech') params.sourceCategory = '互联网大厂'
    if (activeTab === 'top500') params.sourceCategory = '中国500强'

    if (industry !== '全部') params.industry = industry
    if (city !== '全部') params.city = city
    if (type !== '全部') params.type = type

    apiClient.getJobs(params).then((res) => {
      if (reset) {
        setJobs(res.items || [])
        setOffset(res.items?.length || 0)
      } else {
        setJobs((prev) => [...prev, ...(res.items || [])])
        setOffset((prev) => prev + (res.items?.length || 0))
      }
      setHasMore(res.hasMore)
    }).catch((err) => {
      onToast(err.message || '加载岗位失败')
    }).finally(() => {
      setLoading(false)
    })
  }

  useEffect(() => {
    fetchJobs(true)
  }, [activeTab, industry, city, type])

  const handleSearch = (e) => {
    e.preventDefault()
    fetchJobs(true)
  }

  return (
    <div className="view-container jobs-view">
      {/* 搜索框 */}
      <div className="search-bar-wrap">
        <form onSubmit={handleSearch} className="search-box">
          <span className="search-icon">🔍</span>
          <input
            type="search"
            placeholder="搜索名企、岗位、内推、城市..."
            value={q}
            onChange={(e) => setQ(e.target.value)}
          />
          <button type="submit" className="btn-search">搜索</button>
        </form>
      </div>

      {/* 名企校招官网直达矩阵 */}
      <div className="portal-matrix-card">
        <div className="matrix-title">
          <span>🏛️ 名企招聘官网一键直达</span>
          <span className="sub-tip">央国企 / 互联网 / 500强</span>
        </div>
        <div className="portal-grid">
          {topPortals.map((item, idx) => (
            <a
              key={idx}
              href={item.url}
              target="_blank"
              rel="noopener noreferrer"
              className="portal-item"
            >
              <div className="portal-icon">{item.icon}</div>
              <div className="portal-name">{item.name}</div>
            </a>
          ))}
        </div>
      </div>

      {/* 时效与梯队胶囊 */}
      <div className="capsule-tabs">
        <button
          className={`capsule ${activeTab === 'all' ? 'active' : ''}`}
          onClick={() => setActiveTab('all')}
        >
          全部岗位
        </button>
        <button
          className={`capsule ${activeTab === 'today' ? 'active' : ''}`}
          onClick={() => setActiveTab('today')}
        >
          🔥 今日首发
        </button>
        <button
          className={`capsule ${activeTab === 'soe' ? 'active' : ''}`}
          onClick={() => setActiveTab('soe')}
        >
          🇨🇳 央企国企
        </button>
        <button
          className={`capsule ${activeTab === 'bigtech' ? 'active' : ''}`}
          onClick={() => setActiveTab('bigtech')}
        >
          💻 互联网大厂
        </button>
        <button
          className={`capsule ${activeTab === 'top500' ? 'active' : ''}`}
          onClick={() => setActiveTab('top500')}
        >
          🏆 500强制造/金融
        </button>
      </div>

      {/* 快捷多维筛选条 */}
      <div className="filter-bar">
        <select value={city} onChange={(e) => setCity(e.target.value)}>
          <option value="全部">城市: 全部</option>
          {filters.cities?.map((c) => (
            <option key={c} value={c}>{c}</option>
          ))}
        </select>

        <select value={type} onChange={(e) => setType(e.target.value)}>
          <option value="全部">批次: 全部</option>
          {filters.recruitmentTypes?.map((t) => (
            <option key={t} value={t}>{t}</option>
          ))}
        </select>

        <select value={industry} onChange={(e) => setIndustry(e.target.value)}>
          <option value="全部">行业: 全部</option>
          {filters.industries?.map((ind) => (
            <option key={ind} value={ind}>{ind}</option>
          ))}
        </select>
      </div>

      {/* 岗位卡片流 */}
      <div className="job-list">
        {jobs.length === 0 && !loading && (
          <div className="empty-state">
            <div className="empty-icon">📭</div>
            <p>暂无符合筛选条件的在招岗位</p>
          </div>
        )}

        {jobs.map((job) => (
          <JobCard key={job.id} job={job} onToast={onToast} />
        ))}

        {loading && (
          <div className="loading-state">正在实时加载最新名企职位...</div>
        )}

        {hasMore && !loading && (
          <button className="btn-load-more" onClick={() => fetchJobs(false)}>
            加载更多岗位 ↓
          </button>
        )}
      </div>
    </div>
  )
}
