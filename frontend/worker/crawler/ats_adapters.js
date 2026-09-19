// ATS 招聘系统解析适配器 (Moka / 北森 / 大易 / 飞书招聘 / 通用网页选择器)

export async function parseMokaApi(source) {
  // Moka 校招标准开放接口解析
  if (!source.api_endpoint) return []
  try {
    const res = await fetch(source.api_endpoint, { headers: { 'User-Agent': 'Mozilla/5.0' } })
    if (!res.ok) return []
    const json = await res.json()
    const list = json.data?.items || json.items || []
    return list.map((item) => ({
      job_title: item.title || item.name,
      recruitment_type: item.recruitment_type || '2027秋招',
      industry: source.category || '互联网/科技',
      job_categories: [item.category || item.department || '技术研发'],
      cities: [item.city || item.location || '全国'],
      apply_url: item.apply_url || `${source.portal_url}/job/${item.id}`,
      highlights: item.highlights || '官方直招，投递秒同步',
      deadline: item.deadline || '招满即止',
    }))
  } catch (err) {
    console.error(`[Moka Parse Error] ${source.company_name}:`, err)
    return []
  }
}

export async function parseBeisenApi(source) {
  // 北森标准职位接口解析
  if (!source.api_endpoint) return []
  try {
    const res = await fetch(source.api_endpoint, { headers: { 'User-Agent': 'Mozilla/5.0' } })
    if (!res.ok) return []
    const json = await res.json()
    const list = json.Positions || json.data?.positions || []
    return list.map((item) => ({
      job_title: item.PostName || item.Name,
      recruitment_type: '2027秋招',
      industry: source.category || '中国500强',
      job_categories: [item.WorkPlace || '综合业务'],
      cities: [item.City || '全国'],
      apply_url: `${source.portal_url}?jobId=${item.Id || item.PostId}`,
      highlights: '北森系统直投，支持快速投递',
      deadline: '招满即止',
    }))
  } catch (err) {
    console.error(`[Beisen Parse Error] ${source.company_name}:`, err)
    return []
  }
}

export async function parseAtsJobs(source) {
  if (source.parser_type === 'moka_api') {
    return await parseMokaApi(source)
  }
  if (source.parser_type === 'beisen_api') {
    return await parseBeisenApi(source)
  }
  // 默认模拟或空
  return []
}
