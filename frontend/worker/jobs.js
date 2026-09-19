export async function handleJobs(request, env, pathname) {
  const url = new URL(request.url)
  const method = request.method

  // GET /api/jobs
  if (pathname === '/api/jobs' && method === 'GET') {
    const q = (url.searchParams.get('q') || '').trim()
    const industry = (url.searchParams.get('industry') || '').trim()
    const type = (url.searchParams.get('type') || '').trim()
    const city = (url.searchParams.get('city') || '').trim()
    const category = (url.searchParams.get('category') || '').trim()
    const sourceCategory = (url.searchParams.get('sourceCategory') || '').trim()
    const onlyToday = url.searchParams.get('onlyToday') === '1'
    const limit = Math.min(parseInt(url.searchParams.get('limit') || '30', 10), 100)
    const offset = Math.max(parseInt(url.searchParams.get('offset') || '0', 10), 0)

    let sql = `
      SELECT j.*, s.category as source_category
      FROM job_referrals j
      LEFT JOIN crawler_sources s ON j.source_id = s.id
      WHERE j.status = 'active'
    `
    const params = []

    if (q) {
      sql += ` AND (j.company_name LIKE ? OR j.job_title LIKE ? OR j.highlights LIKE ?)`
      params.push(`%${q}%`, `%${q}%`, `%${q}%`)
    }
    if (industry && industry !== '全部') {
      sql += ` AND j.industry = ?`
      params.push(industry)
    }
    if (type && type !== '全部') {
      sql += ` AND j.recruitment_type = ?`
      params.push(type)
    }
    if (city && city !== '全部') {
      sql += ` AND (j.cities LIKE ? OR j.cities LIKE '%全国%')`
      params.push(`%${city}%`)
    }
    if (category && category !== '全部') {
      sql += ` AND j.job_categories LIKE ?`
      params.push(`%${category}%`)
    }
    if (sourceCategory && sourceCategory !== '全部') {
      if (sourceCategory === '互联网大厂') {
        sql += ` AND (s.category = ? OR j.industry LIKE '%互联网%' OR j.industry LIKE '%游戏%' OR j.industry LIKE '%科技%' OR j.industry LIKE '%AI%' OR j.industry LIKE '%智能驾驶%')`
      } else if (sourceCategory === '央国企') {
        sql += ` AND (s.category = ? OR j.industry LIKE '%国企%' OR j.industry LIKE '%银行%' OR j.industry LIKE '%电力%' OR j.company_name LIKE '%电网%' OR j.company_name LIKE '%电信%' OR j.company_name LIKE '%移动%')`
      } else if (sourceCategory === '中国500强') {
        sql += ` AND (s.category = ? OR j.industry LIKE '%制造业%' OR j.industry LIKE '%新能源%' OR j.industry LIKE '%汽车%' OR j.industry LIKE '%芯片%' OR j.industry LIKE '%金融%' OR j.industry LIKE '%快消%' OR j.industry LIKE '%手机%')`
      } else {
        sql += ` AND s.category = ?`
      }
      params.push(sourceCategory)
    }
    if (onlyToday) {
      // 24小时内发布
      const oneDayAgo = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString()
      sql += ` AND j.publish_time >= ?`
      params.push(oneDayAgo)
    }

    sql += ` ORDER BY j.publish_time DESC, j.created_at DESC LIMIT ? OFFSET ?`
    params.push(limit, offset)

    const stmt = env.DB.prepare(sql)
    const { results } = await stmt.bind(...params).all()

    // 格式化解析 JSON 字段
    const formatted = (results || []).map((row) => {
      let jobCategories = []
      let cities = []
      try { jobCategories = JSON.parse(row.job_categories || '[]') } catch {}
      try { cities = JSON.parse(row.cities || '[]') } catch {}

      // 判断是否在24小时内
      const isTodayNew = row.publish_time && (Date.now() - new Date(row.publish_time).getTime()) < 24 * 60 * 60 * 1000

      return {
        ...row,
        job_categories: jobCategories,
        cities,
        is_today_new: !!isTodayNew,
      }
    })

    return Response.json({
      items: formatted,
      hasMore: formatted.length === limit,
      limit,
      offset,
    })
  }

  // GET /api/jobs/filters
  if (pathname === '/api/jobs/filters' && method === 'GET') {
    const industries = await env.DB.prepare('SELECT DISTINCT industry FROM job_referrals WHERE status = "active"').all()
    const types = await env.DB.prepare('SELECT DISTINCT recruitment_type FROM job_referrals WHERE status = "active"').all()
    const sourceCategories = await env.DB.prepare('SELECT DISTINCT category FROM crawler_sources WHERE status = "active"').all()

    return Response.json({
      industries: (industries.results || []).map((r) => r.industry).filter(Boolean),
      recruitmentTypes: (types.results || []).map((r) => r.recruitment_type).filter(Boolean),
      sourceCategories: (sourceCategories.results || []).map((r) => r.category).filter(Boolean),
      cities: ['全国', '北京', '上海', '深圳', '广州', '杭州', '成都', '武汉', '南京', '西安'],
    })
  }

  // POST /api/jobs/:id/view (点击计数)
  const viewMatch = pathname.match(/^\/api\/jobs\/([^/]+)\/view$/)
  if (viewMatch && method === 'POST') {
    const jobId = viewMatch[1]
    await env.DB.prepare('UPDATE job_referrals SET view_count = view_count + 1 WHERE id = ?').bind(jobId).run()
    return Response.json({ success: true })
  }

  return null
}
