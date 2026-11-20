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
    // 兼容 binding 为 DB 或 zhaopin_platform_db
    env.DB = env.DB || env.zhaopin_platform_db

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

  // 定时 Cron 触发器 (每2小时自动轮询抓取各官网渠道 + 多维表格数据新鲜度看门狗)
  async scheduled(event, env, ctx) {
    env.DB = env.DB || env.zhaopin_platform_db
    console.log('[Scheduled Cron Trigger] Starting recruitment crawler sync at', new Date().toISOString())
    ctx.waitUntil(
      (async () => {
        await syncAllActiveSources(env)
        await checkSmartsheetFreshness(env)
      })()
    )
  }
}

// 【数据看门狗】检测多维表格导入岗位的新鲜度：
// smartsheet_ / soe_ / ent_ 前缀行均来自腾讯文档增量导入，MAX(publish_time) 超过 7 天
// 说明本机无人值守同步流水线可能中断，记录告警提示运维介入检查本地任务。
async function checkSmartsheetFreshness(env) {
  try {
    const row = await env.DB.prepare(
      `SELECT MAX(publish_time) AS latest FROM job_referrals WHERE id LIKE 'smartsheet_%' OR id LIKE 'soe_%' OR id LIKE 'ent_%'`
    ).first()
    const latest = row?.latest
    if (!latest) {
      console.warn('[Watchdog] D1 中未找到多维表格导入的岗位数据，请检查数据流水线状态')
      return
    }
    const ageDays = (Date.now() - Date.parse(latest)) / 86400000
    if (Number.isFinite(ageDays) && ageDays > 7) {
      console.warn(`[Watchdog] 多维表格数据已过期: 最新 publish_time=${latest} (距今 ${ageDays.toFixed(1)} 天)，请检查本机 auto_sync_har.bat / 计划任务 Zhaopin_AutoHarSync`)
    } else {
      console.log(`[Watchdog] 多维表格数据新鲜 (最新 ${latest}，距今 ${ageDays.toFixed(1)} 天)`)
    }
  } catch (err) {
    console.error('[Watchdog] 数据新鲜度检查失败:', err.message)
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
