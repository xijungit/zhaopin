import os from 'node:os'
import fs from 'node:fs'
import path from 'node:path'
import crypto from 'node:crypto'
import { fileURLToPath } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const rootDir = path.resolve(__dirname, '../..')
const seedsDir = path.join(rootDir, 'seeds')

function generateHash(str) {
  return crypto.createHash('sha256').update(str).digest('hex').slice(0, 12)
}

function cleanString(val) {
  if (val === null || val === undefined) return ''
  return String(val).trim()
}

function extractUrlAndCode(text) {
  if (!text) return { url: '', code: '' }
  let url = ''
  let code = ''

  const urlMatch = text.match(/https?:\/\/[^\s\u4e00-\u9fa5<>'"，,）)]+/)
  if (urlMatch) {
    url = urlMatch[0].trim()
    if (url.includes('docs.qq.com/scenario/link.html') || url.includes('link-warning') || url.includes('docs.qq.com/links/')) {
      try {
        const u = new URL(url)
        const target = u.searchParams.get('url') || u.searchParams.get('target') || u.searchParams.get('dest')
        if (target) url = decodeURIComponent(target).trim()
      } catch {}
    }
  }

  const codeMatch = text.match(/(?:提取码|密码|访问码|code)[：:\s]*([a-zA-Z0-9]{4,8})/i)
  if (codeMatch) {
    code = codeMatch[1].trim()
  }

  return { url, code }
}

function inferFormat(title, desc, url) {
  const combined = (title + ' ' + desc + ' ' + url).toLowerCase()
  if (combined.includes('pdf')) return 'PDF 文档'
  if (combined.includes('excel') || combined.includes('xlsx') || combined.includes('表格')) return 'Excel 题库'
  if (combined.includes('zip') || combined.includes('rar') || combined.includes('压缩包')) return 'ZIP 资料包'
  if (combined.includes('nowcoder.com')) return '在线答题试卷'
  if (combined.includes('docs.qq.com') || combined.includes('feishu.cn')) return '在线协同文档'
  if (combined.includes('pan.baidu.com')) return '百度网盘资源'
  if (combined.includes('pan.quark.cn')) return '夸克网盘资源'
  return 'PDF / 电子题库'
}

export function normalizeExperienceRow(row, idx = 0) {
  const company = cleanString(row['公司名称'] || row['公司'] || row['企业名称'] || row['企业'] || row['company_name'] || '')
  const position = cleanString(row['岗位'] || row['岗位名称'] || row['投递岗位'] || row['技术方向'] || row['position_type'] || '')
  
  let title = cleanString(row['标题'] || row['面经标题'] || row['经验总结'] || row['title'] || '')
  if (!title) {
    if (company || position) {
      title = `${company || '大厂'}${position || '核心技术岗'}面试全流程复盘【上岸经验】`
    } else {
      const firstVal = Object.values(row).find(v => typeof v === 'string' && v.length > 4 && !v.startsWith('http'))
      title = firstVal ? `${firstVal.slice(0, 30)} - 面经复盘` : `名企求职高频面试真题解析 #${idx + 1}`
    }
  }

  const roundTag = cleanString(row['轮次'] || row['面试轮次'] || row['环节'] || row['round_tag'] || '全流程复盘')
  const questionType = cleanString(row['考察类型'] || row['核心考点'] || row['考点'] || row['技术栈'] || row['question_type'] || '综合技术与项目深度')
  let summary = cleanString(row['摘要'] || row['总结'] || row['简述'] || row['核心建议'] || row['summary'] || '')
  const detail = cleanString(row['详情'] || row['内容'] || row['详细面经'] || row['面经内容'] || row['答题要点'] || row['detail_content'] || '')

  if (!summary && detail) {
    summary = detail.slice(0, 140).replace(/\r?\n/g, ' ') + (detail.length > 140 ? '...' : '')
  }
  if (!summary) {
    summary = `${company || '目标企业'} ${position || '目标岗位'} 真实面试高频真题与核心问答全面拆解，含避坑指南。`
  }

  const sourceUrl = cleanString(row['链接'] || row['原文链接'] || row['网申链接'] || row['source_url'] || '')
  const hash = generateHash(`${company}_${position}_${title}`)
  const id = `exp_real_${String(idx + 1).padStart(4, '0')}_${hash}`

  return {
    id,
    title,
    company_name: company || '名企',
    position_type: position || '综合类',
    round_tag: roundTag,
    question_type: questionType,
    summary,
    detail_content: detail || summary,
    points_required: 5,
    source_platform: '多维表格-大厂面试经验总结',
    source_url: sourceUrl
  }
}

export function normalizeResourceRow(row, idx = 0, defaultCategory = '校招通关题库') {
  let title = cleanString(
    row['试卷名字'] || row['资料名称'] || row['名称'] || row['标题'] || 
    row['真题资料'] || row['试卷名称'] || row['题库名称'] || row['岗位名称'] || 
    row['岗位'] || row['公司'] || row['企业'] || row['title'] || ''
  )
  
  if (!title) {
    const textVals = Object.values(row).filter(v => typeof v === 'string' && v.trim().length > 0 && !v.startsWith('http'))
    if (textVals.length > 0) title = textVals[0]
  }

  if (!title) return null

  const rawUrlField = cleanString(row['试卷真题地址'] || row['网盘链接'] || row['链接'] || row['下载链接'] || row['地址'] || row['drive_url'] || '')
  const rawDescField = cleanString(row['描述'] || row['简介'] || row['考点说明'] || row['建议用时'] || row['建议用时（分钟）'] || row['description'] || '')
  const extracted = extractUrlAndCode(rawUrlField || rawDescField || JSON.stringify(row))

  const driveUrl = extracted.url || rawUrlField || 'https://docs.qq.com/smartsheet/DRmRGYk14dW53VHdS'
  const accessCode = cleanString(row['提取码'] || row['密码'] || row['access_code'] || extracted.code || '')

  let category = cleanString(row['分类'] || row['类别'] || row['category'] || '')
  if (!category) {
    const sheetTag = cleanString(row['_source_sheet'] || '')
    if (sheetTag.includes('答题思路')) category = '答题思路与秘籍'
    else if (sheetTag.includes('真题合集') || sheetTag.includes('直题合集')) category = '大厂历年真题'
    else if (sheetTag.includes('资料库') || sheetTag.includes('题库')) category = '校招通关题库'
    else if (title.includes('思路') || title.includes('技巧')) category = '答题思路与秘籍'
    else if (title.includes('真题') || title.includes('直题') || title.includes('大厂') || title.includes('试卷')) category = '大厂历年真题'
    else category = defaultCategory
  }

  let description = rawDescField
  if (row['建议用时（分钟）'] || row['建议用时']) {
    description = `建议用时: ${row['建议用时（分钟）'] || row['建议用时']} 分钟。${description}`.trim()
  }
  if (!description) {
    description = `${title}，校招面试核心真题题库与详细解析资料。`
  }

  const fileFormat = cleanString(row['文件格式'] || row['格式'] || row['file_format'] || inferFormat(title, description, driveUrl))
  const hash = generateHash(`${title}_${driveUrl}`)
  const id = `res_real_${String(idx + 1).padStart(4, '0')}_${hash}`

  return {
    id,
    title,
    category,
    description,
    file_format: fileFormat,
    drive_url: driveUrl,
    access_code: accessCode,
    points_required: 10,
    download_count: 0
  }
}

export function generateMigrationSql(experiences, resources) {
  let sql = `-- 0008_import_real_experiences_and_resources.sql\n`
  sql += `-- 同步多维表格真实“面经复盘”与“真题资料”，并清除测试占位 Mock 数据\n\n`
  sql += `-- 1. 清理初始化阶段虚拟 Mock 经历与资源数据\n`
  sql += `DELETE FROM interview_experiences WHERE id LIKE 'exp_0%';\n`
  sql += `DELETE FROM resource_materials WHERE id LIKE 'res_0%';\n\n`

  if (experiences.length > 0) {
    sql += `-- 2. 导入真实面经复盘 (共 ${experiences.length} 条)\n`
    for (const exp of experiences) {
      const title = exp.title.replace(/'/g, "''")
      const comp = exp.company_name.replace(/'/g, "''")
      const pos = exp.position_type.replace(/'/g, "''")
      const round = (exp.round_tag || '').replace(/'/g, "''")
      const qType = (exp.question_type || '').replace(/'/g, "''")
      const summary = exp.summary.replace(/'/g, "''")
      const detail = exp.detail_content.replace(/'/g, "''")
      const srcUrl = (exp.source_url || '').replace(/'/g, "''")

      sql += `INSERT OR REPLACE INTO interview_experiences (
  id, title, company_name, position_type, round_tag, question_type,
  summary, detail_content, points_required, source_platform, source_url
) VALUES (
  '${exp.id}', '${title}', '${comp}', '${pos}', '${round}', '${qType}',
  '${summary}', '${detail}', ${exp.points_required}, '多维表格-大厂面试经验总结', '${srcUrl}'
);\n`
    }
    sql += `\n`
  }

  if (resources.length > 0) {
    sql += `-- 3. 导入真实真题资料 (共 ${resources.length} 条)\n`
    for (const res of resources) {
      const title = res.title.replace(/'/g, "''")
      const cat = res.category.replace(/'/g, "''")
      const desc = res.description.replace(/'/g, "''")
      const fmt = res.file_format.replace(/'/g, "''")
      const url = res.drive_url.replace(/'/g, "''")
      const code = (res.access_code || '').replace(/'/g, "''")

      sql += `INSERT OR REPLACE INTO resource_materials (
  id, title, category, description, file_format, drive_url, access_code, points_required, download_count
) VALUES (
  '${res.id}', '${title}', '${cat}', '${desc}', '${fmt}', '${url}', '${code}', ${res.points_required}, 0
);\n`
    }
    sql += `\n`
  }

  return sql
}

function extractRowsRecursively(data) {
  let expRows = []
  let resRows = []

  if (!data || typeof data !== 'object') return { expRows, resRows }

  // 如果直接是数组
  if (Array.isArray(data)) {
    data.forEach(item => {
      if (typeof item === 'object' && item !== null) {
        const itemStr = JSON.stringify(item)
        if (itemStr.includes('面试经验') || itemStr.includes('上岸版') || itemStr.includes('面经')) {
          expRows.push(item)
        } else {
          resRows.push(item)
        }
      }
    })
    return { expRows, resRows }
  }

  // 递归检查对象键
  for (const [k, v] of Object.entries(data)) {
    if (v && typeof v === 'object') {
      if (Array.isArray(v) && v.length > 0 && typeof v[0] === 'object') {
        const sampleStr = JSON.stringify(v[0])
        if (sampleStr.includes('试卷') || sampleStr.includes('公司') || sampleStr.includes('岗位') || sampleStr.includes('链接') || sampleStr.includes('nowcoder')) {
          if (k.includes('面试') || k.includes('上岸')) {
            expRows.push(...v.map(r => ({ ...r, _source_sheet: k })))
          } else {
            resRows.push(...v.map(r => ({ ...r, _source_sheet: k })))
          }
        }
      }
    }
  }

  return { expRows, resRows }
}

export async function runImport() {
  console.log('[Import] 正在检索 seeds/ 目录下的多维表格数据源...')
  const candidates = [
    path.join(seedsDir, 'smartsheet_real_dump.json'),
    path.join(seedsDir, 'experiences_and_resources.json'),
    path.join(seedsDir, 'tencent_smartsheet_export.json'),
    path.join(seedsDir, 'smartsheet_export.json'),
    path.join(os.homedir(), 'Downloads', 'smartsheet_real_dump.json'),
    path.join(os.homedir(), 'Downloads', 'experiences_and_resources.json')
  ]

  let sourceFile = candidates.find(f => fs.existsSync(f))
  let rawExp = []
  let rawRes = []

  if (sourceFile) {
    if (sourceFile.includes(os.homedir())) {
      const dest = path.join(seedsDir, path.basename(sourceFile));
      fs.copyFileSync(sourceFile, dest);
      console.log(`[Import] 自动将 Downloads 中的 ${path.basename(sourceFile)} 归档至 seeds/ 目录`);
      sourceFile = dest;
    }
    console.log(`[Import] 读取数据源: ${sourceFile}`)
    const json = JSON.parse(fs.readFileSync(sourceFile, 'utf-8'))
    
    if (json.experiences) rawExp.push(...json.experiences)
    if (json.resources) rawRes.push(...json.resources)

    if (json.sheets) {
      for (const [title, rows] of Object.entries(json.sheets)) {
        if (title.includes('面试经验') || title.includes('上岸版') || title.includes('面经')) {
          rawExp.push(...rows.map(r => ({ ...r, _source_sheet: title })))
        } else {
          rawRes.push(...rows.map(r => ({ ...r, _source_sheet: title })))
        }
      }
    }

    if (rawExp.length === 0 && rawRes.length === 0) {
      // 深度提取内存 dump 结构
      const extracted = extractRowsRecursively(json.raw_data || json)
      rawExp.push(...extracted.expRows)
      rawRes.push(...extracted.resRows)
    }
  }

  if (rawExp.length === 0 && rawRes.length === 0) {
    console.log('\n[提示] 未在数据源中发现有效真实数据行。')
    return { success: false }
  }

  console.log(`[Import] 解析到原始面经记录: ${rawExp.length} 条，真题记录: ${rawRes.length} 条`)

  const normalizedExp = rawExp.map((r, i) => normalizeExperienceRow(r, i)).filter(Boolean)
  const normalizedRes = rawRes.map((r, i) => normalizeResourceRow(r, i)).filter(Boolean)

  console.log(`[Import] 清洗归一化完成: 有效面经 ${normalizedExp.length} 条，有效真题 ${normalizedRes.length} 条`)

  fs.writeFileSync(path.join(seedsDir, 'real_experiences.json'), JSON.stringify(normalizedExp, null, 2), 'utf-8')
  fs.writeFileSync(path.join(seedsDir, 'real_resources.json'), JSON.stringify(normalizedRes, null, 2), 'utf-8')

  const migrationsDir = path.join(__dirname, '../migrations')
  const migrationPath = path.join(migrationsDir, '0009_import_real_experiences_and_resources.sql')
  const migrationSql = generateMigrationSql(normalizedExp, normalizedRes)
  fs.writeFileSync(path.join(migrationsDir, '0008_import_real_experiences_and_resources.sql'), migrationSql, 'utf-8');

  fs.writeFileSync(migrationPath, migrationSql, 'utf-8')
  console.log(`[Import] 🎉 成功生成 D1 增量数据迁移文件: ${migrationPath}`)
  console.log(`[Import] 执行 'npm run db:migrate:remote' 即可将真实数据部署至线上生产库！\n`)

  return {
    success: true,
    experiencesCount: normalizedExp.length,
    resourcesCount: normalizedRes.length,
    migrationPath
  }
}

if (process.argv[1] === fileURLToPath(import.meta.url)) {
  runImport().catch(err => {
    console.error('[Import Error]', err)
    process.exit(1)
  })
}
