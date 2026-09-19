import { useState, useEffect } from 'react'
import { apiClient } from '../apiClient.js'
import { ResourceCard } from '../components/ResourceCard.jsx'

export function ResourcesView({ onTriggerUnlock, onToast }) {
  const [resources, setResources] = useState([])
  const [loading, setLoading] = useState(true)
  const [q, setQ] = useState('')
  const [category, setCategory] = useState('全部')

  const categories = ['全部', '测评题库', '笔试真题', '简历模板', '央企国企']

  const fetchResources = () => {
    setLoading(true)
    const params = { q }
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

  return (
    <div className="view-container resources-view">
      <div className="view-intro-banner">
        <h2>📚 校招笔试全套题库与高分资料宝库</h2>
        <p>网罗北森/SHL测评解析、大厂笔试真题源码、单页简历模板，一次兑换永久查阅。</p>
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
