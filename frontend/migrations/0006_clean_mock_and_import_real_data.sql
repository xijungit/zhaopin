-- 1. 清理初始化阶段虚构包含 pid=1001、旧 mock 占位以及残缺截断数据
DELETE FROM job_referrals WHERE id LIKE 'job_%' OR apply_url LIKE '%pid=1001%' OR apply_url LIKE '%3fSu7kU%';

-- Smartsheet Data Synchronized Import
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
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0002_c84b646d', '大疆', '科技/智能硬件', '27届秋招', '["技术类","营销类"]', '["深圳","上海","北京"]',
  '技术类、营销类、职能类等共12大类', 'DSKAXXcQ', 'https://app.mokahr.com/m/campus-recruitment/dji/148356', '2026-09-16T08:00:00.000Z', '招满即止', 'active',
  'DJI 大疆 2027“拓疆者计划”启动！本次校园招聘不设专业限制，全球飞行影像与机器人创新先锋。', 1, 'c84b646d343974c639015936f130bdab', CURRENT_TIMESTAMP
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
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0004_35ed9e6b', 'RoboSense', '机器人/芯片半导体', '27届秋招', '["芯片","算法","硬件","光学","嵌入式","机械"]', '["深圳","上海"]',
  '芯片、算法、硬件、光学、嵌入式、机械', 'DSDxfME8', 'https://app.mokahr.com/m/campus-recruitment/robosense/43128', '2026-09-15T08:00:00.000Z', '招满即止', 'active',
  '机器人头部企业-RoboSense（速腾聚创）激光雷达领军者2027校招！智能激光雷达系统科技企业。', 1, '35ed9e6be520c74b87b238bd540dac7d', CURRENT_TIMESTAMP
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
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0005_90611893', '微步在线', '科技/网络安全', '27届秋招', '["研发","安全","产品","设计","业务","市场"]', '["北京","上海","杭州","深圳"]',
  '研发、安全、产品、设计、业务、市场', 'DS5PGRsN', 'https://app.mokahr.com/m/campus_apply/threatbook/47289', '2026-09-15T08:00:00.000Z', '招满即止', 'active',
  '微步在线 2027 届校招正式启动！网络安全头部专精特新小巨人，专注数字时代威胁发现与响应。', 1, '906118934c9a23308689c0fd49231033', CURRENT_TIMESTAMP
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
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0006_26c5214f', '腾讯音乐', '互联网/文化娱乐', '27届秋招 日常实习', '["技术类","产品类","设计类","内容类","专业类"]', '["深圳","北京","广州"]',
  '技术类、产品类、设计类、内容类、专业类', 'DS49MPRX', 'https://join.tencentmusic.com/campus', '2026-09-14T08:00:00.000Z', '招满即止', 'active',
  '腾讯音乐2027校招全面启动！QQ音乐、酷狗音乐、酷我音乐、全民K歌全业务矩阵开放招聘。', 1, '26c5214f1b681e8f04d3921dad68935a', CURRENT_TIMESTAMP
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
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0007_d903ae00', '腾讯', '互联网/科技', '27届秋招 日常实习', '["技术类","产品类","设计类","职能类","市场类"]', '["深圳","北京","上海","广州","成都"]',
  '技术类、产品类、设计类、职能类、市场类', 'J0WFI7TE3T', 'https://join.qq.com/resume.html?k=ubm2831', '2026-09-14T08:00:00.000Z', '招满即止', 'active',
  '腾讯2027秋季招聘正式启动！岗位投递无上限，微信/IEG/PCG/CSIG/TEG/CDG核心事业群全面开放，享全员免费班车早晚餐与房补。', 1, 'd903ae00bf583065df96c95dc21998a7', CURRENT_TIMESTAMP
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
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0008_6b925140', 'OPPO', '智能硬件/消费电子', '27届秋招', '["产品类","AI","算法类","硬件类","软件类"]', '["东莞","深圳","成都","上海"]',
  '产品类、AI/算法类、硬件类、软件类', 'X8335075', 'https://careers.oppo.com/campus', '2026-09-12T08:00:00.000Z', '招满即止', 'active',
  'OPPO 2027 届校园招聘启动！全球化移动智能终端领军企业，专注智慧生活与前沿端侧AI技术。', 1, '6b925140062213bd5067bee04cc18f5b', CURRENT_TIMESTAMP
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
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0009_db0082b0', '字节跳动', '互联网/人工智能', '27届秋招', '["研发","产品","运营","设计","市场","职能"]', '["北京","上海","深圳","杭州","广州"]',
  '研发、产品、运营、设计、市场、职能', 'W9R8KTM', 'https://job.toutiao.com/s/iN3xJkY', '2026-09-12T08:00:00.000Z', '招满即止', 'active',
  '字节跳动2027校招全面开启！抖音、TikTok、剪映、飞书、火山引擎各业务线均开放大批HC，顶薪SP/SSP。', 1, 'db0082b0a04a7e2ef2c91b9f7e316172', CURRENT_TIMESTAMP
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
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0010_1416262d', '美团', '互联网/本地生活', '27届秋招', '["技术类","零售类","产品类","运营类","商企及职能类"]', '["北京","上海","深圳","成都","武汉"]',
  '技术类、零售类、产品类、运营类、商企及职能类', 'MTNT2027', 'https://zhaopin.meituan.com/web/campus', '2026-09-10T08:00:00.000Z', '招满即止', 'active',
  '美团2027届秋季校招北极星计划，无人机/自动配送/到店到家业务HC充足。', 1, '1416262d72fa4ccb0a8767182953828a', CURRENT_TIMESTAMP
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
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0011_a7863d17', '阿里巴巴', '互联网/电商与云计算', '27届秋招', '["研发类","算法类","产品类","运营类"]', '["杭州","北京","上海","深圳"]',
  '研发类、算法类、产品类、运营类', 'ALI2027NT', 'https://talent.alibaba.com/campus/home', '2026-09-10T08:00:00.000Z', '招满即止', 'active',
  '阿里巴巴控股集团及淘天、阿里云各业务子集团联合校招，支持一键投递与进度跟踪。', 1, 'a7863d170513af3b99c80c5c6d5b1041', CURRENT_TIMESTAMP
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
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0012_b4e681e7', '华为', '通信/智能终端', '27届秋招', '["软件工程师","硬件工程师","芯片研发","算法工程师"]', '["深圳","北京","上海","南京","杭州","成都","西安"]',
  '软件工程师、硬件工程师、芯片研发、算法工程师', 'HWNEITUI2027', 'https://career.huawei.com', '2026-09-08T08:00:00.000Z', '招满即止', 'active',
  '华为2027届应届生招聘，计算产品线、终端BG、海思、云核心网全国各研究所全面开放。', 1, 'b4e681e7d4cbd6f0f82c6e70228503b6', CURRENT_TIMESTAMP
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
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0013_88e77bc3', '宁德时代', '新能源/动力电池', '27届秋招', '["电芯研发","材料研发","智能制造","供应链类"]', '["宁德","上海","厦门","溧阳","宜宾"]',
  '电芯研发、材料研发、智能制造、供应链类', 'CATL2027', 'https://talent.catl.com', '2026-09-08T08:00:00.000Z', '招满即止', 'active',
  '全球动力电池龙头宁德时代（CATL）2027全球校园招聘，极限制造与研发人才引进计划。', 1, '88e77bc30918f358093b1ecb14656392', CURRENT_TIMESTAMP
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
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0014_e5b04ebf', '比亚迪', '新能源汽车', '27届秋招', '["整车研发","三电系统","自动驾驶","营销服务"]', '["深圳","西安","长沙","合肥","常州"]',
  '整车研发、三电系统、自动驾驶、营销服务', 'BYDNT2027', 'https://job.byd.com', '2026-09-05T08:00:00.000Z', '招满即止', 'active',
  '比亚迪2027届校园招聘万人计划，涵盖新能源汽车全产业链，行业领先技术平台。', 1, 'e5b04ebf8ffaeb04a54bfecaeafdf1f5', CURRENT_TIMESTAMP
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
