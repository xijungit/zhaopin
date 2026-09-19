import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import { normalizeSmartsheetRow, generateUpsertSql } from './import_smartsheet_file.mjs'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const rootDir = path.resolve(__dirname, '../..')
const seedsDir = path.join(rootDir, 'seeds')

const DEFAULT_DOC_URL = 'https://docs.qq.com/smartsheet/DRmRGYkt4dW53VHds?tab=BB08J2&viewId=VUQPXH'
const DEFAULT_DOC_ID = 'DRmRGYkt4dW53VHds'
const DEFAULT_SUB_ID = 'BB08J2'

export async function fetchTencentSmartsheetOnline(docId = DEFAULT_DOC_ID, subId = DEFAULT_SUB_ID, cookie = '') {
  const headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36',
    'Referer': `https://docs.qq.com/smartsheet/${docId}`,
  }
  if (cookie) headers['Cookie'] = cookie

  console.log(`[Crawler] Attempting to fetch Tencent Smartsheet data for doc: ${docId}, tab: ${subId}...`)

  // 1. 尝试直接调用多维表格公开数据接口
  const apiUrls = [
    `https://docs.qq.com/smartsheet/api/sheet/get_sheet_data?docId=${docId}&subId=${subId}`,
    `https://docs.qq.com/dop-api/opendoc?id=${docId}&normal=1`,
    `https://docs.qq.com/smartsheet/${docId}?tab=${subId}`
  ]

  for (const url of apiUrls) {
    try {
      console.log(`[Crawler] Trying endpoint: ${url}`)
      const res = await fetch(url, { headers, timeout: 8000 }).catch((e) => {
        return { ok: false, statusText: e.message }
      })

      if (!res.ok) continue
      const text = await res.text()
      
      // 检查是否返回了表格数据结构
      if (text.startsWith('{')) {
        const json = JSON.parse(text)
        if (json.data?.sheetData || json.data?.rows || json.rows) {
          console.log('[Crawler] Successfully retrieved structured data from API!')
          return extractRowsFromApiJson(json)
        }
      }

      // 如果返回的是 HTML，尝试从 clientVars 或 window.global_data 中正则提取
      const match = text.match(/window\.global_data\s*=\s*(\{.*?\});/s) || text.match(/clientVars\s*=\s*(\{.*?\});/s)
      if (match) {
        try {
          const clientData = JSON.parse(match[1])
          const rows = extractRowsFromClientData(clientData, subId)
          if (rows && rows.length > 0) {
            console.log(`[Crawler] Successfully extracted ${rows.length} rows from HTML clientVars!`)
            return rows
          }
        } catch {}
      }
    } catch (err) {
      console.warn(`[Crawler] Failed fetching from ${url}:`, err.message)
    }
  }

  throw new Error('Online fetch failed or requires authenticated login session.')
}

function extractRowsFromApiJson(json) {
  const rows = json.data?.rows || json.rows || []
  return rows.map((r) => r.fields || r)
}

function extractRowsFromClientData(clientData, subId) {
  // 遍历多维表格的 sheet / views
  const sheets = clientData.sheets || clientData.sheetList || []
  const targetSheet = sheets.find((s) => s.id === subId || s.subId === subId || s.title?.includes('官方内推')) || sheets[0]
  if (!targetSheet) return []
  return targetSheet.rows || targetSheet.data?.rows || []
}

// 同步主函数
export async function runSync(options = {}) {
  let rawRows = null

  // 1. 优先尝试在线爬取
  try {
    rawRows = await fetchTencentSmartsheetOnline(
      options.docId || DEFAULT_DOC_ID,
      options.subId || DEFAULT_SUB_ID,
      options.cookie || process.env.TENCENT_DOCS_COOKIE || ''
    )
  } catch (err) {
    console.warn(`[Crawler Warning] ${err.message}`)
    console.log('[Crawler] Gracefully falling back to verified local seeds / cache...')
    
    // 降级回退：读取 seeds/ 目录中保存的真实多维表格数据源
    const fallbackPath = path.join(seedsDir, 'smartsheet_real_jobs.json')
    if (fs.existsSync(fallbackPath)) {
      rawRows = JSON.parse(fs.readFileSync(fallbackPath, 'utf-8'))
      console.log(`[Crawler Fallback] Loaded ${rawRows.length} verified records from: ${fallbackPath}`)
    } else {
      throw new Error(`Fallback file not found at ${fallbackPath}. Please provide an export file in seeds/.`)
    }
  }

  // 2. 数据清洗与规范化
  const normalizedJobs = []
  for (let i = 0; i < rawRows.length; i++) {
    const job = normalizeSmartsheetRow(rawRows[i], i)
    if (job) normalizedJobs.push(job)
  }

  console.log(`[Sync] Normalized ${normalizedJobs.length} authentic job referrals.`)

  // 3. 生成包含清理假数据 + 排重写入的 SQL 文件
  const outSqlPath = path.resolve(__dirname, '../migrations/0006_clean_mock_and_import_real_data.sql')
  const cleanMockSql = `-- 1. 清除旧测试占位数据（包括错误链接 pid=1001）\nDELETE FROM job_referrals WHERE id LIKE 'job_%' OR apply_url LIKE '%pid=1001%';\n\n`
  const upsertSql = generateUpsertSql(normalizedJobs)
  fs.writeFileSync(outSqlPath, cleanMockSql + upsertSql, 'utf-8')
  console.log(`[Sync] Generated migration script at: ${outSqlPath}`)

  // 同步输出一份规范化 JSON 至 seeds
  const outJsonPath = path.join(seedsDir, 'smartsheet_real_jobs.json')
  fs.writeFileSync(outJsonPath, JSON.stringify(normalizedJobs, null, 2), 'utf-8')
  console.log(`[Sync] Updated local seeds snapshot at: ${outJsonPath}`)

  return normalizedJobs
}

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  runSync().then(() => {
    console.log('[Done] Sync finished successfully.')
  }).catch((err) => {
    console.error('[Fatal Sync Error]', err)
    process.exit(1)
  })
}
