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
  getJobFilters(params = {}) {
    const search = new URLSearchParams(params).toString()
    return request(`/api/jobs/filters${search ? `?${search}` : ''}`)
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
  createTreasureVipOrder(payload = {}) {
    return request('/api/pay/treasure-vip', {
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
  selfConfirmPayOrder(orderId) {
    return request('/api/pay/self-confirm', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({ orderId }),
    })
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
  updateAdminSource(id, data) {
    return request(`/api/admin/sources/${id}`, {
      method: 'PUT',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(data),
    })
  },
  deleteAdminSource(id) {
    return request(`/api/admin/sources/${id}`, { method: 'DELETE' })
  },
  triggerSync(sourceId) {
    return request(`/api/admin/sources/${sourceId}/sync`, { method: 'POST' })
  },
  getAdminJobs(params = {}) {
    const search = new URLSearchParams(params).toString()
    return request(`/api/admin/jobs${search ? `?${search}` : ''}`)
  },
  deleteAdminJob(id) {
    return request(`/api/admin/jobs/${id}`, { method: 'DELETE' })
  },
  getAdminRedemptions(params = {}) {
    const search = new URLSearchParams(params).toString()
    return request(`/api/admin/redemptions${search ? `?${search}` : ''}`)
  },
  createAdminRedemptionBatch(data) {
    return request('/api/admin/redemptions/batch', {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(data),
    })
  },
  exportAdminRedemptions(batchId) {
    return request(`/api/admin/redemptions/export?batchId=${encodeURIComponent(batchId)}`)
  },
}
