-- 0007_fix_smartsheet_referral_links.sql
-- 修正智元机器人及相关多维表格真实内推链接与去重哈希

-- 1. 清除历史上截断的错误飞书招聘链接（3fSu7kU 等）与旧测试占位
DELETE FROM job_referrals WHERE apply_url LIKE '%3fSu7kU%' OR apply_url LIKE '%pid=1001%' OR id LIKE 'job_%';

-- 2. 插入或更新智元机器人（AGIBOT）真实完整内推链接 (https://agirobot.jobs.feishu.cn/s/3fSu7k60gXw)
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0003_816e6eee', '智元机器人', '机器人/人工智能', '27届秋招', '["技术类","产品类","营销服类","采购类","职能类"]', '["上海","北京","深圳","苏州"]',
  '技术类、产品类、营销服类、采购类、职能类', 'N3NGUCJ', 'https://agirobot.jobs.feishu.cn/s/3fSu7k60gXw', '2026-09-16T08:00:00.000Z', '招满即止', 'active',
  '具身智能领域Top企业——智元机器人（AGIBOT）2027秋招全面启动！聚焦具身人形机器人核心技术研发。', 1, '816e6eee5eb1d3ed52be9df952818c96', CURRENT_TIMESTAMP
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
  updated_at = CURRENT_TIMESTAMP;

-- 3. 确保沐曦股份内推链接与内推码正确生效
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0001_cae53d79', '沐曦股份', '芯片半导体', '27届秋招', '["硬件类","软件类","商务类","管理类"]', '["上海","南京","北京","成都"]',
  '硬件类、软件类、商务类、管理类', 'DSgWzfPv', 'https://app.mokahr.com/m/campus_apply/metax-tech/42792', '2026-09-16T08:00:00.000Z', '招满即止', 'active',
  '沐曦股份2027届校招全面启动！【企业简介】沐曦致力于打造全栈GPU芯片及计算平台，提供全栈GPU芯片及解决方案。', 1, 'cae53d79072956ffd681b9cc84b119fb', CURRENT_TIMESTAMP
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
  updated_at = CURRENT_TIMESTAMP;

-- 4. 确保腾讯真实内推链接正确生效 (k=ubm2831)
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0007_d903ae00', '腾讯', '互联网/高科技', '27届秋招', '["技术类","产品类","设计类","职能类","市场类"]', '["深圳","北京","上海","广州","成都"]',
  '技术类、产品类、设计类、职能类、市场类', 'J0WFI7TE3T', 'https://join.qq.com/resume.html?k=ubm2831', '2026-09-14T08:00:00.000Z', '招满即止', 'active',
  '腾讯2027秋季招聘启动！涵盖微信、QQ、腾讯云、天美等核心业务，海量HC面向全球学子。', 1, 'd903ae00bf583065df96c95dc21998a7', CURRENT_TIMESTAMP
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
  updated_at = CURRENT_TIMESTAMP;