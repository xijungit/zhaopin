import { useState, useEffect } from 'react'
import { apiClient } from '../apiClient.js'
import { ResourceCard } from '../components/ResourceCard.jsx'

export function ResourcesView({ onTriggerUnlock, onToast }) {
  const [resources, setResources] = useState([])
  const [loading, setLoading] = useState(true)
  const [q, setQ] = useState('')
  const [category, setCategory] = useState('全部')

  const categories = ['全部', '校招通关题库', '答题思路与秘籍', '大厂历年真题']

  const fetchResources = () => {
    setLoading(true)
    const params = {}
    if (q.trim()) params.q = q.trim()
    if (category !== '全部') params.category = category

    apiClient.getResources(params).then((res) => {
      setResources(res.items || [])
    }).catch((err) => {
      onToast(err.message || '加载资料失败')
    }).finally(() => {
      setLoading(false)
    })
  }

  useEffect(() => {
    fetchResources()
  }, [category])

  const handleSearch = (e) => {
    e.preventDefault()
    fetchResources()
  }

  return (
    <div className="view-container resources-view">
      <div className="view-intro-banner">
        <h2>📚 校招笔试全套题库与高分资料宝库</h2>
        <p>汇聚校招通关题库、面试真题高分答题思路与互联网大厂历年真题试卷，一次兑换永久查阅。</p>
      </div>

      <div className="search-bar-wrap">
        <form onSubmit={handleSearch} className="search-box">
          <span className="search-icon">🔍</span>
          <input
            type="search"
            placeholder="搜索资料名称、公司、岗位真题、知识点关键词..."
            value={q}
            onChange={(e) => setQ(e.target.value)}
          />
          <button type="submit" className="btn-search">搜索</button>
        </form>
      </div>

      <div className="category-tabs">
        {categories.map((cat) => (
          <button
            key={cat}
            className={`cat-tab ${category === cat ? 'active' : ''}`}
            onClick={() => setCategory(cat)}
          >
            {cat}
          </button>
        ))}
      </div>

      <div className="res-list">
        {resources.length === 0 && !loading && (
          <div className="empty-state">
            <p>暂无相关求职资料</p>
          </div>
        )}

        {resources.map((res) => (
          <ResourceCard
            key={res.id}
            resource={res}
            onToast={onToast}
            onUnlock={(item) => onTriggerUnlock(item, 'resource')}
          />
        ))}

        {loading && <div className="loading-state">正在检索题库资源包...</div>}
      </div>
    </div>
  )
}
