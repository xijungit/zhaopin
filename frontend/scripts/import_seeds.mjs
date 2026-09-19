import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const seedsDir = path.resolve(__dirname, '../../seeds')

const sourcesPath = path.join(seedsDir, 'soes_and_top500.json')
const jobsPath = path.join(seedsDir, 'initial_jobs.json')
const resourcesPath = path.join(seedsDir, 'initial_resources.json')

const sources = JSON.parse(fs.readFileSync(sourcesPath, 'utf-8'))
const jobs = JSON.parse(fs.readFileSync(jobsPath, 'utf-8'))
const resourcesData = JSON.parse(fs.readFileSync(resourcesPath, 'utf-8'))

console.log(`Loaded ${sources.length} sources, ${jobs.length} jobs, ${resourcesData.resources.length} resources, ${resourcesData.experiences.length} experiences.`)

// 生成完整的 SQL 种子文件用于 wrangler d1 execute --file=...
let sql = '-- Auto-generated seed data\n\n'

// 1. sources
for (const s of sources) {
  const pUrl = s.portal_url.replace(/'/g, "''")
  const cName = s.company_name.replace(/'/g, "''")
  const api = (s.api_endpoint || '').replace(/'/g, "''")
  sql += `INSERT OR REPLACE INTO crawler_sources (id, company_name, category, portal_url, api_endpoint, parser_type, status) VALUES ('${s.id}', '${cName}', '${s.category}', '${pUrl}', '${api}', '${s.parser_type}', 'active');\n`
}

// 2. jobs
for (const j of jobs) {
  const cName = j.company_name.replace(/'/g, "''")
  const title = j.job_title.replace(/'/g, "''")
  const apply = j.apply_url.replace(/'/g, "''")
  const cats = JSON.stringify(j.job_categories).replace(/'/g, "''")
  const cities = JSON.stringify(j.cities).replace(/'/g, "''")
  const hl = (j.highlights || '').replace(/'/g, "''")
  const code = (j.referral_code || '').replace(/'/g, "''")
  const hash = `${j.company_name}_${j.job_title}_${j.apply_url}`.replace(/'/g, "''")
  sql += `INSERT OR REPLACE INTO job_referrals (id, company_name, industry, recruitment_type, job_categories, cities, job_title, referral_code, apply_url, publish_time, deadline, status, highlights, is_official_sync, dedup_hash) VALUES ('${j.id}', '${cName}', '${j.industry}', '${j.recruitment_type}', '${cats}', '${cities}', '${title}', '${code}', '${apply}', '${j.publish_time}', '${j.deadline}', 'active', '${hl}', ${j.is_official_sync || 0}, '${hash}');\n`
}

// 3. resources
for (const r of resourcesData.resources) {
  const title = r.title.replace(/'/g, "''")
  const desc = (r.description || '').replace(/'/g, "''")
  const drive = r.drive_url.replace(/'/g, "''")
  const code = (r.access_code || '').replace(/'/g, "''")
  sql += `INSERT OR REPLACE INTO resource_materials (id, title, category, description, file_format, drive_url, access_code, points_required) VALUES ('${r.id}', '${title}', '${r.category}', '${desc}', '${r.file_format}', '${drive}', '${code}', ${r.points_required});\n`
}

// 4. experiences
for (const e of resourcesData.experiences) {
  const title = e.title.replace(/'/g, "''")
  const cName = e.company_name.replace(/'/g, "''")
  const summary = e.summary.replace(/'/g, "''")
  const detail = e.detail_content.replace(/'/g, "''")
  sql += `INSERT OR REPLACE INTO interview_experiences (id, title, company_name, position_type, round_tag, question_type, summary, detail_content, points_required, source_platform) VALUES ('${e.id}', '${title}', '${cName}', '${e.position_type}', '${e.round_tag}', '${e.question_type}', '${summary}', '${detail}', ${e.points_required}, '大厂上岸复盘');\n`
}

const outputPath = path.resolve(__dirname, '../migrations/0005_seed_data.sql')
fs.writeFileSync(outputPath, sql, 'utf-8')
console.log(`Successfully generated migration seed file: ${outputPath}`)
