import { parseAtsJobs } from './ats_adapters.js'

async function md5Hex(str) {
  const msgBuffer = new TextEncoder().encode(str)
  const hashBuffer = await crypto.subtle.digest('SHA-256', msgBuffer)
  return Array.from(new Uint8Array(hashBuffer))
    .slice(0, 16)
    .map((b) => b.toString(16).padStart(2, '0'))
    .join('')
}

export async function syncSingleSource(source, env) {
  const jobs = await parseAtsJobs(source)
  let addedCount = 0

  const now = new Date().toISOString()
  for (const job of jobs) {
    const dedupHash = await md5Hex(`${source.company_name}_${job.job_title}_${job.apply_url}`)

    // 检查是否已经存在
    const existing = await env.DB.prepare('SELECT id FROM job_referrals WHERE dedup_hash = ?').bind(dedupHash).first()
    if (!existing) {
      await env.DB.prepare(
        `INSERT INTO job_referrals (
          id, source_id, company_name, industry, recruitment_type,
          job_categories, cities, job_title, apply_url, publish_time,
          deadline, status, highlights, is_official_sync, dedup_hash
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'active', ?, 1, ?)`
      ).bind(
        crypto.randomUUID(),
        source.id,
        source.company_name,
        job.industry || source.category,
        job.recruitment_type || '2027秋招',
        JSON.stringify(job.job_categories || ['技术研发']),
        JSON.stringify(job.cities || ['全国']),
        job.job_title,
        job.apply_url,
        now,
        job.deadline || '招满即止',
        job.highlights || '名企直通',
        dedupHash
      ).run()
      addedCount++
    }
  }

  // 更新渠道状态
  await env.DB.prepare(
    `UPDATE crawler_sources 
     SET last_sync_at = ?, last_job_count = last_job_count + ?, updated_at = ?
     WHERE id = ?`
  ).bind(now, addedCount, now, source.id).run()

  return { sourceId: source.id, company: source.company_name, addedCount }
}

export async function syncAllActiveSources(env) {
  const sources = await env.DB.prepare('SELECT * FROM crawler_sources WHERE status = "active"').all()
  const results = []
  for (const source of (sources.results || [])) {
    try {
      const res = await syncSingleSource(source, env)
      results.push(res)
    } catch (err) {
      console.error(`Sync error for ${source.company_name}:`, err)
      await env.DB.prepare('UPDATE crawler_sources SET status = "error" WHERE id = ?').bind(source.id).run()
    }
  }
  return results
}
