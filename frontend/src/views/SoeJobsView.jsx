import { useState, useEffect } from 'react'
import { apiClient } from '../apiClient.js'
import { JobCard } from '../components/JobCard.jsx'

export function SoeJobsView({ onToast }) {
  const [jobs, setJobs] = useState([])
  const [loading, setLoading] = useState(true)
  const [q, setQ] = useState('')
  const [soeType, setSoeType] = useState('全部')
  const [industry, setIndustry] = useState('全部')
  const [city, setCity] = useState('全部')
  const [type, setType] = useState('全部')
  const [filters, setFilters] = useState({ industries: [], recruitmentTypes: [], cities: [], soeTypes: [] })
  const [offset, setOffset] = useState(0)
  const [hasMore, setHasMore] = useState(false)

  // 央企/重点国企/事业单位官方网申平台快捷入口
  const topSoePortals = [
    { name: '国家电网', url: 'https://zhaopin.sgcc.com.cn', icon: '⚡' },
    { name: '中国烟草', url: 'http://www.tobacco.gov.cn', icon: '🍃' },
    { name: '中国移动', url: 'https://job.10086.cn', icon: '📶' },
    { name: '中国电信', url: 'https://job.189.cn', icon: '📡' },
    { name: '中国联通', url: 'https://zglt.zhaopin.com', icon: '🌐' },
    { name: '中国建筑', url: 'https://job.cscec.com', icon: '🏗️' },
    { name: '中国中车', url: 'https://crrcgc.zhaopin.com', icon: '🚄' },
    { name: '中国石化', url: 'http://job.sinopec.com', icon: '⛽' },
    { name: '中国航天', url: 'http://www.spacetalent.com.cn', icon: '🚀' },
    { name: '工商银行', url: 'https://job.icbc.com.cn', icon: '🏦' },
    { name: '建设银行', url: 'http://job.ccb.com', icon: '💳' },
  ]

  useEffect(() => {
    apiClient.getJobFilters({ channel_type: 'soe' }).then((res) => {
      setFilters(res)
    }).catch(() => {})
  }, [])

  const fetchJobs = (reset = false) => {
    setLoading(true)
    const newOffset = reset ? 0 : offset
    const params = {
      channel_type: 'soe',
      q,
      offset: newOffset,
      limit: 20,
    }

    if (soeType !== '全部') params.soe_type = soeType
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
      onToast(err.message || '加载央国企岗位失败')
    }).finally(() => {
      setLoading(false)
    })
  }

  useEffect(() => {
    fetchJobs(true)
  }, [soeType, industry, city, type])

  const handleSearchSubmit = (e) => {
    e.preventDefault()
    fetchJobs(true)
  }

  const soeTypeOptions = [
    { label: '全部编制/类型', value: '全部', icon: '🏛️' },
    { label: '中央企业 (央企)', value: '央企', icon: '🇨🇳' },
    { label: '地方国有企业', value: '国企', icon: '🏢' },
    { label: '事业单位/科研院所', value: '事业单位', icon: '🏫' },
    { label: '银行与金融机构', value: '银行金融', icon: '🏦' },
  ]

  return (
    <div className="view-container soe-view-container">
      {/* 顶部标语与官方招聘平台快捷入口 */}
      <div className="soe-hero-card">
        <div className="hero-text-wrap">
          <h2 className="hero-title">🏛️ 央国企与事业单位校招专区</h2>
          <p className="hero-subtitle">
            聚合国务院国资委央企名录、重点省市属国企、科研事业单位与国有大行官方校招直通车
          </p>
        </div>
      </div>

      <div className="portals-scroll-wrap">
        <div className="portals-bar">
          {topSoePortals.map((p) => (
            <a
              key={p.name}
              href={p.url}
              target="_blank"
              rel="noopener noreferrer"
              className="portal-chip soe-chip"
            >
              <span className="portal-icon">{p.icon}</span>
              <span className="portal-name">{p.name}</span>
            </a>
          ))}
        </div>
      </div>

      {/* 搜索框 */}
      <form onSubmit={handleSearchSubmit} className="search-bar-wrap">
        <div className="search-input-box">
          <span className="search-icon">🔍</span>
          <input
            type="text"
            placeholder="搜索央企单位、国企集团、事业单位、岗位名称..."
            value={q}
            onChange={(e) => setQ(e.target.value)}
          />
          {q && (
            <button type="button" className="btn-clear" onClick={() => { setQ(''); fetchJobs(true); }}>
              ✕
            </button>
          )}
        </div>
        <button type="submit" className="btn-search">搜索</button>
      </form>

      {/* 单位性质特色分类卡片 */}
      <div className="soe-type-selector">
        {soeTypeOptions.map((opt) => (
          <button
            key={opt.value}
            className={`soe-type-card ${soeType === opt.value ? 'active' : ''}`}
            onClick={() => setSoeType(opt.value)}
          >
            <span className="soe-type-icon">{opt.icon}</span>
            <span className="soe-type-label">{opt.label}</span>
          </button>
        ))}
      </div>

      {/* 多维筛选栏 */}
      <div className="filter-panel">
        <div className="filter-group">
          <span className="filter-label">行业赛道：</span>
          <div className="filter-chips">
            {['全部', ...(filters.industries || []).slice(0, 10)].map((ind) => (
              <button
                key={ind}
                className={`filter-chip ${industry === ind ? 'active' : ''}`}
                onClick={() => setIndustry(ind)}
              >
                {ind}
              </button>
            ))}
          </div>
        </div>

        <div className="filter-group">
          <span className="filter-label">目标城市：</span>
          <div className="filter-chips">
            {(filters.cities || ['全国', '北京', '上海', '深圳', '广州', '武汉', '成都', '南京', '西安']).map((c) => (
              <button
                key={c}
                className={`filter-chip ${city === c ? 'active' : ''}`}
                onClick={() => setCity(c)}
              >
                {c}
              </button>
            ))}
          </div>
        </div>

        <div className="filter-group">
          <span className="filter-label">招聘批次：</span>
          <div className="filter-chips">
            {['全部', '2027校招', '2027秋招', '2027提前批', '2026春招', '暑期实习'].map((t) => (
              <button
                key={t}
                className={`filter-chip ${type === t ? 'active' : ''}`}
                onClick={() => setType(t)}
              >
                {t}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* 岗位列表 */}
      <div className="jobs-list">
        {jobs.map((job) => (
          <JobCard key={job.id} job={job} onToast={onToast} />
        ))}

        {loading && (
          <div className="loading-state">
            <div className="spinner"></div>
            <span>正在检索央国企与体制内官方直报公告...</span>
          </div>
        )}

        {!loading && jobs.length === 0 && (
          <div className="empty-state">
            <span className="empty-icon">🏛️</span>
            <p className="empty-text">暂未找到符合条件的央国企校招岗位，请调整筛选条件</p>
          </div>
        )}

        {!loading && hasMore && (
          <button className="btn-load-more" onClick={() => fetchJobs(false)}>
            点击加载更多岗位
          </button>
        )}
      </div>
    </div>
  )
}
