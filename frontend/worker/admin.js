import { getSessionUser } from './auth.js'
import { syncSingleSource, syncAllActiveSources } from './crawler/sync_service.js'

function generateZpinCode() {
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789'
  const getChunk = () => {
    const bytes = new Uint8Array(4)
    crypto.getRandomValues(bytes)
    return Array.from(bytes).map((b) => chars[b % chars.length]).join('')
  }
  return `ZPIN-${getChunk()}-${getChunk()}-${getChunk()}`
}

async function verifyAdmin(request, env) {
  const adminSecret = env.ADMIN_BOOTSTRAP_SECRET || 'admin_zhaopin_init_2026'
  const headerToken = request.headers.get('x-admin-token')
  if (headerToken && headerToken === adminSecret) return true

  const user = await getSessionUser(request, env)
  if (user && user.role === 'admin') return true
  return false
}

export async function handleAdmin(request, env, pathname) {
  if (!pathname.startsWith('/api/admin/')) return null

  const isAdmin = await verifyAdmin(request, env)
  if (!isAdmin) {
    return Response.json({ error: '无管理员访问权限' }, { status: 403 })
  }

  const url = new URL(request.url)
  const method = request.method

  // GET /api/admin/stats
  if (pathname === '/api/admin/stats' && method === 'GET') {
    const oneDayAgo = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString()
    const [users, jobs, todayJobs, sources, unlocks, codes] = await env.DB.batch([
      env.DB.prepare('SELECT count(*) as count FROM users'),
      env.DB.prepare('SELECT count(*) as count FROM job_referrals WHERE status = "active"'),
      env.DB.prepare('SELECT count(*) as count FROM job_referrals WHERE status = "active" AND publish_time >= ?').bind(oneDayAgo),
      env.DB.prepare('SELECT count(*) as count FROM crawler_sources WHERE status = "active"'),
      env.DB.prepare('SELECT count(*) as count, coalesce(sum(points_spent), 0) as total_spent FROM user_unlocks'),
      env.DB.prepare('SELECT status, count(*) as count FROM redemption_codes GROUP BY status')
    ])

    return Response.json({
      totalUsers: users.results?.[0]?.count || 0,
      totalJobs: jobs.results?.[0]?.count || 0,
      todayNewJobs: todayJobs.results?.[0]?.count || 0,
      totalSources: sources.results?.[0]?.count || 0,
      totalUnlocks: unlocks.results?.[0]?.count || 0,
      totalPointsSpent: unlocks.results?.[0]?.total_spent || 0,
      codesStats: codes.results || [],
    })
  }

  // GET /api/admin/sources
  if (pathname === '/api/admin/sources' && method === 'GET') {
    const { results } = await env.DB.prepare('SELECT * FROM crawler_sources ORDER BY updated_at DESC').all()
    return Response.json({ items: results || [] })
  }

  // POST /api/admin/sources (创建官网监控源)
  if (pathname === '/api/admin/sources' && method === 'POST') {
    const body = await request.json().catch(() => ({}))
    const companyName = String(body.company_name || '').trim()
    const category = String(body.category || '中国500强').trim()
    const portalUrl = String(body.portal_url || '').trim()
    const parserType = String(body.parser_type || 'html_selector').trim()
    const apiEndpoint = body.api_endpoint || null

    if (!companyName || !portalUrl) {
      return Response.json({ error: '企业名称与官网网址必填' }, { status: 400 })
    }

    const id = 'cs_' + Math.random().toString(36).substring(2, 10)
    await env.DB.prepare(
      `INSERT INTO crawler_sources (id, company_name, category, portal_url, api_endpoint, parser_type, status)
       VALUES (?, ?, ?, ?, ?, ?, 'active')`
    ).bind(id, companyName, category, portalUrl, apiEndpoint, parserType).run()

    return Response.json({ success: true, id })
  }

  // POST /api/admin/sources/:id/sync
  const syncMatch = pathname.match(/^\/api\/admin\/sources\/([^/]+)\/sync$/)
  if (syncMatch && method === 'POST') {
    const sourceId = syncMatch[1]
    const source = await env.DB.prepare('SELECT * FROM crawler_sources WHERE id = ?').bind(sourceId).first()
    if (!source) return Response.json({ error: '渠道不存在' }, { status: 404 })

    const res = await syncSingleSource(source, env)
    return Response.json({ success: true, result: res })
  }

  // POST /api/admin/sources/sync-all
  if (pathname === '/api/admin/sources/sync-all' && method === 'POST') {
    const results = await syncAllActiveSources(env)
    return Response.json({ success: true, results })
  }

  // POST /api/admin/redemption-codes/generate (批量生成电商卡密)
  if (pathname === '/api/admin/redemption-codes/generate' && method === 'POST') {
    const body = await request.json().catch(() => ({}))
    const count = Math.min(Math.max(parseInt(body.count || '10', 10), 1), 500)
    const points = parseInt(body.points || '750', 10)
    const faceValueCents = parseInt(body.faceValueCents || '1000', 10)
    const batchId = body.batchId || ('BATCH_' + new Date().toISOString().slice(0, 10).replace(/-/g, ''))
    const channelTag = body.channelTag || 'xianyu'

    const codes = []
    const stmts = []

    for (let i = 0; i < count; i++) {
      const code = generateZpinCode()
      codes.push(code)
      stmts.push(
        env.DB.prepare(
          `INSERT INTO redemption_codes (id, code, batch_id, points, face_value_cents, channel_tag)
           VALUES (?, ?, ?, ?, ?, ?)`
        ).bind(crypto.randomUUID(), code, batchId, points, faceValueCents, channelTag)
      )
    }

    // 分批次执行
    const chunkSize = 50
    for (let i = 0; i < stmts.length; i += chunkSize) {
      await env.DB.batch(stmts.slice(i, i + chunkSize))
    }

    return Response.json({
      success: true,
      count,
      points,
      batchId,
      channelTag,
      codes,
    })
  }

  // GET /api/admin/redemption-codes (列出卡密)
  if (pathname === '/api/admin/redemption-codes' && method === 'GET') {
    const status = url.searchParams.get('status')
    const limit = Math.min(parseInt(url.searchParams.get('limit') || '50', 10), 200)

    let sql = 'SELECT * FROM redemption_codes'
    const params = []
    if (status) {
      sql += ' WHERE status = ?'
      params.push(status)
    }
    sql += ' ORDER BY created_at DESC LIMIT ?'
    params.push(limit)

    const { results } = await env.DB.prepare(sql).bind(...params).all()
    return Response.json({ items: results || [] })
  }

  // POST /api/admin/batch-import (批量灌入种子数据 / 腾讯文档数据)
  if (pathname === '/api/admin/batch-import' && method === 'POST') {
    const body = await request.json().catch(() => ({}))
    const { sources = [], jobs = [], resources = [], experiences = [] } = body

    let insertedSources = 0
    let insertedJobs = 0
    let insertedResources = 0
    let insertedExperiences = 0

    // 1. 导入渠道源
    for (const s of sources) {
      try {
        await env.DB.prepare(
          `INSERT OR REPLACE INTO crawler_sources (id, company_name, category, portal_url, api_endpoint, parser_type, status)
           VALUES (?, ?, ?, ?, ?, ?, 'active')`
        ).bind(s.id || crypto.randomUUID(), s.company_name, s.category || '中国500强', s.portal_url, s.api_endpoint || null, s.parser_type || 'html_selector').run()
        insertedSources++
      } catch (err) {
        console.error('Insert source error:', err)
      }
    }

    // 2. 导入岗位
    for (const j of jobs) {
      try {
        const hash = `${j.company_name}_${j.job_title}_${j.apply_url}`
        await env.DB.prepare(
          `INSERT OR REPLACE INTO job_referrals (
            id, company_name, industry, recruitment_type, job_categories, cities, job_title, referral_code, apply_url, publish_time, deadline, status, highlights, is_official_sync, dedup_hash
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'active', ?, ?, ?)`
        ).bind(
          j.id || crypto.randomUUID(),
          j.company_name,
          j.industry || '综合',
          j.recruitment_type || '2027秋招',
          JSON.stringify(j.job_categories || ['技术研发']),
          JSON.stringify(j.cities || ['全国']),
          j.job_title,
          j.referral_code || null,
          j.apply_url || 'https://www.google.com',
          j.publish_time || new Date().toISOString(),
          j.deadline || '招满即止',
          j.highlights || '名企热招',
          j.is_official_sync ? 1 : 0,
          hash
        ).run()
        insertedJobs++
      } catch (err) {
        console.error('Insert job error:', err)
      }
    }

    // 3. 导入资料
    for (const r of resources) {
      try {
        await env.DB.prepare(
          `INSERT OR REPLACE INTO resource_materials (
            id, title, category, description, file_format, drive_url, access_code, points_required
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`
        ).bind(
          r.id || crypto.randomUUID(),
          r.title,
          r.category || '笔试真题',
          r.description || '',
          r.file_format || '网盘资料',
          r.drive_url || 'https://pan.baidu.com',
          r.access_code || '6666',
          r.points_required || 10
        ).run()
        insertedResources++
      } catch (err) {
        console.error('Insert resource error:', err)
      }
    }

    // 4. 导入面经
    for (const e of experiences) {
      try {
        await env.DB.prepare(
          `INSERT OR REPLACE INTO interview_experiences (
            id, title, company_name, position_type, round_tag, question_type, summary, detail_content, points_required, source_platform
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`
        ).bind(
          e.id || crypto.randomUUID(),
          e.title,
          e.company_name,
          e.position_type || '技术研发',
          e.round_tag || '综合面',
          e.question_type || '综合题型',
          e.summary,
          e.detail_content,
          e.points_required || 5,
          e.source_platform || '平台自研整理'
        ).run()
        insertedExperiences++
      } catch (err) {
        console.error('Insert exp error:', err)
      }
    }

    return Response.json({
      success: true,
      insertedSources,
      insertedJobs,
      insertedResources,
      insertedExperiences,
    })
  }

  return null
}
