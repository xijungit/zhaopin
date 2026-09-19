import fs from 'node:fs'
import path from 'node:path'
import crypto from 'node:crypto'
import { fileURLToPath, pathToFileURL } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const rootDir = path.resolve(__dirname, '../..')
const seedsDir = path.join(rootDir, 'seeds')

// 动态尝试加载 xlsx 库
let xlsxLib = null
const possibleXlsxPaths = [
  'xlsx',
  path.join(rootDir, 'node_modules/xlsx/xlsx.mjs'),
  'D:/project code/data-crawler/node_modules/xlsx/xlsx.mjs',
]

for (const p of possibleXlsxPaths) {
  try {
    if (p === 'xlsx') {
      xlsxLib = await import('xlsx')
    } else if (fs.existsSync(p)) {
      xlsxLib = await import(pathToFileURL(p).href)
    }
    if (xlsxLib) break
  } catch {}
}

function parseCsv(content) {
  const lines = content.split(/\r?\n/).filter((l) => l.trim())
  if (lines.length === 0) return []

  function parseLine(line) {
    const row = []
    let current = ''
    let inQuotes = false
    for (let i = 0; i < line.length; i++) {
      const char = line[i]
      if (char === '"') {
        if (inQuotes && line[i + 1] === '"') {
          current += '"'
          i++
        } else {
          inQuotes = !inQuotes
        }
      } else if (char === ',' && !inQuotes) {
        row.push(current.trim())
        current = ''
      } else {
        current += char
      }
    }
    row.push(current.trim())
    return row
  }

  const headers = parseLine(lines[0])
  const rows = []
  for (let i = 1; i < lines.length; i++) {
    const values = parseLine(lines[i])
    if (values.every((v) => !v)) continue
    const obj = {}
    headers.forEach((h, idx) => {
      obj[h] = values[idx] || ''
    })
    rows.push(obj)
  }
  return rows
}

export function parseChineseDate(dateStr) {
  if (!dateStr) return new Date().toISOString()
  if (dateStr instanceof Date) return dateStr.toISOString()
  
  const clean = String(dateStr).trim()
  const m1 = clean.match(/(\d{4})[年/-](\d{1,2})[月/-](\d{1,2})/)
  if (m1) {
    const y = parseInt(m1[1], 10)
    const m = parseInt(m1[2], 10) - 1
    const d = parseInt(m1[3], 10)
    return new Date(Date.UTC(y, m, d, 8, 0, 0)).toISOString()
  }
  const timestamp = Date.parse(clean)
  if (!isNaN(timestamp)) {
    return new Date(timestamp).toISOString()
  }
  return new Date().toISOString()
}

export function parseCities(cityStr) {
  if (!cityStr) return ['全国']
  if (Array.isArray(cityStr)) return cityStr
  const tokens = String(cityStr)
    .replace(/[、，,;/|]/g, ' ')
    .split(/\s+/)
    .map((s) => s.replace(/等$/, '').trim())
    .filter((s) => s && s !== '...')
  return tokens.length > 0 ? tokens : ['全国']
}

export function parseJobCategories(jobStr) {
  if (!jobStr) return ['综合类']
  if (Array.isArray(jobStr)) return jobStr
  const tokens = String(jobStr)
    .replace(/[、，,;/|]/g, ' ')
    .split(/\s+/)
    .map((s) => s.trim())
    .filter((s) => s && s !== '...' && !s.includes('共12大类'))
  return tokens.length > 0 ? tokens : ['综合类']
}

export function normalizeUrl(rawUrl) {
  if (!rawUrl) return ''
  let url = String(rawUrl).trim()
  if (!url) return ''

  if (url.includes('docs.qq.com/scenario/link.html') || url.includes('link-warning') || url.includes('docs.qq.com/links/')) {
    try {
      const parsed = new URL(url.startsWith('http') ? url : 'https://' + url)
      const target = parsed.searchParams.get('url') || parsed.searchParams.get('target') || parsed.searchParams.get('dest')
      if (target) {
        url = decodeURIComponent(target).trim()
      }
    } catch {}
  }

  if (url.includes('...') || url.includes('…') || url.endsWith('.')) {
    console.warn(`[URL Warning] Truncated URL detected: "${url}".`)
  }

  if (!/^https?:\/\//i.test(url)) {
    url = 'https://' + url
  }
  return url
}

export function generateDedupHash(company, title, url) {
  const raw = `${(company || '').trim()}_${(title || '').trim()}_${(url || '').trim()}`
  return crypto.createHash('sha256').update(raw).digest('hex').slice(0, 32)
}

export function normalizeSmartsheetRow(row, index = 0) {
  const company = row['企业名称'] || row['公司名称'] || row['公司'] || row['company_name'] || ''
  const industry = row['所在行业'] || row['行业'] || row['industry'] || '互联网/科技'
  const timeStr = row['启动/更新时间'] || row['更新时间'] || row['发布时间'] || row['publish_time'] || ''
  const jobTitle = row['招聘岗位'] || row['岗位名称'] || row['职位'] || row['job_title'] || '2027届校园招聘'
  const cityStr = row['工作地点'] || row['地点'] || row['城市'] || row['cities'] || '全国'
  const recruitType = row['校招类型'] || row['招聘类型'] || row['recruitment_type'] || '27届秋招'
  const rawUrl = row['内推链接'] || row['网申链接'] || row['链接'] || row['apply_url'] || ''
  const refCode = row['内推码'] || row['推荐码'] || row['referral_code'] || ''
  const details = row['招聘详情'] || row['公司简介'] || row['详情'] || row['highlights'] || ''

  if (!company) return null

  const publishTime = parseChineseDate(timeStr)
  const cities = parseCities(cityStr)
  const jobCategories = parseJobCategories(jobTitle)
  const applyUrl = normalizeUrl(rawUrl)
  const dedupHash = generateDedupHash(company, jobTitle, applyUrl)
  const id = `smartsheet_${String(index + 1).padStart(4, '0')}_${dedupHash.slice(0, 8)}`

  return {
    id,
    company_name: company.trim(),
    industry: industry.trim(),
    recruitment_type: recruitType.trim(),
    job_categories: jobCategories,
    cities,
    job_title: jobTitle.trim(),
    referral_code: refCode.trim(),
    apply_url: applyUrl,
    publish_time: publishTime,
    deadline: '招满即止',
    status: 'active',
    highlights: details.slice(0, 500).trim(),
    is_official_sync: 1,
    dedup_hash: dedupHash,
  }
}

export async function processSmartsheetFile(filePath) {
  if (!fs.existsSync(filePath)) {
    throw new Error(`File not found: ${filePath}`)
  }

  console.log(`[Import] Reading file: ${filePath}`)
  const ext = path.extname(filePath).toLowerCase()
  let rawRows = []

  if (ext === '.json') {
    const raw = fs.readFileSync(filePath, 'utf-8')
    rawRows = JSON.parse(raw)
  } else if (ext === '.csv') {
    const raw = fs.readFileSync(filePath, 'utf-8')
    rawRows = parseCsv(raw)
  } else if (ext === '.xlsx' || ext === '.xls') {
    if (!xlsxLib) {
      throw new Error('XLSX parser library not available. Please install xlsx or convert to CSV/JSON.')
    }
    const workbook = xlsxLib.readFile ? xlsxLib.readFile(filePath) : xlsxLib.default.readFile(filePath)
    const sheetName = workbook.SheetNames.find((n) => n.includes('官方内推') || n.includes('内推')) || workbook.SheetNames[0]
    const worksheet = workbook.Sheets[sheetName]
    const utils = xlsxLib.utils || xlsxLib.default.utils
    rawRows = utils.sheet_to_json(worksheet)
  } else {
    throw new Error(`Unsupported file type: ${ext}`)
  }

  console.log(`[Import] Loaded ${rawRows.length} raw rows from ${path.basename(filePath)}`)

  const normalized = []
  for (let i = 0; i < rawRows.length; i++) {
    const item = normalizeSmartsheetRow(rawRows[i], i)
    if (item) normalized.push(item)
  }

  console.log(`[Import] Successfully normalized ${normalized.length} jobs.`)
  return normalized
}

export function generateUpsertSql(jobs) {
  let sql = '-- Smartsheet Data Synchronized Import\n'
  for (const j of jobs) {
    const cName = j.company_name.replace(/'/g, "''")
    const title = j.job_title.replace(/'/g, "''")
    const apply = j.apply_url.replace(/'/g, "''")
    const cats = JSON.stringify(j.job_categories).replace(/'/g, "''")
    const cities = JSON.stringify(j.cities).replace(/'/g, "''")
    const hl = (j.highlights || '').replace(/'/g, "''")
    const code = (j.referral_code || '').replace(/'/g, "''")
    const ind = j.industry.replace(/'/g, "''")
    const rType = j.recruitment_type.replace(/'/g, "''")

    sql += `INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  '${j.id}', '${cName}', '${ind}', '${rType}', '${cats}', '${cities}',
  '${title}', '${code}', '${apply}', '${j.publish_time}', '${j.deadline}', 'active',
  '${hl}', 1, '${j.dedup_hash}', CURRENT_TIMESTAMP
) ON CONFLICT(dedup_hash) DO UPDATE SET
  company_name = excluded.company_name,
  industry = excluded.industry,
  recruitment_type = excluded.recruitment_type,
  job_categories = excluded.job_categories,
  cities = excluded.cities,
  job_title = excluded.job_title,
  referral_code = excluded.referral_code,
  apply_url = excluded.apply_url,
  highlights = excluded.highlights,
  status = 'active',
  updated_at = CURRENT_TIMESTAMP;\n`
  }
  return sql
}

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  const targetArg = process.argv[2]
  let targetFile = targetArg ? path.resolve(process.cwd(), targetArg) : null

  if (!targetFile) {
    const candidates = fs.readdirSync(seedsDir).filter((f) => /\.(xlsx|csv|json)$/i.test(f) && (f.includes('smartsheet') || f.includes('2027') || f.includes('referral') || f.includes('内推')))
    if (candidates.length > 0) {
      targetFile = path.join(seedsDir, candidates[0])
    }
  }

  if (!targetFile || !fs.existsSync(targetFile)) {
    console.log('[Usage] node import_smartsheet_file.mjs <path_to_excel_or_csv_or_json>')
    console.log('No input file provided or detected in seeds/.')
    process.exit(0)
  }

  const jobs = await processSmartsheetFile(targetFile)
  const outSqlPath = path.resolve(__dirname, '../migrations/0006_clean_mock_and_import_real_data.sql')
  
  // 清理旧 mock 数据以及截断残留历史数据
  const cleanMockSql = `-- 1. 清理初始化阶段虚构包含 pid=1001、旧 mock 占位以及残缺截断数据\nDELETE FROM job_referrals WHERE id LIKE 'job_%' OR apply_url LIKE '%pid=1001%' OR apply_url LIKE '%3fSu7kU%';\n\n`
  const upsertSql = generateUpsertSql(jobs)
  fs.writeFileSync(outSqlPath, cleanMockSql + upsertSql, 'utf-8')
  console.log(`[Success] Generated migration SQL with ${jobs.length} jobs at: ${outSqlPath}`)
}
