export const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || ''

const TOKEN_KEY = 'zhaopin-session-token'

export function getAuthToken() {
  return localStorage.getItem(TOKEN_KEY) || ''
}

export function setAuthToken(token) {
  if (token) localStorage.setItem(TOKEN_KEY, token)
  else localStorage.removeItem(TOKEN_KEY)
}

async function request(path, options = {}) {
  const token = getAuthToken()
  const response = await fetch(`${API_BASE_URL}${path}`, {
    ...options,
    headers: {
      ...(token ? { authorization: `Bearer ${token}` } : {}),
      ...(options.headers || {}),
    },
  })
  const payload = await response.json().catch(() => ({}))
  if (!response.ok) throw new Error(payload.error || `HTTP ${response.status}`)
  return payload
}

export const apiClient = {
  // 认证
  register(credentials) {
    return request('/api/auth/register', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(credentials),
    })
  },
  login(credentials) {
    return request('/api/auth/login', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(credentials),
    })
  },
  logout() {
    return request('/api/auth/logout', { method: 'POST' }).finally(() => setAuthToken(''))
  },
  me() {
    return request('/api/auth/me')
  },

  // 岗位
  getJobs(params = {}) {
    const search = new URLSearchParams(params).toString()
    return request(`/api/jobs${search ? `?${search}` : ''}`)
  },
  getJobFilters() {
    return request('/api/jobs/filters')
  },
  viewJob(id) {
    return request(`/api/jobs/${id}/view`, { method: 'POST' })
  },

  // 面经
  getExperiences(params = {}) {
    const search = new URLSearchParams(params).toString()
    return request(`/api/experiences${search ? `?${search}` : ''}`)
  },
  getExperienceDetail(id) {
    return request(`/api/experiences/${id}`)
  },
  unlockExperience(id) {
    return request(`/api/experiences/${id}/unlock`, { method: 'POST' })
  },

  // 资料
  getResources(params = {}) {
    const search = new URLSearchParams(params).toString()
    return request(`/api/resources${search ? `?${search}` : ''}`)
  },
  unlockResource(id) {
    return request(`/api/resources/${id}/unlock`, { method: 'POST' })
  },
  getUserUnlocks() {
    return request('/api/user/unlocks')
  },

  // 积分与充值
  getPointsMe() {
    return request('/api/points/me')
  },
  getPointsLedger() {
    return request('/api/points/ledger')
  },
  redeemPoints(code) {
    return request('/api/points/redeem', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ code }),
    })
  },
  getPayPlans() {
    return request('/api/pay/plans')
  },
  createPayOrder(payload) {
    return request('/api/pay/create', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(payload),
    })
  },
  queryPayOrder(orderId) {
    return request(`/api/pay/query?orderId=${encodeURIComponent(orderId)}`)
  },
  mockPayComplete(orderId) {
    return request(`/api/pay/mock-complete?orderId=${encodeURIComponent(orderId)}`)
  },

  // 管理后台
  getAdminStats() {
    return request('/api/admin/stats')
  },
  getAdminSources() {
    return request('/api/admin/sources')
  },
  createAdminSource(data) {
    return request('/api/admin/sources', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(data),
    })
  },
  syncAdminSource(id) {
    return request(`/api/admin/sources/${id}/sync`, { method: 'POST' })
  },
  syncAllAdminSources() {
    return request('/api/admin/sources/sync-all', { method: 'POST' })
  },
  generateAdminCodes(payload) {
    return request('/api/admin/redemption-codes/generate', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(payload),
    })
  },
  getAdminCodes(params = {}) {
    const search = new URLSearchParams(params).toString()
    return request(`/api/admin/redemption-codes${search ? `?${search}` : ''}`)
  },
  importAdminBatch(data) {
    return request('/api/admin/batch-import', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(data),
    })
  },
}
