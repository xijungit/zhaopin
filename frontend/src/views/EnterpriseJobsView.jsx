import { useState, useEffect } from 'react'
import { apiClient } from '../apiClient.js'
import { JobCard } from '../components/JobCard.jsx'

export function EnterpriseJobsView({ onToast }) {
  const [jobs, setJobs] = useState([])
  const [loading, setLoading] = useState(true)
  const [q, setQ] = useState('')
  const [industry, setIndustry] = useState('全部')
  const [city, setCity] = useState('全部')
  const [type, setType] = useState('全部')
  const [filters, setFilters] = useState({ industries: [], recruitmentTypes: [], cities: [] })
  const [offset, setOffset] = useState(0)
  const [hasMore, setHasMore] = useState(false)

  // 热门外企与科技大厂招聘直达推荐
  const topEnterprisePortals = [
    { name: '腾讯招聘', url: 'https://join.qq.com', icon: '🐧' },
    { name: '字节跳动', url: 'https://jobs.bytedance.com/campus', icon: '🎵' },
    { name: '阿里巴巴', url: 'https://talent.alibaba.com/campus', icon: '🛒' },
    { name: '美团招聘', url: 'https://zhaopin.meituan.com/web/campus', icon: '🛵' },
    { name: '大疆创新', url: 'https://we.dji.com/campus', icon: '🚁' },
    { name: '微软中国', url: 'https://careers.microsoft.com', icon: '💻' },
    { name: '特斯拉', url: 'https://www.tesla.cn/careers', icon: '⚡' },
    { name: '华为招聘', url: 'https://career.huawei.com', icon: '📱' },
  ]

  useEffect(() => {
    apiClient.getJobFilters({ channel_type: 'enterprise' }).then((res) => {
      setFilters(res)
    }).catch(() => {})
  }, [])

  const fetchJobs = (reset = false) => {
    setLoading(true)
    const newOffset = reset ? 0 : offset
    const params = {
      channel_type: 'enterprise',
      q,
      offset: newOffset,
      limit: 20,
    }

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
  }, [industry, city, type])

  const handleSearchSubmit = (e) => {
    e.preventDefault()
    fetchJobs(true)
  }

  return (
    <div className="view-container">
      {/* 顶部标语与外企/名企快捷直达入口 */}
      <div className="enterprise-hero-card">
        <div className="hero-text-wrap">
          <h2 className="hero-title">🏢 名企与新锐外企校招汇总</h2>
          <p className="hero-subtitle">
            聚合互联网、新能源、芯片半导体、独角兽与外企最新校招网申直通车
          </p>
        </div>
      </div>

      <div className="portals-scroll-wrap">
        <div className="portals-bar">
          {topEnterprisePortals.map((p) => (
            <a
              key={p.name}
              href={p.url}
              target="_blank"
              rel="noopener noreferrer"
              className="portal-chip enterprise-chip"
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
            placeholder="搜索企业名称、招聘岗位、技能方向..."
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
            {(filters.cities || ['全国', '北京', '上海', '深圳', '广州', '杭州', '成都', '武汉']).map((c) => (
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
          <span className="filter-label">校招批次：</span>
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
            <span>正在检索企业校招最新网申通道...</span>
          </div>
        )}

        {!loading && jobs.length === 0 && (
          <div className="empty-state">
            <span className="empty-icon">📭</span>
            <p className="empty-text">暂未找到符合条件的企业校招，尝试更换筛选关键词</p>
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
