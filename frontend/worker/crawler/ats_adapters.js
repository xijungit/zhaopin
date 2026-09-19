// ATS 招聘系统与多维表格解析适配器 (Moka / 北森 / 大易 / 飞书招聘 / 腾讯文档多维表格)

export function normalizeSmartsheetItem(row) {
  const company = row['企业名称'] || row['公司名称'] || row['company_name'] || ''
  const industry = row['所在行业'] || row['行业'] || row['industry'] || '互联网/科技'
  const timeStr = row['启动/更新时间'] || row['更新时间'] || row['publish_time'] || ''
  const jobTitle = row['招聘岗位'] || row['岗位名称'] || row['job_title'] || '2027届校园招聘'
  const cityStr = row['工作地点'] || row['地点'] || row['cities'] || '全国'
  const recruitType = row['校招类型'] || row['recruitment_type'] || '27届秋招'
  let applyUrl = row['内推链接'] || row['网申链接'] || row['apply_url'] || ''
  const refCode = row['内推码'] || row['推荐码'] || row['referral_code'] || ''
  const details = row['招聘详情'] || row['highlights'] || ''

  if (!company) return null

  if (applyUrl && !/^https?:\/\//i.test(applyUrl)) {
    applyUrl = 'https://' + applyUrl
  }

  const cities = String(cityStr).replace(/[、，,;/|]/g, ' ').split(/\s+/).filter(Boolean)
  const jobCategories = String(jobTitle).replace(/[、，,;/|]/g, ' ').split(/\s+/).filter(Boolean)

  return {
    company_name: company.trim(),
    industry: industry.trim(),
    recruitment_type: recruitType.trim(),
    job_categories: jobCategories.length > 0 ? jobCategories : ['综合类'],
    cities: cities.length > 0 ? cities : ['全国'],
    job_title: jobTitle.trim(),
    referral_code: refCode.trim(),
    apply_url: applyUrl.trim(),
    highlights: details.slice(0, 500).trim(),
    deadline: '招满即止'
  }
}

export async function parseMokaApi(source) {
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
  return []
}
