import { handleAuth } from './auth.js'
import { handleJobs } from './jobs.js'
import { handleExperiences } from './experiences.js'
import { handleResources } from './resources.js'
import { handlePoints } from './points.js'
import { handleAdmin } from './admin.js'
import { syncAllActiveSources } from './crawler/sync_service.js'

function handleCors(request) {
  const origin = request.headers.get('Origin') || '*'
  return {
    'Access-Control-Allow-Origin': origin,
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization, x-admin-token',
    'Access-Control-Max-Age': '86400',
  }
}

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url)
    const pathname = url.pathname

    // 处理 OPTIONS 预检请求
    if (request.method === 'OPTIONS') {
      return new Response(null, { headers: handleCors(request) })
    }

    // 只处理 /api/* 路由，其余交给静态 Assets 单页应用
    if (pathname.startsWith('/api/')) {
      try {
        let response = null

        // 1. 认证模块
        response = await handleAuth(request, env, pathname)
        if (response) return wrapCors(response, request)

        // 2. 招聘岗位模块
        response = await handleJobs(request, env, pathname)
        if (response) return wrapCors(response, request)

        // 3. 面经题解模块
        response = await handleExperiences(request, env, pathname)
        if (response) return wrapCors(response, request)

        // 4. 求职资料与题库模块
        response = await handleResources(request, env, pathname)
        if (response) return wrapCors(response, request)

        // 5. 积分、支付与卡密模块
        response = await handlePoints(request, env, pathname)
        if (response) return wrapCors(response, request)

        // 6. 管理后台与渠道管理
        response = await handleAdmin(request, env, pathname)
        if (response) return wrapCors(response, request)

        return wrapCors(Response.json({ error: 'API endpoint not found' }, { status: 404 }), request)
      } catch (err) {
        console.error('[Worker Unhandled Error]', err)
        return wrapCors(Response.json({ error: err.message || 'Internal Server Error' }, { status: 500 }), request)
      }
    }

    // 非 API 路径由前端 SPA 处理
    if (env.ASSETS) {
      return env.ASSETS.fetch(request)
    }

    return new Response('Zhaopin Platform API Ready', { status: 200 })
  },

  // 定时 Cron 触发器 (每2小时自动轮询抓取各官网渠道)
  async scheduled(event, env, ctx) {
    console.log('[Scheduled Cron Trigger] Starting recruitment crawler sync at', new Date().toISOString())
    ctx.waitUntil(syncAllActiveSources(env))
  }
}

function wrapCors(response, request) {
  const headers = new Headers(response.headers)
  const corsHeaders = handleCors(request)
  for (const [k, v] of Object.entries(corsHeaders)) {
    headers.set(k, v)
  }
  return new Response(response.body, {
    status: response.status,
    statusText: response.statusText,
    headers,
  })
}
