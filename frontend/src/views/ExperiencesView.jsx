import { useState, useEffect } from 'react'
import { apiClient } from '../apiClient.js'
import { ExperienceCard } from '../components/ExperienceCard.jsx'

export function ExperiencesView({ onTriggerUnlock, currentUser, onToast }) {
  const [experiences, setExperiences] = useState([])
  const [loading, setLoading] = useState(true)
  const [q, setQ] = useState('')
  const [company, setCompany] = useState('全部')

  const companies = ['全部', '腾讯', '字节跳动', '阿里巴巴', '华为', '国家电网', '美团', '快手', '工商银行', '大疆创新', '中金公司']

  const fetchExperiences = () => {
    setLoading(true)
    const params = { q }
    if (company !== '全部') params.company = company

    apiClient.getExperiences(params).then((res) => {
      setExperiences(res.items || [])
    }).catch((err) => {
      onToast(err.message || '加载面经失败')
    }).finally(() => {
      setLoading(false)
    })
  }

  useEffect(() => {
    fetchExperiences()
  }, [company])

  const handleSearch = (e) => {
    e.preventDefault()
    fetchExperiences()
  }

  return (
    <div className="view-container experiences-view">
      <div className="view-intro-banner">
        <h2>💡 大厂与名企面试真题 & 上岸经验复盘</h2>
        <p>基于真实上岸学长学姐还原，深度覆盖 STAR 答题法则与技术追问破局。</p>
      </div>

      <div className="search-bar-wrap">
        <form onSubmit={handleSearch} className="search-box">
          <span className="search-icon">🔍</span>
          <input
            type="search"
            placeholder="搜索公司、岗位面经、考点关键词..."
            value={q}
            onChange={(e) => setQ(e.target.value)}
          />
          <button type="submit" className="btn-search">搜索</button>
        </form>
      </div>

      <div className="company-filter-chips">
        {companies.map((c) => (
          <button
            key={c}
            className={`filter-chip ${company === c ? 'active' : ''}`}
            onClick={() => setCompany(c)}
          >
            {c}
          </button>
        ))}
      </div>

      <div className="exp-list">
        {experiences.length === 0 && !loading && (
          <div className="empty-state">
            <p>暂无相关面经复盘</p>
          </div>
        )}

        {experiences.map((exp) => (
          <ExperienceCard
            key={exp.id}
            exp={exp}
            currentUser={currentUser}
            onUnlock={(item) => onTriggerUnlock(item, 'experience')}
          />
        ))}

        {loading && <div className="loading-state">正在整理真实上岸复盘...</div>}
      </div>
    </div>
  )
}
