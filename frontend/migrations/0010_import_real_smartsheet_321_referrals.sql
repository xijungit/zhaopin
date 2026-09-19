-- 1. 清除旧测试占位数据（包括错误链接 pid=1001）
DELETE FROM job_referrals WHERE id LIKE 'job_%' OR id LIKE 'smartsheet_%' OR apply_url LIKE '%pid=1001%';

-- Smartsheet Data Synchronized Import
INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  'smartsheet_0001_6b14e0be', '普渡机器人', '机器人', '27届秋招', '["软件类","硬件类","机械结构类","项目类","测试类","设计类","产品类","销售类","解决方案&技术支持类","供应链类"]', '["深圳","成都","其他国内外城市"]',
  '软件类	、硬件类	、机械结构类	、项目类	、测试类	、设计类	、产品类	、销售类	、解决方案&技术支持类	、供应链类', 'EVVRR0', 'https://pudutech1.zhiye.com/campus/jobs?shareId=b67a4454-fd00-45d7-824d-2ada995db588&shareSource=2', '2026-09-18T08:00:00.000Z', '招满即止', 'active',
  '普渡机器人27届校招&28届实习正式启动

【关于普渡】商用服务机器人领域市占率TOP1，行业首家完成机器人3大形态布局，世界四大工业设 奖大满贯，企业专利数1842件(含申请中)，国家级专精特新重点“小巨人”企业，福布斯中国·出海 球化品牌TOP30，深圳/成都/香港 3大研发中心，自研体系成熟

【岗位类别】算法类、	软件类	、硬件类	、机械结构类	、项目类	、测试类	、设计类	、产品类	、销售类	、解决方案&技术支持类	、供应链类

【工作地点】深圳、成都、其他国内外城市

【27届校招内推链接】https://pudutech1.zhiye.com/campus/jobs?shareId=b67a4454-fd00-45d7-824d-2ada995db588&shareSource=2
【28届实习内推链接】
https://pudutech1.zhiye.com/intern/jobs?shareId=c380f828-92d3-4d09-b049-bb33dedea847&shareSource=2

【推荐码】EVVRR0（内推简历优先筛选，面试流程加速）', 1, '6b14e0be235455da782a0c3969d85d5d', CURRENT_TIMESTAMP
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
  'smartsheet_0002_c50b053b', '卓驭', '智能驾驶', '27届秋招', '["软件","机械电气","嵌入式","测试","安全","系统工程","非研发"]', '["深圳","上海","北京","香港"]',
  '软件 / 机械电气 / 嵌入式 / 测试 / 安全 / 系统工程 / 非研发', 'EZ38HK', 'https://we.zyt.com/campus/jobs?shareId=12366703-6d94-4d5d-9448-d8d1bac51308&shareSource=2', '2026-09-18T08:00:00.000Z', '招满即止', 'active',
  '卓驭2027届校园招聘正式启动！

【关于卓驭】
1️⃣ 掌握大模型算法、数据闭环等核心技术，具备成熟量产经验
2️⃣ 为车企提供可落地的智能驾驶解决方案，已获上百款车型合作
3️⃣ 涵盖乘用车、商用车、物流车以及通用自主移动机器人场景，迈向移动物理AI

【招聘岗位】算法 / 软件 / 机械电气 / 嵌入式 / 测试 / 安全 / 系统工程 / 非研发等

加入我们，你将拥有：
✅ 有竞争力的薪酬 ——住房补贴等多方位福利
✅ 量产级项目实战 —— 你的创新成果，真的会跑在路上
✅ 工程师文化 —— 在纯粹高效的工作氛围中实现专业价值
✅ 完善的成长体系 —— 1v1导师制 + 定制化培养方案 + 每年晋升窗口

【工作地点】深圳/上海/北京/香港

【内推链接】
https://we.zyt.com/campus/jobs?shareId=12366703-6d94-4d5d-9448-d8d1bac51308&shareSource=2

【内推码】EZ38HK（简历优先筛选，后续流程欢迎联系）', 1, 'c50b053bfbf256ad6bc34b1d33d987c3', CURRENT_TIMESTAMP
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
  'smartsheet_0003_a06d1d44', '搜狐畅游', '游戏', '27届秋招', '["游戏策划类","游戏程序开发类","游戏美术类","游戏运营类","平台技术类","平台职能类","平台业务类"]', '["北京"]',
  '游戏策划类、游戏程序开发类、游戏美术类、游戏运营类、平台技术类、平台职能类、平台业务类', 'DSZtExJv', 'https://app.mokahr.com/m/campus_apply/cyou-inc/42233?recommendCode=DSZtExJv&hash=%23%2Fjobs#/jobs', '2026-09-17T08:00:00.000Z', '招满即止', 'active',
  '14-16薪-搜狐畅游2027秋招启动！（专业不限）

部分岗位兼收26届，8大类别全覆盖，30+岗位同时开放，大部分岗位无笔试，直通面试！七险一金、年度体检、18 天带薪年假、绩效奖金…更多福利，等你解锁！

【关于畅游】
中国领先的互联网游戏开发和运营商，搜狐全资子公司，代表产品包括：《天龙八部》等，每年另有 20 多个在研项目，年营收 50亿+

【薪酬福利】
全年14-16薪、非京生源校招提前实习住房补贴、七险一金、24小时健身房、瑜伽室、年度体检、家属体检、企业滴滴、15天带薪年假、3天春节探亲假、团队团建、节日活动、惊喜年会、61畅游日等等

【内推链接】https://app.mokahr.com/m/campus_apply/cyou-inc/42233?recommendCode=DSZtExJv&hash=%23%2Fjobs#/jobs

【内推码】DSZtExJv（内推投递，简历优先处理，面试流程加快）', 1, 'a06d1d449af7fdf5c992790430f5f090', CURRENT_TIMESTAMP
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
  'smartsheet_0004_6aafdaa5', '永卓控股', '制造业', '27届秋招', '["工艺研发类｜智能制造类｜船舶制造类｜工程建设类｜数智信息类｜财经投资类｜运营管理类"]', '["张家港","苏州","上海","威海","连云港"]',
  '工艺研发类｜智能制造类｜船舶制造类｜工程建设类｜数智信息类｜财经投资类｜运营管理类', 'BH42NC1', 'https://everrising.jobs.feishu.cn/s/onasTl4DZEM', '2026-09-17T08:00:00.000Z', '招满即止', 'active',
  '永卓控股2027校招启动！
公司简介：永卓控股始创1984年，总部江苏张家港，2025年营收1655亿，民企500强第47位，业务包含钢铁制造、先进材料、前沿投资、矿业运营 、大物流，覆盖近200国，产品落地港珠澳大桥、南水北调等大国工程。
 
薪酬福利：
▪️本科10-15w/年｜硕士15-25w/年｜博士30w/年起，优秀者薪资无上限
▪️试用期薪资全额发放，两年薪资保护，每年调薪通道
▪️6亿打造酒店式员工公寓，8000㎡文体中心，安家礼包+时令福利
 
招聘岗位：工艺研发类｜智能制造类｜船舶制造类｜工程建设类｜数智信息类｜财经投资类｜运营管理类

工作地点：张家港、苏州、上海、威海、连云港

【内推链接】https://everrising.jobs.feishu.cn/s/onasTl4DZEM

【内推码】BH42NC1（简历优先筛选）', 1, '6aafdaa5e0114b7476f80f38cc2df97f', CURRENT_TIMESTAMP
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
  'smartsheet_0005_1702ad84', '七十迈', '制造业/跨境电商', '27届秋招', '["硬件工程师","射频工程师","移动应用开发工程师","云端开发工程师","影像软件工程师","嵌入式软件工程师","海外市场GTM","亚马逊广告投放"]', '["上海","武汉","深圳"]',
  '硬件工程师、射频工程师、移动应用开发工程师、云端开发工程师、影像软件工程师、嵌入式软件工程师、海外市场GTM、亚马逊广告投放', 'ESVMA0', 'https://70mai.zhiye.com/campus/jobs?shareId=2c0f31a8-1832-46f4-9d9b-9fccfd2031e2&shareSource=2', '2026-09-17T08:00:00.000Z', '招满即止', 'active',
  '七十迈2027届校招今日启动！
公司简介：七十迈坚持自主研发，专注于车载影像、家用影像、宠物智能用品，服务150+国家和地区、全球超千万用户，坚持自主研发驱动创新，获得过德国iF、红点等国际设计大奖，技术实力与设计审美双在线！

开放岗位：硬件工程师、射频工程师、移动应用开发工程师、云端开发工程师、影像软件工程师、嵌入式软件工程师、海外市场GTM、亚马逊广告投放（具体以官网为准）

 工作基地：上海、武汉、深圳

为什么选择我们：在这里，你能收获「薪资能打+节奏自由+福利拉满」的工作体验，更能参与全球化品牌成长事业！校招训练营、1V1导师带教、六险一金、绩效奖金…

内推链接：https://70mai.zhiye.com/campus/jobs?shareId=2c0f31a8-1832-46f4-9d9b-9fccfd2031e2&shareSource=2

内推码：ESVMA0（简历优先筛选，流程加快！）', 1, '1702ad846dc180fb22ad29225f564b1a', CURRENT_TIMESTAMP
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
  'smartsheet_0006_bcee3385', '云览科技', '科技', '27届秋招', '["研发","算法","产品","设计等岗位"]', '["成都"]',
  '研发、算法、产品、设计等岗位', '通过内推链接投递即可', 'https://cloudview-inc.com/join/jobs?inviteCode=fY2fW', '2026-09-17T08:00:00.000Z', '招满即止', 'active',
  '云览科技 2027届校招正式启动！
企业介绍：云览科技总部位于成都，公司旗舰产品Phoenix，月活跃用户超过1.5亿，覆盖超过25种语言，致力于打造领先的综合内容发现平台。公司由腾讯、传音等知名机构投资，累计融资超1亿美元。
💰 研发类：年薪 23万–45万
💰 产品/设计类：年薪 20万–30万
面向2026年9月—2027年8月毕业生，研发、算法、产品、设计等岗位热招中！
加入我们，你将获得：
✨ AI Native工作方式
🌍 国际化业务与全球视野
💡 导师带教、核心业务实践及完善福利
📍工作地点：成都
🔗 内推链接：https://cloudview-inc.com/join/jobs?inviteCode=fY2fW
欢迎转发，期待与你在云览科技见面！', 1, 'bcee33858db19658c13c663262b4a513', CURRENT_TIMESTAMP
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
  'smartsheet_0007_e6c7f872', '沐曦股份', '芯片半导体', '27届秋招', '["硬件类","软件类","商务类","管理类"]', '["上海","南京","北京","成都","深圳","杭州","长沙"]',
  '硬件类、软件类、商务类、管理类', 'DSgWzfPv', 'https://app.mokahr.com/m/campus_apply/metax-tech/58131?recommendCode=DSgWzfPv#/jobs', '2026-09-16T08:00:00.000Z', '招满即止', 'active',
  '沐曦股份2027届校招启动！
【企业简介】沐曦股份是科创板上市企业，致力于自主研发全栈高性能GPU芯片及计算平台,为人工智能训练、推理,图形渲染,科学智能等提供"通用易用、稳定可靠"的算力支撑,成为数字经济发展的基石

【招聘岗位】硬件类、软件类、商务类、管理类

【工作地点】上海、南京	、北京、	成都、	深圳	、杭州、长沙

【福利待遇】13薪+绩效奖励、公积金缴纳	比例12%、补充商业保险、	快乐职场	、福利年假、年度体检、定期团建活动、免费咖啡	零食、各类社团活动

【内推链接】https://app.mokahr.com/m/campus_apply/metax-tech/58131?recommendCode=DSgWzfPv#/jobs

【内推码】DSgWzfPv（简历优先筛选）', 1, 'e6c7f872205cc0672c1a486163794456', CURRENT_TIMESTAMP
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
  'smartsheet_0008_e9a34fb5', '大疆', '科技', '27届秋招', '["技术类","营销类","100+岗位"]', '["深圳","上海","北京"]',
  '技术类、营销类、职能类等共12大类 100+岗位', 'DSKAXxcQ', 'https://app.mokahr.com/m/campus-recruitment/dji/143359?recommendCode=DSKAXxcQ#/jobs', '2026-09-15T08:00:00.000Z', '招满即止', 'active',
  'DJI 大疆 2027“拓疆者”校园招聘全球启动！
⚠️本次校园招聘不设置网申截止时间，招满即止
面向人群：2027届高校毕业生（优秀的2026届毕业生可适当放宽筛选条件）
工作城市：深圳/上海/北京

招聘岗位：技术类、营销类、职能类等共12大类 100+岗位全面放开投递！

【内推链接】https://app.mokahr.com/m/campus-recruitment/dji/143359?recommendCode=DSKAXxcQ#/jobs

【内推码】DSKAXxcQ（务必填写，内推投递简历优先筛选）', 1, 'e9a34fb547f196624e88f3ffdb1c4465', CURRENT_TIMESTAMP
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
  'smartsheet_0009_94e04748', '智元机器人', '机器人', '27届秋招', '["技术类","产品类","营销服类","采购类","制造类","职能类"]', '["上海","北京","深圳","香港","海外"]',
  '技术类、产品类、营销服类、采购类、制造类、职能类', 'N3NGUCJ', 'https://agirobot.jobs.feishu.cn/s/3fSu7k60gXw', '2026-09-15T08:00:00.000Z', '招满即止', 'active',
  '具身智能领域top企业-智元机器人27届校招全面启动！
 
公司简介：智元机器人由前华为“天才少年”稚晖君联合创立，短短时间就已构建机器人本体+AI全栈技术，实现人形机器人规模化量产与全球商用！产品售往全球多个国家和地区。

招聘岗位：技术类、产品类、营销服类、采购类、制造类、职能类

工作地点：上海/北京/深圳/香港/海外

为什么加入智元：极具竞争力的薪酬和激励体系，快速成长的工作环境，轻松团结的团队氛围

【内推链接】
https://agirobot.jobs.feishu.cn/s/3fSu7k60gXw

【内推码】N3NGUCJ（推荐方式选择大使推荐，后续流程欢迎咨询）', 1, '94e04748f521ea5ae2826d3be873bb63', CURRENT_TIMESTAMP
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
  'smartsheet_0010_1e8ed4d4', 'RoboSense', '机器人/芯片半导体', '27届秋招', '["芯片","算法","硬件","光学","嵌入式","机器人控制","产品","项目管理等"]', '["深圳","上海"]',
  '芯片、算法、硬件、光学、嵌入式、机器人控制、产品、项目管理等', 'DSDxfME8', 'https://app.mokahr.com/m/campus-recruitment/robosense/69887?recommendCode=DSDxfME8#/jobs', '2026-09-14T08:00:00.000Z', '招满即止', 'active',
  '机器人头部企业-RoboSense 27届校招启动！
企业实力：全球3D感知&人形机器人头部，2100+自研专利，车规芯片自研，机器人赛道出货量第一

薪资福利：顶薪+百万奖金+专利奖+股票｜大牛导师+全球轮岗+全新办公园区

岗位覆盖：芯片/算法/硬件/光学/嵌入式/机器人控制/产品/项目管理等

工作地点：深圳、上海

注意：每人可投2岗，提前批不影响正式批

【内推链接】https://app.mokahr.com/m/campus-recruitment/robosense/69887?recommendCode=DSDxfME8#/jobs

【内推码】DSDxfME8（简历优先筛选，后续流程问题欢迎联系）', 1, '1e8ed4d4c5c132e05b0df2684d0663a8', CURRENT_TIMESTAMP
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
  'smartsheet_0011_df1ec024', '微步在线', '科技/互联网', '27届秋招', '["研发","安全","产品","设计","业务","市场"]', '["北京","上海","杭州","深圳","成都"]',
  '研发、安全、产品、设计、业务、市场', 'DS5PGRsN', 'https://app.mokahr.com/m/campus_apply/threatbook/39679?recommendCode=DS5PGRsN#/jobs', '2026-09-14T08:00:00.000Z', '招满即止', 'active',
  '微步在线 2027 届校园招聘正式开启！网安头部专精特新小巨人，秋招通道已开放

【企业亮点】国内威胁情报行业开创者，4 次入选 Gartner 全球榜单，E + 轮融资，大厂大牛带队，管理扁平无层级，技术氛围拉满

【高薪待遇】
本科 18W 起，冲刺 35W｜硕士 20W 起，冲刺 40W
八险一金、期权激励、餐补零食、专属长假、节日福利全覆盖

【成长体系】千里马 6 个月培养计划，资深导师一对一，技术 / 管理双通道晋升，新人快速落地核心项目

【热招岗位】
研发｜安全｜产品｜设计｜销售管培｜市场运营

【工作城市】北京、上海、深圳、杭州、成都、武汉、香港等

【内推链接】https://app.mokahr.com/m/campus_apply/threatbook/39679?recommendCode=DS5PGRsN#/jobs

【内推码】DS5PGRsN（内推简历优先筛选，后续流程欢迎联系）', 1, 'df1ec024b019a0adc9462fc19cbe8237', CURRENT_TIMESTAMP
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
  'smartsheet_0012_334041f0', '腾讯音乐', '互联网', '27届秋招/日常实习', '["技术类","产品类","设计类","内容类","专业类","市场类"]', '["深圳","北京","广州"]',
  '技术类、产品类、设计类、内容类、专业类、市场类', 'DS49MPRX', 'https://join.tencentmusic.com/campus', '2026-09-13T08:00:00.000Z', '招满即止', 'active',
  '⭐腾讯音乐2027校招启动
【招聘岗位】技术/产品/设计/内容/市场/专业等
【工作地点】深圳/广州/北京
【网申链接】
https://join.tencentmusic.com/campus/
【内推码】DS49MPRX', 1, '334041f0b5a4e5fe66bdec1069e4135f', CURRENT_TIMESTAMP
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
  'smartsheet_0013_13c882f2', '腾讯', '互联网', '27届秋招/日常实习', '["技术类","产品类","设计类","职能类","市场类"]', '["深圳","北京","上海"]',
  '技术类，产品类，设计类，职能类，市场类', 'J0WFI7TE3T', 'https://join.qq.com/resume.html?k=ubDa7CnDnzqkTa6M00TnqZ-koXnwW3cpRelOqQ2wf0I', '2026-09-13T08:00:00.000Z', '招满即止', 'active',
  '腾讯2027秋季招聘启动啦！
🌟岗位投递无上限，可随时切换！
🧑‍💻产品/技术/运营/设计/市场等
🌍base：北上广深等20+城市

在鹅厂你会体验及获得：
✅场景多元，成长空间MAX
✅导师1V1带教 + 转正机会
✅免费班车、早晚饭、健身房

【内推链接】https://join.qq.com/resume.html?k=vOMMYZqDBX6DmfGYJmoPOp-koXnwW3cpRelOqQ2wf0I

【内推码】4H725GBR1A', 1, '13c882f21f095953def9297ea9b1207e', CURRENT_TIMESTAMP
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
  'smartsheet_0014_1527d975', 'OPPO', '手机', '27届秋招', '["产品类","AI","算法类","标准研究类","软件类","硬件类","设计类","工程技术类","销售服务类","品牌策划类","采购类","综合职能类（最多2个）"]', '["东莞","深圳","成都","上海","北京","西安","南京","重庆","武汉","海外"]',
  '产品类、AI/算法类、标准研究类、软件类、硬件类、设计类、工程技术类、销售服务类、品牌策划类、采购类、综合职能类（最多2个）', 'X8335075', 'https://careers.oppo.com/university/oppo/campus/post?shareId=17992', '2026-09-11T08:00:00.000Z', '招满即止', 'active',
  'OPPO2027届校园招聘启动！
【公司简介】OPPO于2004年正式成立，是全球领先的智能设备创新者。

【招聘岗位】产品类、AI/算法类、软件类、硬件类、设计类、工程技术类、销售服务类、品牌策划类、采购类、综合职能类等

【工作地点】东莞、深圳、成都、上海、北京、西安、南京、重庆、武汉、海外

【福利待遇】极具竞争力的薪资+制化培养体系+多样化发展机制

【投递链接】
https://careers.oppo.com/university/oppo/campus/post?shareId=17992

【内推码】X8335075（内推简历优先筛选，加速流程推进）', 1, '1527d975909d97265e731f9af00a015c', CURRENT_TIMESTAMP
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
  'smartsheet_0015_23693405', '固德威', '能源电力', '27届秋招', '["研发类","职能类","营销类","技术服务类","制造技术类"]', '["苏州","武汉","深圳","安徽广德","佛山顺德"]',
  '研发类、职能类、营销类、技术服务类、制造技术类', 'ymezfz', 'https://wecruit.hotjob.cn/SU630a3a1f2f9d2406b4f6c5f7/mc/position/campus?acotycoCode=ymezfz&projectId=200701&recruitType=1&isLimitShowPostScope=1', '2026-09-11T08:00:00.000Z', '招满即止', 'active',
  '固德威27届秋季校招启动！ 
公司简介：固德威(股票代码:688390)，是全球逆变器Top10 & 连续9年大苏州最佳雇主，产品与服务覆盖全球100多个国家和地区，在全球设有12个海外子公司和30个销售与服务中心；全球拥有8000+名员工，并在苏州、南京、武汉、深圳、顺德设立5大研发中心。

岗位类别：研发类、职能类、营销类、技术服务类、制造技术类

工作地点：苏州/武汉/深圳/安徽广德/佛山顺德

内推链接：
https://wecruit.hotjob.cn/SU630a3a1f2f9d2406b4f6c5f7/mc/position/campus?acotycoCode=ymezfz&projectId=200701&recruitType=1&isLimitShowPostScope=1

内推码：ymezfz（简历优先筛选，流程加速）', 1, '23693405e7ca74f83a79d9ce15d11dae', CURRENT_TIMESTAMP
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
  'smartsheet_0016_51682f3b', '进迭时空', '芯片半导体', '27届秋招', '["AI","编译器工程师","AI推理引擎研发工程师","AI","高性能计算工程师","编译器开发工程师","CPU","设计工程师","CPU","验证工程师","CPU","软件设计工程师","CPU","中后端物理实现工程师","SoC","设计工程师","SoC","验证工程师","芯片","DFT","工程师","芯片","PD","后端工程师","封装工程师","硅后验证工程师","硬件设计工程师","产品测试工程师","AI应用工程师","AI","具身应用工程师","AI","agent","BD","RISC-V","技术生态运营","Linux","内核工程师","OS","系统软件工程师","Web","后端工程师","销售管培生","科研运营助理","财务专员","人力资源专员"]', '["杭州","珠海","上海","北京","深圳"]',
  'AI 编译器工程师、AI推理引擎研发工程师、AI 高性能计算工程师、编译器开发工程师、CPU 设计工程师、CPU 验证工程师、CPU 软件设计工程师、CPU 中后端物理实现工程师、SoC 设计工程师、SoC 验证工程师、芯片 DFT 工程师、芯片 PD 后端工程师、封装工程师、硅后验证工程师、硬件设计工程师、产品测试工程师、AI应用工程师、AI 具身应用工程师、AI agent BD、RISC-V 技术生态运营、Linux 内核工程师、OS 系统软件工程师、Web 后端工程师、销售管培生、科研运营助理、财务专员、人力资源专员', 'NTA8TSe', 'https://app.mokahr.com/campus-recruitment/space-t1/67916', '2026-09-10T08:00:00.000Z', '招满即止', 'active',
  '进迭时空2027届校园招聘正式启动
进迭时空成立于2021年，立足 RISC-V架构，专注下一代AI CPU芯片研发与产业化，产品覆盖终端及云端服务器AI CPU芯片，公司在在北京、杭州、上海、深圳、珠海等地设有办公室。

✨ 校招岗位方向
AI 编译器工程师、AI推理引擎研发工程师、AI 高性能计算工程师、编译器开发工程师、CPU 设计工程师、CPU 验证工程师、CPU 软件设计工程师、CPU 中后端物理实现工程师、SoC 设计工程师、SoC 验证工程师、芯片 DFT 工程师、芯片 PD 后端工程师、封装工程师、硅后验证工程师、硬件设计工程师、产品测试工程师、AI应用工程师、AI 具身应用工程师、AI agent BD、RISC-V 技术生态运营、Linux 内核工程师、OS 系统软件工程师、Web 后端工程师、销售管培生、科研运营助理、财务专员、人力资源专员

📍 工作地点
北京、杭州 、上海、珠海、深圳

💰 福利待遇
本科25-35w；硕士35-50w
多元的薪酬体系、六险一金、丰富的福利计划、各种补贴、弹性工作时间

📩 投递方式
https://app.mokahr.', 1, '51682f3b28ea62e39475d1a0c53d4947', CURRENT_TIMESTAMP
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
  'smartsheet_0017_d0cbd980', 'SGS', '外企/检测', '27届秋招', '["质优生项目"]', '["上海","广州","深圳","宁波","青岛","南京","天津","常州","杭州","苏州","厦门","重庆","大连","郑州","顺德"]',
  '质优生项目', 'DSQmMzGy', 'https://app.mokahr.com/m/campus_apply/sgs/74104?recommendCode=DSQmMzGy#/job/fa7561d9-53a7-446e-873c-775435407a93', '2026-09-10T08:00:00.000Z', '招满即止', 'active',
  'SGS 2027校园招聘正式启动！
关于SGS:总部位于瑞士的SGS集团创建于1878年，是国际公认的测试、检验和认证机构。我们拥有100,000多名专业员工，分布在115个国家及地区的2,500多个分支机构和实验室，构建起全球化服务网络。

关于质优生项目：SGS质优生是SGS特有的质量检测专才新人培养项目，七年来，质优生项目培养的成员均已成为SGS坚实的中坚力量。

我们提供：有竞争力的薪资+1年快速成长计划+大平台高起点+多元发展方向+全面交流与反馈

工作地点：上海、广州、深圳、宁波、青岛、南京、天津、常州、杭州、苏州、厦门、重庆、大连、郑州、顺德

内推链接：
https://app.mokahr.com/m/campus_apply/sgs/74104?recommendCode=DSQmMzGy#/job/fa7561d9-53a7-446e-873c-775435407a93

内推码：DSQmMzGy（内推简历优先筛选，有问题欢迎联系）', 1, 'd0cbd980abeb4fc79251454a9a133cfe', CURRENT_TIMESTAMP
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
  'smartsheet_0018_ab934aaa', '基恩士（中国）（hc多）', '外企/制造业', '27届秋招', '["销售工程师"]', '["北京","天津","上海","广州","深圳24个大城市"]',
  '销售工程师', 'ESVG33', 'https://keyence.zhiye.com/recommended/jobs?shareId=96854fe4-43b4-4e62-b960-f9db8fa00433&shareSource=2&qr=1', '2026-09-10T08:00:00.000Z', '招满即止', 'active',
  '基恩士（中国）2027届秋季校园招聘来啦【专业不限】

🌟日本上市公司市值Top 5；
🌟连续8年入选福布斯“全球最具创新能力企业”100强榜单；
🌟连续10年平均成长率超15%，利润率达51.2%；
🌟全球46个国家和地区250个办事处；
🌟主营传感器，测量仪器，视觉系统等工业自动化产品。

【招聘岗位】销售工程师

【招聘对象】2027届本科及以上应届毕业生，专业不限

【工作地点】北京，天津，上海，广州，深圳等24个大城市

【薪资福利】
[庆祝]有竞争力的薪资待遇，第一年18~22万元，第二年23~31万元
[庆祝]每半年调薪&升职机会、带薪培训、周末双休、带薪假、无酒桌文化，外出安排专车与司机接送、更有补充商业保险、节假日福利补贴等员工福利！

内推链接：https://keyence.zhiye.com/recommended/jobs?shareId=96854fe4-43b4-4e62-b960-f9db8fa00433&shareSource=2&qr=1

内推码：ESVG33

🚀内推求职，快人一步！', 1, 'ab934aaaaba765108667e1ff831b48cc', CURRENT_TIMESTAMP
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
  'smartsheet_0019_4e9b177b', '禾赛科技', '智能驾驶/机器人', '27届秋招', '["系统类","器件类","算法类","软件类","硬件类","光机类","工艺类","芯片类","机械类","产品类","采购类","AI类","销售类"]', '["上海","杭州","重庆"]',
  '系统类、器件类、算法类、软件类、硬件类、光机类、工艺类、芯片类、机械类、产品类、采购类、AI类、销售类', 'EQXUXBJ', 'https://kwh0jtf778.jobs.feishu.cn/s/o-aei9Nv6NU', '2026-09-09T08:00:00.000Z', '招满即止', 'active',
  '禾赛科技2027秋招启动！
【公司介绍】禾赛科技是纳斯达克&港交所双上市企业，全球三维感知技术领导者，自研芯片和半导体器件累计交付量全球第一。无人驾驶、 ADAS、机器人三大市场市占率全球第一，在上海、硅谷、斯图加特等地设有办公室，在中国和泰国拥有自建工厂，产品覆盖全球40余个国家

【招聘岗位】系统类、器件类、算法类、软件类、硬件类、光机类、工艺类、芯片类、机械类、产品类、采购类、AI类、销售类

【工作地点】上海、杭州、重庆

【福利待遇】行业TOP级薪资、奖金股票，专家一对一导师带教，落户绿色通道，弹性工作，舒适办公环境，各类员工福利

【27届内推链接】
https://kwh0jtf778.jobs.feishu.cn/s/o-aei9Nv6NU

【实习生内推链接】
https://kwh0jtf778.jobs.feishu.cn/s/Pdvp7eXmWfs

【内推码】EQXUXBJ（选择大使推荐，内推简历优先筛选）', 1, '4e9b177b52888dc824e9e91c799111b5', CURRENT_TIMESTAMP
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
  'smartsheet_0020_ce6c865f', '春风动力', '制造业', '27届秋招', '["研发","制造类","营销管理类","设计类","采购","质量","供应链类","国际业务类","职能类等等"]', '["杭州","上海","嘉兴","重庆","海外"]',
  '研发、制造类 、营销管理类、 设计类 、采购/质量/供应链类 国际业务类 职能类等等', 'EVVYVK', 'https://cfmoto.zhiye.com/campus/jobs?shareId=50a9045d-7570-46be-9ccf-564e275375b5&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-09-10T08:00:00.000Z', '招满即止', 'active',
  '🏍️春风动力（极核动力）2027秋招正式启动！
我们不止有张雪机车！1989年成立 上市企业 
国内高端动力装备TOP  摩托车世界顶级赛事MOTOGP moto 2 moto3多站冠军 全地形车十余年欧洲市占率TOP1  
💰14薪+住房补贴+餐补

📌岗位方向
整车研发/新能源研发/电气电子及IT研发
生产制造类 营销管理类 设计类 采购/质量/供应链类 国际业务类 职能类等等
📍base杭州、上海、嘉兴、重庆、海外等地

✅内推链接https://cfmoto.zhiye.com/campus/jobs?shareId=50a9045d-7570-46be-9ccf-564e275375b5&shareSource=2&qr=1&memory=%7B%7D&silence=1
✅内推码EVVYVK（简历优先筛选）', 1, 'ce6c865fe18fed2467633912f6bf14ab', CURRENT_TIMESTAMP
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
  'smartsheet_0021_97681de5', '三棵树（hc多）', '制造业', '27届秋招', '["经营管理类","供应链类","技术研发类","营销业务类","信息管理类","财务管理类","行政管理类等"]', '["全国多地"]',
  '经营管理类、供应链类、技术研发类、营销业务类、信息管理类、财务管理类、行政管理类等', 'vfwcxc', 'https://wecruit.hotjob.cn/SU6173aef0bef57c4414103348/mc/position/campus?acotycoCode=vfwcxc&projectId=201401&recruitType=1&isLimitShowPostScope=1', '2026-09-08T08:00:00.000Z', '招满即止', 'active',
  '最佳雇主-三棵树2027届秋招启动！
【公司简介】2002年成立，A股主板上市，员工人数10000+，中国民营企业500强，建筑涂料中国第一品牌，全资及控股71家公司，全国4大中心，14大生产基地，4大研发平台，6大研发中心，连续多年蝉联中国年度最佳雇主！

【三大招聘项目】菁英计划、森计划、技术应用

【岗位类别】经营管理类、供应链类、技术研发类、营销业务类、信息管理类、财务管理类、行政管理类等

【工作地点】全国多地

【衣食住行无忧】免费自助三餐、免费公寓、政府补贴、交通补贴、话费补贴、无忧基金、股份激励、十三大俱乐部等等

【内推链接】
https://wecruit.hotjob.cn/SU6173aef0bef57c4414103348/mc/position/campus?acotycoCode=vfwcxc&projectId=201401&recruitType=1&isLimitShowPostScope=1

【内推码】 vfwcxc（内推简历优先筛选，面试流程加快）', 1, '97681de5fa7685cecd57ae9a5f47c0fb', CURRENT_TIMESTAMP
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
  'smartsheet_0022_8a089019', '宏工科技', '制造业', '27届秋招', '["研发技术类","供应交付类（专业不限）","市场战略类（专业不限）","职能运营类"]', '["长沙","株洲","无锡"]',
  '研发技术类、供应交付类（专业不限）、市场战略类（专业不限）、职能运营类', 'qrkqgs', 'https://wecruit.hotjob.cn/SU68197fa81c240e07d7836b7b/mc/position/campus?acotycoCode=qrkqgs&recruitType=1&isLimitShowPostScope=0', '2026-09-08T08:00:00.000Z', '招满即止', 'active',
  '宏工科技27届校园招聘启动！
【公司简介】宏工科技（证券代码：301662）成立于2008年，秉承“让物料处理更简单”的使命，聚焦物料处理和工业自动化领域，历经17年发展，荣获国家高新技术企业，已成为国内领先的物料处理自动化综合服务商。

【岗位类别】研发技术类、供应交付类（专业不限）、市场战略类（专业不限）、职能运营类

【薪酬福利】本科11-16万、硕士16-25万、博士一人一议，每年1-2次调薪机会、提供食宿、无息借款、互助基金、节日礼品、年薪年假、年度旅游、免费体检等
【人才发展】专项人才培养计划，导师制，多职级、多方向职业发展体系，HR闺蜜保驾护航等。

【工作地点】长沙、株洲、无锡

【移动端内推链接】https://wecruit.hotjob.cn/SU68197fa81c240e07d7836b7b/mc/position/campus?acotycoCode=qrkqgs&recruitType=1&isLimitShowPostScope=0

【内推码】qrkqgs（内推投递，简历优先筛选，面试流程加快！）', 1, '8a089019e112c481db802d63178ad76c', CURRENT_TIMESTAMP
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
  'smartsheet_0023_3ec5e6fb', '明源云', '科技', '27届秋招', '["研发技术类","产品类","实施顾问类","销售商务类","行业研究类","财务职能类","综合管理类；设有专项管培生项目"]', '["深圳","武汉","北京","上海","广州","南京","成都","长沙；海外部分岗位开放"]',
  '研发技术类、产品类、实施顾问类、销售商务类、行业研究类、财务职能类、综合管理类；设有专项管培生项目', 'DSTRjbA1', 'https://app.mokahr.com/m/campus_apply/mingyuan/168644?recommendCode=DSTRjbA1#/jobs', '2026-09-09T08:00:00.000Z', '招满即止', 'active',
  '明源云2027届全球校园招聘启动！
【公司介绍】香港联交所主板上市企业（00909.HK），国内领先不动产生态链数字化解决方案服务商，深耕不动产数字化赛道，服务7000+不动产企业，业务覆盖国内80+城市及新加坡、马来西亚、日本、印尼等海外地区 。
【招聘岗位】研发技术类、产品类、实施顾问类、销售商务类、行业研究类、财务职能类、综合管理类；设有专项管培生项目
【工作地点】国内：深圳、武汉、北京、上海、广州、南京、成都、长沙等；海外部分岗位开放
【福利待遇】具备行业竞争力薪酬，六险一金，各类补贴，完善新人培养体系、导师带教，丰富内外部培训资源，广阔不动产数字化发展平台。
【内推链接】https://app.mokahr.com/m/campus_apply/mingyuan/168644?recommendCode=DSTRjbA1#/jobs
【内推码】DSTRjbA1（内推投递，简历优先筛选）', 1, '3ec5e6fbc990fbb0d291939a1e61788b', CURRENT_TIMESTAMP
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
  'smartsheet_0024_2537fe00', '乐信圣文', '游戏', '27届秋招', '["产品策划类","研发测试类","美术设计类"]', '["北京","杭州"]',
  '产品策划类、研发测试类	、美术设计类', 'J9B8CSU', 'https://learnings.jobs.feishu.cn/s/xR8cWQXm6U8', '2026-09-09T08:00:00.000Z', '招满即止', 'active',
  '乐信圣文2027届校园招聘正式启动！
公司简介：全球IAA游戏领军者，产品覆盖200+国家和地区，累计服务20亿+全球玩家，3亿+月活，5个品类全球第一，打造十余款行业代表作,构建完整产品矩阵

在招岗位：产品策划类、研发测试类	、美术设计类

工作地点：	北京、杭州

内推链接：https://learnings.jobs.feishu.cn/s/xR8cWQXm6U8

内推码：J9B8CSU（推荐方式选择大使推荐，简历优先筛选）', 1, '2537fe00f06610ee65c97da461701999', CURRENT_TIMESTAMP
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
  'smartsheet_0025_17d47a06', '东方财富', '金融科技', '27届秋招', '["技术研发类","产品类","金融研究类","投资交易类","商务市场类","运营客户类","合规风控类","职能管理类"]', '["上海","北京","深圳","南京","杭州","成都","西安","扬州","福州","济南","郑州","沈阳","拉萨多地"]',
  '技术研发类、产品类、金融研究类、投资交易类、商务市场类、运营客户类、合规风控类、职能管理类', 'DSCFSYae', 'https://app.mokahr.com/m/campus-recruitment/eastmoney/92400?recommendCode=DSCFSYae#/jobs', '2026-09-09T08:00:00.000Z', '招满即止', 'active',
  '东方财富2027届全球校园招聘启动！
【公司介绍】国内头部互联网财富管理上市公司，拥有证券、基金、期货、金融数据等全业务牌照，旗下东方财富APP、天天基金、Choice金融终端等产品，服务海量互联网金融用户，业务覆盖全国多地 。
【招聘岗位】技术研发类、产品类、金融研究类、投资交易类、商务市场类、运营客户类、合规风控类、职能管理类；设有EASTstar管培之星、EASTech科技新锐、EASTfin财富菁英三大校招专项项目。
【工作地点】国内：上海、北京、深圳、南京、杭州、成都、西安、扬州、福州、济南、郑州、沈阳、拉萨等多地；部分岗位支持全国网点可选。
【福利待遇】具备行业竞争力薪酬，六险一金+补充商业医疗，带薪年假、节日福利、年度体检；完善新人培养体系、专项管培生项目，导师带教，丰富内部学习资源，广阔金融科技发展平台。
【内推链接】https://app.mokahr.com/m/campus-recruitment/eastmoney/92400?recommendCode=DSCFSYae#/jobs
【内推码】DSCFSYae（内推投递，简历优先筛选）', 1, '17d47a06421bea5de8a2b37a387ffe90', CURRENT_TIMESTAMP
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
  'smartsheet_0026_67ac8934', '虎牙', '互联网', '27届秋招', '["产品类","运营类","技术类","设计类","职能类"]', '["佛山","广州","深圳","上海","武汉"]',
  '产品类、运营类、技术类、设计类、职能类', '通过右链接直接投递即即可', 'https://hr.huya.com/home', '2026-09-08T08:00:00.000Z', '招满即止', 'active',
  '虎牙2027届校园招聘开始啦！
校招QQ交流群：1121177572

【关于虎牙】
虎牙是一家全球化的游戏生态服务提供商，专注于为游戏爱好者和合作伙伴构建全面的游戏和泛娱乐生态。公司于2018年5月在美国纽交所上市，成为中国第一家上市的游戏直播公司，并连续五年入选中国互联网协会发布的“中国互联网综合实力企业”百强

✨虎牙，全面升级中✨
从直播与顶级赛事版权、游戏联运，到《鹅鸭杀》独家发行、自主研发。虎牙正从游戏直播平台，全面升级为「综合游戏生态服务商」直连全球海量核心玩家，全链路布局游戏生态

【招聘岗位】
🈶产品类、运营类、技术类、设计类、职能类

【福利待遇】
✅有竞争力的薪资、餐补、年终奖、六险一金、股票激励
✅总部人才公寓首年五折拎包入住
✅专业+管理双通道发展，校招生首次晋升平均约1年
✅电竞协会不定期开赛，下班直接开黑，游戏搭子就在工位旁边

【工作地点】
佛山、广州、深圳、上海、武汉
✨2026年10月虎牙全球新总部将落地佛山

【应聘流程】
简历投递：即日起-10月31日
在线测评：9月1日起
面       试：9月1日起
Offer发放： 9月下旬起

【网申', 1, '67ac8934667154fcae5580df1a566cae', CURRENT_TIMESTAMP
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
  'smartsheet_0027_f8a25cd2', '小红书', '互联网', '27届秋招/日常实习', '["技术类","产品类","运营类","设计类","销售类","职能类等"]', '["北京","上海","武汉","广州"]',
  '技术类、产品类、运营类、设计类、销售类、职能类等', 'FBLHBZUNYCAD', 'https://job.xiaohongshu.com/link?referer_code=FBLHBZUNYCAD', '2026-09-07T08:00:00.000Z', '招满即止', 'active',
  '📕小红书2027届秋招正式批启动！
🌟 关于小红书：作为中国领先的生活方式平台，小红书致力于为大家提供真实、有趣、且有价值的生活分享与消费决策参考

🔥 招聘岗位：技术类、产品类、运营类、设计类、销售类、职能类等
📍 工作地点：北京、上海、武汉、广州
💼 福利待遇：
极具竞争力的薪酬
每年根据公司与个人绩效进行调薪
免费三餐或餐补，零食饮料随时供应
一线城市就近租房补贴等多重福利

📢 内推链接：
https://job.xiaohongshu.com/link?referer_code=FBLHBZUNYCAD

💌 内推码: FBLHBZUNYCAD(内推投递简历优先筛选)', 1, 'f8a25cd20ebcb0ec80ea2290bb3bf04f', CURRENT_TIMESTAMP
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
  'smartsheet_0028_70324a9e', '众安保险', '金融科技', '27届秋招', '["数据","研发","财务","用户运营","测试","职能等"]', '["上海","深圳","杭州"]',
  '数据、研发、财务、用户运营、测试、职能等', 'DSmSSru2', 'https://app.mokahr.com/m/campus_apply/zhongan/71908?recommendCode=DSmSSru2&hash=%23%2Fjobs#/jobs', '2026-09-07T08:00:00.000Z', '招满即止', 'active',
  '众安保险2027校招启动！
【关于众安】是中国首家互联网保险公司，17年上市，2024年《财富》“中国500强，技术人员占比近50%

【招聘岗位】数据、研发、财务、用户运营、测试、职能等

【工作地点】上海、深圳、杭州

【内推链接】https://app.mokahr.com/m/campus_apply/zhongan/71908?recommendCode=DSmSSru2&hash=%23%2Fjobs#/jobs

【内推码】DSmSSru2（内推简历优先筛选，加速流程推进）', 1, '70324a9e605c59f2c3dc0f2c338d2ef3', CURRENT_TIMESTAMP
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
  'smartsheet_0029_aef9c3ca', 'MDPI', '出版', '27届秋招', '["编辑","市场","产品经理","培训","PR","职能（HR","财务","行政","会议）"]', '["北京","武汉","天津","南京","大连","成都","深圳"]',
  '编辑、市场、产品经理、培训、PR、职能（HR/财务/行政/会议）', '通过内推链接投递即即可', 'https://mdpi.cn/career/recruit/ca-recruit/position?email=xiexuan1168%40163.com', '2026-09-07T08:00:00.000Z', '招满即止', 'active',
  '全球领先的出版机构 | MDPI2027秋招启动
 关于我们：MDPI由林树坤博士创办于1996年，总部位于瑞士巴塞尔，同时在中国、西班牙、英国、日本、加拿大、新加坡、泰国以及韩国等地设有分公司，MDPI致力于开放获取出版服务，目前出版英文学术期刊455个，其中SCIE期刊92个，期刊领域覆盖生物、化学、机械、能源、环境等各学科。

招聘岗位：编辑(HC缺口多，最高32k)、市场(最高25k)、产品经理（最高32k）、培训（最高20k）、PR（最高32k）、职能（HR/财务/行政/会议），更多岗位及薪资范围详见投递链接

工作地点：北京、武汉、天津、南京、大连、成都、深圳

薪酬福利：有竞争力的薪酬待遇；六险一金，带薪年假，年度体检，节日福利，活动经费，丰富茶歇，营养晚餐等；子女福利，团队奖励，培训津贴，岗位津贴； 导师培，管理培训，优秀员工提供出国交流和工作机会

内推链接：
https://mdpi.cn/career/recruit/ca-recruit/position?email=xiexuan1168%40163.com

通过内推链接，无需填写内推码，自动计入内推，off', 1, 'aef9c3ca386c410f05af1875db02552c', CURRENT_TIMESTAMP
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
  'smartsheet_0030_f3a79599', '昊一源', '制造业', '27届秋招', '["软件研发","市场营销","硬件研发","产品设计等"]', '["深圳","武汉"]',
  '软件研发、市场营销、硬件研发、产品设计等', 'EV3M8B', 'https://hollyland.zhiye.com/campus/jobs?shareId=d98416be-90b8-4569-bdea-c50bf63264f9&shareSource=2', '2026-09-06T08:00:00.000Z', '招满即止', 'active',
  '昊一源2027届校园招聘启动！
公司简介：昊一源成立于2013年，是全球高清音视频传输领域的领军者，旗下无线图传、通话全球市占率TOP1，无线麦克风国内第一，1500+团队中40%是研发精英，更拥有224项专利与“国家专精特新小巨人”等硬核资质

招聘岗位：软件研发、市场营销、硬件研发、产品设计等多领域任选

工作地点：深圳、武汉

福利待遇：六险一金、6个月免租公寓、年度旅游、股权激励等福利拉满；还有双导师带教、源动力训练营等培养体系，专业与管理双通道晋升助你快速成长

【内推链接】https://hollyland.zhiye.com/campus/jobs?shareId=d98416be-90b8-4569-bdea-c50bf63264f9&shareSource=2

【内推码】EV3M8B（内推投递，简历优先筛选，面试流程更快）', 1, 'f3a795995472fdcef5aaea0438230183', CURRENT_TIMESTAMP
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
  'smartsheet_0031_bba3fca0', '海天味业', '快消', '27届秋招', '["营销管理类","研发技术类","供应链管理类","AI数字化类","综合职能类"]', '["佛山","宿迁","南宁","武汉","嘉兴","营销岗全国多地可派驻"]',
  '营销管理类、研发技术类、供应链管理类、AI数字化类、综合职能类', 'srghgm', 'https://wecruit.hotjob.cn/SU6322ee8c0dcad46a862dcbe5/mc/position/campus?acotycoCode=srghgm&recruitType=1&isLimitShowPostScope=1', '2026-09-06T08:00:00.000Z', '招满即止', 'active',
  '海天味业2027校招启动！
多类岗位同步开放，国民龙头企业，部分岗位不限专业！
【公司简介】海天味业是国内调味品行业龙头上市企业，产品远销全球80多个国家和地区，拥有六大生产基地，酱油销量连续多年全国第一，深耕调味品研发、生产、销售全产业链 。
【多种岗位】营销管理类、研发技术类、供应链管理类、AI数字化类、综合职能类
【工作城市】佛山、宿迁、南宁、武汉、嘉兴，营销岗全国多地可派驻 
【福利方面】行业竞争力薪酬、五险一金、员工宿舍、免费工作餐、带薪年假、年度体检、节日慰问、高温津贴、管理与专业双通道晋升、导师带教体系
【内推链接】https://wecruit.hotjob.cn/SU6322ee8c0dcad46a862dcbe5/mc/position/campus?acotycoCode=srghgm&recruitType=1&isLimitShowPostScope=1
【内推码】srghgm（填写内推码投递，简历优先筛选）', 1, 'bba3fca07932be87af79a1eee321f719', CURRENT_TIMESTAMP
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
  'smartsheet_0032_a3425269', '万兴科技-应届生', 'AI/科技', '27届秋招', '["产品","研发","营销","设计","职能"]', '["深圳","长沙","北京","杭州","日本东京"]',
  '产品 、 研发 、 营销 、 设计、 职能', 'EVV48A', 'https://wondersharecampus.zhiye.com/campus/jobs?shareId=7e1b69bf-0993-41ac-88e5-b577d7dfa529&shareSource=2', '2026-09-06T08:00:00.000Z', '招满即止', 'active',
  'AIGC上市-万兴科技2027届校招启动！应届生平均年薪50万！
拿一线城市高薪|住长沙宜居房子|千全球AI事业！

【关于万兴】AIGC软件A股上市公司万兴科技是全球领先的新生代数字创意赋能者；业务范围遍及全球200多个国家和地区

【招聘岗位】产品、研发、设计、营销、职能

【工作地点】深圳、长沙、北京、杭州、日本东京

【内推链接】https://wondersharecampus.zhiye.com/campus/jobs?shareId=7e1b69bf-0993-41ac-88e5-b577d7dfa529&shareSource=2

【内推码】EVV48A(内推简历优先筛选)', 1, 'a3425269f3d75657ff5ea58466f58ee3', CURRENT_TIMESTAMP
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
  'smartsheet_0033_cc0b24e0', '万兴科技-实习生', 'AI/科技', '27届实习/日常实习', '["产品","研发","营销","设计","职能"]', '["深圳","长沙"]',
  '产品 、 研发 、 营销 、 设计、 职能', 'EVV48A', 'https://wondersharecampus.zhiye.com/intern/jobs?shareId=6d4d6dc1-63a4-41e6-8a16-ba065fe1bf88&shareSource=2', '2026-09-06T08:00:00.000Z', '招满即止', 'active',
  'AIGC上市-万兴科技2027届校招启动！实习月薪可高达1万元！
拿一线城市高薪|住长沙宜居房子|千全球AI事业！

【关于万兴】AIGC软件A股上市公司万兴科技是全球领先的新生代数字创意赋能者；业务范围遍及全球200多个国家和地区

【招聘岗位】产品、研发、设计、营销、职能

【工作地点】深圳、长沙、北京、杭州、日本东京

【内推链接】https://wondersharecampus.zhiye.com/campus/jobs?shareId=7e1b69bf-0993-41ac-88e5-b577d7dfa529&shareSource=2

【内推码】EVV48A(内推简历优先筛选)', 1, 'cc0b24e0cd11aca139ff90c359f10874', CURRENT_TIMESTAMP
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
  'smartsheet_0034_6bd5f823', '优博讯', '制造业', '27届秋招', '["研发类","营销类","供应链类"]', '["深圳","珠海","上海","广州","武汉"]',
  '研发类、营销类、供应链类', 'ESVM39', 'https://urovo.zhiye.com/campus/jobs?shareId=0e3a3def-2c88-49b4-b934-4a7ab97e4651&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-09-06T08:00:00.000Z', '招满即止', 'active',
  '【公司介绍】优博讯（300531.SZ）成立于2006年，2016年于深交所上市，致力于成为全球领先的IoT行业数字化解决方案提供商，旗下拥有二十多家分子公司，业务覆盖全球100多个国家和地区。PDA终端出货量全球排名第二，中国排名连续四年稳居第一。

【需求岗位】研发类、营销类、供应链类

【工作地点】深圳、珠海、上海、广州、武汉

【薪酬福利】年终奖金+季度绩效奖金+专项奖励+持股激励+人才房+福利关怀（五险一金、带薪年假、节日关怀、生日会、加班餐补、年度旅游、社团活动、团建活动、带教培训等员工福利）

【内推链接】https://urovo.zhiye.com/campus/jobs?shareId=0e3a3def-2c88-49b4-b934-4a7ab97e4651&shareSource=2&qr=1&memory=%7B%7D&silence=1

【内推码】ESVM39 （内推简历第一时间送到HR面前）', 1, '6bd5f82331774a905c35d59f9bc0a034', CURRENT_TIMESTAMP
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
  'smartsheet_0035_3deb5767', '星邦智能', '机械', '27届秋招', '["研发工艺类","制造质量类","供应链物流类","营销服务类","投资金融类","职能运营类","流程信息化类"]', '["长沙","海外"]',
  '研发工艺类、制造质量类、供应链物流类、营销服务类、投资金融类、职能运营类、流程信息化类', 'DSU5d5Ge', 'https://app.mokahr.com/m/campus_apply/xingbang/67958?recommendCode=DSU5d5Ge#/jobs', '2026-09-07T08:00:00.000Z', '招满即止', 'active',
  '星邦智能27届校招启动！
【公司介绍】全球高空作业平台制造商前10强，国家级专精特新小巨人企业，深耕高空作业平台研发制造，开拓低空经济、工程无人机、船舶机器人新赛道，产品销往全球100+国家，海外网点布局完善
【招聘岗位】研发工艺类、制造质量类、供应链物流类、营销服务类、投资金融类、职能运营类、流程信息化类
【工作地点】长沙，海外
【福利待遇】五险一金、免费食宿、定期体检、带薪年假、探亲假、节日慰问、岗位津贴、完善入职培训、星学堂学习平台、多通道职业发展路径、团建拓展活动
【内推链接】https://app.mokahr.com/m/campus_apply/xingbang/67958?recommendCode=DSU5d5Ge#/jobs
【内推码】DSU5d5Ge', 1, '3deb57678de756e251b4dd6e7ef32b42', CURRENT_TIMESTAMP
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
  'smartsheet_0036_7c823c2b', '锐捷网络', '国企/科技', '27届秋招', '["产品类","研发类","设计类","管培类","市场类","职能类","技服类"]', '["福州市","北京市","成都市","南京市","上海市","深圳市","海外"]',
  '产品类、研发类、设计类、管培类、市场类、职能类、技服类', 'DSnVy2tc', 'https://app.mokahr.com/m/campus_apply/ruijie/136206?recommendCode=DSnVy2tc&hash=%23%2Fjobs#/jobs', '2026-09-04T08:00:00.000Z', '招满即止', 'active',
  '企业简介：
✅国有控股，深交所创业板上市301165，年复合增长30%，数字通信行业，8000人规模;
✅中国200G/400G数据中心交换机市场份额第一
✅中国以太光网络市场份额第一
✅中国以太网交换机市场份额第三
✅中国企业级WLAN出货量第一

招聘岗位：产品类、研发类、设计类、管培类、市场类、职能类、技服类

工作地点：福州市、北京市、成都市、南京市、上海市、深圳市、海外

内推链接：
https://app.mokahr.com/m/campus_apply/ruijie/136206?recommendCode=DSnVy2tc&hash=%23%2Fjobs#/jobs

内推码：DSnVy2tc（内推简历可优先筛选，面试流程加快！）', 1, '7c823c2b1327b9c43d380867a60e370b', CURRENT_TIMESTAMP
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
  'smartsheet_0037_e431e6b6', '骑士集团', '电商/商业', '27届秋招', '["管培生"]', '["广州"]',
  '管培生', 'DSFn9dk4', 'https://app.mokahr.com/m/campus_apply/black-unique/29232?recommendCode=DSFn9dk4#/jobs', '2026-09-04T08:00:00.000Z', '招满即止', 'active',
  '【公司介绍】骑士集团（探途网络），B轮近十亿融资高新技术企业，打造“平台+内容+品牌”新消费生态矩阵；旗下拥有会员制特权电商全球购骑士特权App，同时布局骑士短剧、骑士传媒，孵化幸棉、科净威、麦谷村等多个亿级消费品牌。
【招聘岗位】综合管培生（产品类、策划类、市场类等）、HR管培生
【工作地点】广州
【福利待遇】六险一金、双休、多维补贴、营养早餐&下午茶、年度体检、运动俱乐部、带薪撸猫、创始人1V1带教培养体系
【内推链接】https://app.mokahr.com/m/campus_apply/black-unique/29232?recommendCode=DSFn9dk4#/jobs
【内推码】DSFn9dk4（填写内推码投递，简历优先筛选）', 1, 'e431e6b67c9b41e11f0bfc3f88d4b61e', CURRENT_TIMESTAMP
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
  'smartsheet_0038_18dcef68', '龙旗科技', '科技', '27届秋招', '["硬件类","软件类","结构类","测试类","运营类","质量类","采购类","营销类","IT类","职能类","制造类"]', '["上海","深圳","西安","合肥","惠州","南昌","苏州","越南"]',
  '硬件类、软件类、结构类、测试类、运营类、质量类、采购类、营销类、IT类、职能类、制造类', 'DSaCAjhj', 'https://app.mokahr.com/m/campus_apply/longcheer/166561?recommendCode=DSaCAjhj#/jobs', '2026-09-05T08:00:00.000Z', '招满即止', 'active',
  '【公司介绍】A+H股两地上市、中国500强企业，全球领先智能产品和服务提供商，覆盖研发设计到智能制造，海内外布局多处研发与制造基地
【招聘岗位】硬件类、软件类、结构类、测试类、运营类、质量类、采购类、营销类、IT类、职能类、制造类
【工作地点】上海、深圳、西安、合肥、惠州、南昌、苏州、越南
【福利待遇】六险一金（含商业保险）、餐补、车贴、生日补贴、团建活动、兴趣协会、年度健康体检
【内推链接】https://app.mokahr.com/m/campus_apply/longcheer/166561?recommendCode=DSaCAjhj#/jobs
【内推码】DSaCAjhj（填写内推码，简历优先筛选）', 1, '18dcef68ec8d9140672ea29963ec3c6e', CURRENT_TIMESTAMP
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
  'smartsheet_0039_5147f3c4', '特锐德', '能源电力', '27届秋招', '["国际类","交付管理类","职能管理类","营销类","技术类","计算机类等"]', '["青岛","成都","宜昌"]',
  '国际类、交付管理类、职能管理类、营销类、技术类、计算机类等', 'ESKMGR', 'https://tgood.zhiye.com/campus/jobs?shareId=9c82abb8-f075-465a-98e1-017bc3785f99&shareSource=2', '2026-09-05T08:00:00.000Z', '招满即止', 'active',
  '创业板第一股-特锐德2027届秋招启动！

【公司介绍】2004年创立，创业板第一股，资产超250亿，销售规模150亿+，员工10000余人，拥有青岛、成都、宜昌三大生产基地。主要从事高端箱式电力设备制造、汽车充电生态网、新能源微网三大领域

【招聘岗位】国际类、交付管理类、职能管理类、营销类、技术类、计算机类等

【工作地点】青岛、成都、宜昌

【福利待遇】员工宿舍、免费班车、工作餐餐补、股权激励、购房无息借款、两周带薪春节假期等

【内推链接】https://tgood.zhiye.com/campus/jobs?shareId=9c82abb8-f075-465a-98e1-017bc3785f99&shareSource=2

【内推码】ESKMGR（内推简历优先筛选）', 1, '5147f3c4a7def7db3ff53e9fdf9a3f12', CURRENT_TIMESTAMP
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
  'smartsheet_0040_1f5f276f', 'FunPlus', '游戏', '27届秋招/日常实习', '["技术类","策划类","美术类","发行类","运营类","用研","行研类","项目管理类","产品类"]', '["北京","上海","成都","广州"]',
  '技术类、策划类、美术类、发行类、运营类、用研/行研类、项目管理类、产品类', 'DSXdkHxV', 'https://app.mokahr.com/m/campus_apply/funplus01/147931?recommendCode=DSXdkHxV#/jobs', '2026-09-03T08:00:00.000Z', '招满即止', 'active',
  'TOP游戏大厂-FunPlus2027校招启动！9大职能同步开放，校招需求增加50%，不限专业，不限背景！

【公司简介】FunPlus于2010年在硅谷创立，是全球最顶级的移动游戏公司之一

【多种岗位】技术类、策划类、美术类、发行类、运营类、用研/行研类、项目管理类、产品类

【工作城市】北京、上海、成都、广州

【福利方面】行业头部薪资、六险一金、年假10天起、公司健身房、年会100%中奖、轻松工作氛围、大佬mentor带教、游戏开发实战、产品全球发行、同事遍布世界

【内推链接】https://app.mokahr.com/m/campus_apply/funplus01/147931?recommendCode=DSQYrP6m#/jobs

【内推码】DSQYrP6m（内推简历优先筛选！）', 1, '1f5f276f14aa6ad19d0992ff8490b8e8', CURRENT_TIMESTAMP
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
  'smartsheet_0041_42fc5fb8', '富特科技', '新能源', '27届秋招', '["制造管培类","研发技术类","职能类"]', '["杭州","西安","湖州"]',
  '制造管培类、研发技术类、职能类', 'DSjxqT4T', 'https://app.mokahr.com/m/campus-recruitment/evtech/47503?recommendCode=DSjxqT4T#/jobs', '2026-09-04T08:00:00.000Z', '招满即止', 'active',
  '【关于富特】2011年成立，2024年A股上市，新能源汽车细分领域OBC&DC-DC头部供应商，深耕车载高压电源、智慧能源赛道，研发中心位于杭州、西安，制造中心位于湖州，法国拥有全资子公司

【招聘岗位】制造管培类、研发技术类、职能类

【工作地点】杭州、西安、湖州

【福利待遇】每年调薪机会、弹性工作	、多项补贴	、社团活动、下午茶 等

【内推链接】https://app.mokahr.com/m/campus-recruitment/evtech/47503?recommendCode=DSjxqT4T#/jobs

【内推码】DSjxqT4T（内推简历优先筛选）', 1, '42fc5fb87c1575941b5ec9039931269c', CURRENT_TIMESTAMP
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
  'smartsheet_0042_5e8c8802', '思摩尔国际', '制造业', '27届秋招', '["技术研发类","产品","营销类","综合职能类","生产运营类","供应链类"]', '["深圳","上海","东莞","昆明","江门","美国","印度尼西亚"]',
  '技术研发类、产品/营销类、综合职能类、生产运营类、供应链类', 'DS1VMqUG', 'https://app.mokahr.com/m/campus_apply/smoore/150918?recommendCode=DS1VMqUG&hash=%23%2Fjobs#/jobs', '2026-09-03T08:00:00.000Z', '招满即止', 'active',
  '【关于我们】思摩尔国际（HK6969）成立于2009年，是提供雾化科技解决方案的全球领导者，专注在雾化传输、雾化医疗、雾化美容等领域；全球拥有员工20000+，产品远销近80个国家，海外营收占比超过90%。

【岗位选择】技术研发类、产品/营销类、综合职能类、生产运营类、供应链类

【工作地点】深圳、上海、东莞、昆明、江门、美国、印度尼西亚

【福利待遇】
1️⃣行业内高竞争力的薪酬
本硕毕业生：技术研发类18-30W、产品/营销类17-27W、其他职能类15-24W
博士毕业生：45-60W
💰薪酬不设限，优秀者可获SP Offer 
2️⃣共享发展成果
绩效奖金、价值分享奖金、专项奖金、年度评优等多项激励，更有机会享受股权激励计划
3️⃣多重福利全面关怀
住房补贴、外派津贴、餐饮通讯补贴、生日礼金、下午茶等

【内推链接】https://app.mokahr.com/m/campus_apply/smoore/150918?recommendCode=DS1VMqUG&hash=%23%2Fjobs#/jobs

【内推码】DS1VMqUG（内推简历优先筛选，后续有问题随时联系！', 1, '5e8c8802347dbca4cc3af4914ed6271e', CURRENT_TIMESTAMP
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
  'smartsheet_0043_b31695f2', 'SHEIN', '跨境电商', '27届秋招/日常实习', '["信息技术类","全球运营类","职能管理类","商品平台类","服装供应链类","国际物流与仓储类"]', '["广州","深圳","上海","南京","肇庆"]',
  '信息技术类、全球运营类、职能管理类、商品平台类、服装供应链类、国际物流与仓储类', 'DSV7bRFs', 'https://app.mokahr.com/m/campus_apply/shein/2932?recommendCode=DSV7bRFs&hash=%23%2Fjobs#/jobs', '2026-09-03T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】SHEIN是一家全球领先的时尚和生活方式在线零售商，2022/2023年购物类app下载量全球Top1，2024全球时尚零售商Top3，全球独角兽企业Top5

【招聘岗位】信息技术类、全球运营类、职能管理类、商品平台类、服装供应链类、国际物流与仓储类

【工作城市】广州、深圳、上海、南京、肇庆

【内推链接】
https://app.mokahr.com/m/campus_apply/shein/2932?recommendCode=DSV7bRFs&hash=%23%2Fjobs#/jobs

【内推码】DSV7bRFs

内推简历优先筛选，面试流程加快！', 1, 'b31695f2e26151daa4fe8a259a5ff638', CURRENT_TIMESTAMP
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
  'smartsheet_0044_5420bdad', '天赐材料', '制造业', '27届秋招', '["技术类","制造类","职能类","销售类"]', '["广州","上海","九江","龙南","池州","衢州","溧阳","赣州","宜昌","宜春","清远","西宁","德州","眉山","台州","东莞","江门","福鼎","海外"]',
  '技术类、制造类、职能类、销售类', 'cjsbom', 'https://wecruit.hotjob.cn/SU62c3ea6b2f9d241e4c8e45ba/mc/position/campus?acotycoCode=bgfmdb&projectId=201701&recruitType=1&isLimitShowPostScope=1', '2026-09-02T08:00:00.000Z', '招满即止', 'active',
  '天赐材料 2027 届秋季校园招聘正式启动！
#电解液龙头企业

【公司介绍】广州天赐高新材料股份有限公司（简称“天赐材料”，股票代码：002709）成立于2000年6月，2014年成功上市。主营业务为锂离子电池材料、日化材料及特种化学品。天赐材料目前拥有46家全资子公司，15家控股子公司，人员规模 8300+。2025年锂离子电池电解液市场占有率达30.5%，全球第一，连续10年销量全球领先；卡波姆产品产能居全球第二位，两性表面活性剂产能居全球第三，是具有较大影响力及行业示范作用的国际一流精细化工、电解液龙头企业。

【招聘岗位】技术类、制造类、职能类、销售类

【工作地点】广州、上海、九江、龙南、池州、衢州、溧阳、赣州、宜昌、宜春、清远、西宁、德州、眉山、台州、东莞、江门、福鼎、海外

【福利待遇】五险一金+带薪年假+项目奖金+节日福利+食宿配套+年度体检+股票期权...各种福利应有尽有！

【网申链接】https://wecruit.hotjob.cn/SU62c3ea6b2f9d241e4c8e45ba/mc/position/campus?acotycoCode=cjsbom', 1, '5420bdad305f63743ae0b2ed00148692', CURRENT_TIMESTAMP
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
  'smartsheet_0045_d36225a1', '图拉斯（原蓝禾）', '电商', '27届秋招', '["营销类","海外电商运营类","职能类","国内电商运营类","电商平面设计类","研发&技术类","三维渲染类"]', '["深圳"]',
  '营销类、海外电商运营类、职能类、国内电商运营类、电商平面设计类、研发&技术类、三维渲染类', 'MA34XQ6', 'https://lanhevip.jobs.feishu.cn/s/PGnwRRVfzBU', '2026-09-02T08:00:00.000Z', '招满即止', 'active',
  '图拉斯27届校招启动！不限专业！1000+offer职等你来！

公司简介：图拉斯一家集产品、设计、研发、品牌、营销与大数据于一体的创新型科技公司，全球员工超4500人，业务覆盖148+国家和地区！

 推荐岗位：运营类、设计类、产品类、传媒类、营销类、技术工程类、职能类

 我们提供： 起薪10-25w，五险一金、项目分红！ 一对一导师制 + 专业/管理双通道发展， 健身房、食堂、兴趣部落、团建旅游、每月主题生日会…

【工作地点】深圳市

【内推链接】https://lanhevip.jobs.feishu.cn/s/PGnwRRVfzBU

【推荐码】MA34XQ6（推荐方式选择大使推荐，简历优先筛选）', 1, 'd36225a146ae79da5a16dde4024582d9', CURRENT_TIMESTAMP
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
  'smartsheet_0046_8002d16c', '广联达', '科技', '27届秋招', '["AI算法","几何图形算法","Agent开发","数据开发","产品需求","测开等"]', '["北京","上海","西安"]',
  'AI算法、几何图形算法、Agent开发、数据开发、产品需求、测开等', 'DSrXVWVa', 'https://app.mokahr.com/m/campus_apply/glodon/91966?recommendCode=DSrXVWVa#/jobs', '2026-09-03T08:00:00.000Z', '招满即止', 'active',
  '广联达2027 TOT产研校招启动！

公司简介：广联达是建筑数字化A股龙头，国内建设工程信息化首家A股上市企业，连续两年中国数字建造市场排名第一，拥有8大全球研发中心，业务覆盖100+国家地区，80+海内外分子公司，北京、上海、西安、广州共5大创新基地
 
招聘岗位: AI算法、几何图形算法、Agent开发、数据开发、产品需求、测开等岗位，面向计算机/软件/自动化/土木/建筑/机械/工程管理等相关专业
 
工作地点：北京｜上海｜西安，开放数百offer

【内推链接】https://app.mokahr.com/m/campus_apply/glodon/91966?recommendCode=DSrXVWVa#/jobs

【内推码】DSrXVWVa（简历优先筛选，流程加快）', 1, '8002d16ca5ff8f42420194160eef7e8a', CURRENT_TIMESTAMP
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
  'smartsheet_0047_675ea403', '吉比特', '游戏', '27届秋招', '["研发技术类","美术设计类","产品运营类","市场营销类","游戏客服类"]', '["深圳","厦门"]',
  '研发技术类、美术设计类、产品运营类、市场营销类、游戏客服类', 'W2G35W', 'https://hr.g-bits.com/mobile/index.html#/?referralCode=W2G35W', '2026-09-02T08:00:00.000Z', '招满即止', 'active',
  '🎮 吉比特 2027 秋招正式启动！
⏰ 9 月 3 日网申开启，岗位招满即止，尽早投递快人一步！

✅ 核心岗位全覆盖：研发技术类、美术设计类、产品运营类、市场营销类、游戏客服类

[胜利]工作地点：深圳、厦门

🌟 大厂福利拉满：高竞争力薪资 + 每月房补+12%公积金+ 最高100万免息购房借款+每月电影日+补充商业保险+每月团建经费+各种兴趣社团

🔗 秋招投递链接：https://hr.g-bits.com/mobile/index.html#/?referralCode=W2G35W

📌 【专属内推码】W2G35W

填写内推码，简历优先处理，笔试 / 面试 9 月底起陆续启动！
加入吉比特，和爆款游戏团队一起，把热爱做成事业！', 1, '675ea4038dcfce831f064cb684bc0b86', CURRENT_TIMESTAMP
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
  'smartsheet_0048_b42a41dc', '景嘉微', '芯片半导体', '27届秋招', '["芯片架构类","软件类","数字类","硬件类","职能类"]', '["长沙","上海","北京"]',
  '芯片架构类、软件类、数字类、硬件类、职能类', 'DSv2uuBS', 'https://app.mokahr.com/m/campus-recruitment/jjw/143541?recommendCode=DSv2uuBS#/jobs', '2026-09-03T08:00:00.000Z', '招满即止', 'active',
  '【公司介绍】深交所上市国产GPU龙头企业（300474），深耕GPU芯片、图形显控、雷达领域，多款国产GPU实现大规模量产
【招聘岗位】芯片架构类、软件类、数字类、硬件类、职能类
【工作地点】长沙、上海、北京
【福利待遇】1v1导师带教，技术/管理双通道发展；薪资对标一线，优秀可获SP Offer，安家费、签字费；六险一金、过渡住宿补贴、各类津贴、年度体检；博士薪资一事一议，硕士年薪最高60w
【内推链接】https://app.mokahr.com/m/campus-recruitment/jjw/143541?recommendCode=DSv2uuBS#/jobs
【内推码】DSv2uuBS（内推投递，简历优先筛选）', 1, 'b42a41dc7e8002c7695a24a1c5398c44', CURRENT_TIMESTAMP
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
  'smartsheet_0049_81f654da', '途虎养车', '互联网', '27届秋招', '["技术类","策划类","运营类","职能类"]', '["上海","武汉"]',
  '技术类、策划类、运营类、职能类', 'DSmVMXma', 'https://app.mokahr.com/m/campus_apply/tuhu/28398?recommendCode=DSmVMXma#/jobs', '2026-09-02T08:00:00.000Z', '招满即止', 'active',
  '薪资比肩大厂 | 途虎养车2027届校招开启！

【关于我们】途虎养车是中国领先的线上线下一体化汽车服务平台，2011年于上海成立，并在2023年港股上市！拥有1.5亿注册用户数，全国工场店达到7205家，以注册用户、月活用户、交易用户计，途虎养车均稳居中国汽车服务市场第一名。

【工作城市】上海、武汉

【开放岗位】研发类、策划类、运营类、职能类

【薪酬待遇】我们提供极具竞争力、不输互联网大厂的薪酬、福利和待遇

【内推链接】https://app.mokahr.com/m/campus_apply/tuhu/28398?recommendCode=DSmVMXma#/jobs

【内推码】DSmVMXma（内推简历优先筛选，面试流程加快！）', 1, '81f654da4e1a407ae3cf7cd37eb32690', CURRENT_TIMESTAMP
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
  'smartsheet_0050_320e92fc', '养生堂·农夫山泉', '快消', '27届秋招', '["行销类","生产类","信息技术类","职能类","基础研发类","生物医药类","品牌类","应用研发类","8大职类","600+offer"]', '["全国各地"]',
  '行销类、生产类、信息技术类、职能类、基础研发类、生物医药类、品牌类、应用研发类，8大职类、600+offer', 'DSxCbcnr', 'https://app.mokahr.com/m/campus-recruitment/yst/68367?recommendCode=DSxCbcnr&hash=%23%2Fjobs#/jobs', '2026-09-02T08:00:00.000Z', '招满即止', 'active',
  '【企业简介】养生堂创建于1993年,是一家横跨多元业务领域的综合性集团。业务横跨软饮料和农业、食品、生物医药、保健食品、化妆品5大版块,拥有强大的品牌沟通力。农夫山泉成立于1996年，于2020年9月8日在港股上市(09633),是中国市场上同时具备规模性、成长性和盈利能力的饮料龙头企业

【岗位类别】行销类、生产类、信息技术类、职能类、基础研发类、生物医药类、品牌类、应用研发类，8大职类、600+offer

【工作地点】杭州等全国多地

【内推链接】https://app.mokahr.com/m/campus-recruitment/yst/68367?recommendCode=DSxCbcnr&hash=%23%2Fjobs#/jobs

【内推码】DSxCbcnr（内推简历优先筛选，面试流程加快！）', 1, '320e92fc3e79b187a3401daaf687a234', CURRENT_TIMESTAMP
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
  'smartsheet_0051_f4755dab', '湖南德赛电池', '制造业', '27届秋招', '["研发类","技术类","智能制造类","营销类","品质类","职能类"]', '["湖南长沙市"]',
  '研发类、技术类、智能制造类、营销类、品质类、职能类', '通过内推链接投递即可，简历直达面试官', 'https://docs.qq.com/form/page/DUWFpZFRIbHFqWm9z', '2026-09-02T08:00:00.000Z', '招满即止', 'active',
  '湖南德赛电池2027届校园招聘正式启动！

【关于我们】
湖南德赛电池有限公司是深圳市德赛电池科技股份有限公司(SZ.000049)的子公司，是广东德赛集团有限公司在新能源产业的重要布局

湖南德赛电池成立于2022年3月3日，是一家集先进储能电芯研发、设计、制造、销售、服务于一体的国家高新技术企业，专注于为全球新能源市场提供优秀、专业和绿色的一体化能源解决方案，致力成为国际一流的创新型新能源企业

【招聘岗位】研发类、技术类、智能制造类、营销类、品质类、职能类

【薪酬福利】
本科：9-16W/年
硕士：12-25W/年
博士：面议
✅六险一金：依法缴纳社会保险、住房公积金、雇主责任险
✅伙食：餐厅免费供应1日3餐
✅住宿：免费入住职员公寓（2人套间）家具、空调、电视、冰箱、洗衣机、热水等设施一应俱全
✅娱乐：健身房、羽毛球、乒乓球、舞蹈课、台球、篮球等
✅其他福利：培训、节日礼包、生日礼物、年度健康体检……

【网申链接】湖南德赛电池有限公司2027届校园招聘', 1, 'f4755dabcfccd770db1a361122daed70', CURRENT_TIMESTAMP
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
  'smartsheet_0052_8cc2374c', '巨一科技', '新能源', '27届秋招', '["研发技术类","销售支持类","算法软件类","质量和供应链类","具身智能与Al算法类","职能类","制造技术类","项目管理类"]', '["上海","苏州","合肥","美国","德国","新加坡","日本"]',
  '研发技术类、销售支持类、算法软件类
、质量和供应链类、 具身智能与Al算法类、 职能类、制造技术类、项目管理类', 'DSng1bRU', 'https://app.mokahr.com/m/campus_apply/ahjy/168235?recommendCode=DSng1bRU#/jobs', '2026-09-03T08:00:00.000Z', '招满即止', 'active',
  '⚡️巨一科技2027秋招启动
21年科创板上市 国家创新型试点企业 国家专精特新“小巨人”企业 智能装备和新能源汽车电驱动系统解决方案专家 为汽车尤其是新能源汽车提供白车身、动力总成以及动力电池的智能制造解决方案  为新能源汽车提供电驱动产品的研发、生产与全生命周期服务

➡️岗位：研发技术类 销售支持类 算法软件类
质量和供应链类 具身智能与Al算法类 职能类
制造技术类 项目管理类
➡️需求专业：机械类 计算机类 电子信息类
电气自动化类 职能支持类 能源材料类 电机类
➡️base：上海苏州合肥美国德国新加坡日本

✅内推码DSng1bRU
✅内推链接https://app.mokahr.com/m/campus_apply/ahjy/168235?recommendCode=DSng1bRU#/jobs', 1, '8cc2374ccf3d8fdd60394cd5162cc333', CURRENT_TIMESTAMP
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
  'smartsheet_0053_dd15aa18', '象屿', '国企/供应链', '27届秋招', '["大宗商品业务岗","国际化大宗商品业务岗（外派方向）","贸易运营岗","财务管理岗","物流管理岗","物流业务岗","运营管理岗","产业研究岗","投资管理岗","衍生品交易结算岗","矿山评估工程师","数字化运营岗","法务岗","人力资源岗","行政文宣岗"]', '["厦门","上海","天津","福州","哈尔滨","大连","西安","张家港","杭州","银川","广州","青岛","东南亚","中东","非洲","南美"]',
  '大宗商品业务岗、国际化大宗商品业务岗（外派方向）、贸易运营岗、财务管理岗、物流管理岗、物流业务岗、运营管理岗、产业研究岗、投资管理岗、衍生品交易结算岗、矿山评估工程师、数字化运营岗、法务岗、人力资源岗、行政文宣岗', 'EVKM9T', 'https://xiangyu.zhiye.com/campus/jobs?shareId=7a07084e-6a86-4253-a263-8e2d42d04a6f&shareSource=2&qr=1', '2026-09-03T08:00:00.000Z', '招满即止', 'active',
  '【象屿2027届秋招进行时】

加入世界500强国企，投身大宗商品行业龙头！
行业龙头，领跑前沿，感受世界经济脉搏
即刻投递，快速加入世界五百强！

我们提供：
六险二金！完善培养体系！行业竞争力薪酬！更多成长空间！
屿果公寓、十佳员工食堂，更有免费班车、健身房！

【招聘岗位】大宗商品业务岗、国际化大宗商品业务岗（外派方向）、贸易运营岗、财务管理岗、物流管理岗、物流业务岗、运营管理岗、产业研究岗、投资管理岗、衍生品交易结算岗、矿山评估工程师、数字化运营岗、法务岗、人力资源岗、行政文宣岗

【工作地点】厦门、上海、天津、福州、哈尔滨、大连、西安、张家港、杭州、银川、广州、青岛、东南亚、中东、非洲、南美等

【内推链接】https://xiangyu.zhiye.com/campus/jobs?shareId=7a07084e-6a86-4253-a263-8e2d42d04a6f&shareSource=2&qr=1
【推荐码】EVKM9T

【招聘流程】：线上投递——简历筛选——初试——测评——复试——象屿offer', 1, 'dd15aa182a9d16fd76f3c9c967ef32c6', CURRENT_TIMESTAMP
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
  'smartsheet_0054_54df32d3', '盛弘电气', '新能源', '27届秋招', '["研发类","供应链类","销售类","职能类"]', '["深圳","西安","苏州","惠州","海外派驻"]',
  '研发类、供应链类、销售类、职能类', 'DS1Bzy1q', 'https://app.mokahr.com/m/campus-recruitment/sinexcel/74287?recommendCode=DS1Bzy1q#/jobs', '2026-09-01T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】上市公司+专精特新+国家级高新技术企业+全球新能源500强；储能、充换电、新能源、电力赛道、万亿市场，大有可为！

【高标准薪酬】本科25W+，硕士40W+，博士面议，薪资可一人一议

【热招职位】 研发类、供应链类、销售类、职能类

【工作地点】 深圳、西安、苏州、惠州、海外派驻/出差

【内推链接】https://app.mokahr.com/m/campus-recruitment/sinexcel/74287?recommendCode=DS1Bzy1q#/jobs

【内推码】DS1Bzy1q（简历优先筛选，流程加快）', 1, '54df32d31694708ad5e27a9fd0ee43e2', CURRENT_TIMESTAMP
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
  'smartsheet_0055_53b60939', '智驾新程 neueHCT', '智能驾驶', '27届秋招', '["算法","软件","硬件","测试","系统","项目管理","质量等"]', '["上海","北京","南京"]',
  '算法、软件、硬件、测试、系统、项目管理、质量等', 'APRMPDR', 'https://neuehct.jobs.feishu.cn/s/1ZCInstZPRM', '2026-09-02T08:00:00.000Z', '招满即止', 'active',
  '智驾新程 neueHCT2027届校园招聘正式启动！

✅双巨头强强合资平台｜德国欧摩威× 国产AI芯片龙头地平线，技术背景硬核，履历超高含金量！
✅ 技术&业务：全栈量产智驾团队，落地城区NOA高阶功能，服务比亚迪、东风猛士、奇瑞等主流车企，手握16+头部车企定点、50+量产车型，海外业务占比40%，全球化发展机会充足。

【热招岗位】算法、软件、硬件、测试、系统、项目管理、质量等
【工作地点】上海、北京、南京
【专属福利】六险一金（12%顶格公积金）、全薪病假、带薪年假、租房补贴、年度体检、节日及团建福利

【内推链接】https://neuehct.jobs.feishu.cn/s/1ZCInstZPRM
【内推码】APRMPDR

内推简历优先筛选，流程跟进', 1, '53b60939c1e2f05cb86c8de716d5aa83', CURRENT_TIMESTAMP
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
  'smartsheet_0056_440c2a9c', '猎豹移动-豹趣科技', '互联网', '27届秋招', '["AI产品经理","AI开发工程师","服务端开发工程师"]', '["珠海"]',
  'AI产品经理、AI开发工程师、服务端开发工程师', '通过内推链接投递即即可，简历直达面试官', 'https://docs.qq.com/form/page/DRnVwVEF2a0VOb2p1', '2026-09-01T08:00:00.000Z', '招满即止', 'active',
  '猎豹移动子公司-豹趣科技2027校园招聘启动！

【关于我们】是美股上市公司猎豹移动的子公司，坐落于金山软件园区。公司坚持自主创新，在信息安全领域耕耘20余年，积累工具产品活跃用户超1亿。公司产品包括金山毒霸、easyclaw、驱动精灵、猎豹浏览器及极光PDF、元气桌面壁纸等，在AI赋能下，致力于为用户提供优秀的工具产品服务。

【招聘岗位】AI产品经理、AI开发工程师、服务端开发工程师

【工作地点】广东省珠海市金山软件园4栋豹趣科技

【薪酬福利】 六险一金、周末双休、免费住宿、带薪年假、交通补贴、餐补、节日礼品、生日关怀、人才奖励、婚育生育礼金等等

【极速内推链接】
https://docs.qq.com/form/page/DRnVwVEF2a0VOb2p1
一键投递个人简历，简历直达面试官！', 1, '440c2a9c9601106c23b07372f7423548', CURRENT_TIMESTAMP
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
  'smartsheet_0057_63377614', '锐明技术', '智能驾驶', '27届秋招', '["研发设计类","营销类","供应制造类","品牌市场类","职能支撑类"]', '["深圳","重庆","成都","东莞；海外覆盖休斯顿","荷兰","英国","日本","圣保罗"]',
  '研发设计类、营销类、供应制造类、品牌市场类，职能支撑类', 'EV3P8A', 'https://streamax.zhiye.com/campus/jobs?shareId=4a741abc-20ff-4882-8a94-0fe12eb5aa80&shareSource=2', '2026-09-01T08:00:00.000Z', '招满即止', 'active',
  '🌟锐明技术 2027 届全球校园招聘｜秋招火热开启！
🚀加入我们，和我们一起驶向下一公里！Dream Max with Streamax！

🥳我们是全球领先的商用车智能解决方案提供商（A股上市企业），运用高清视频、视觉AI、云计算和大数据等核心技术深耕人工智能商用车安全与信息化解决方案。如今高阶自动驾驶板块全新加码，聚焦 L2/L2 + 高阶智驾、多传感器融合感知、人因大脑、云计算等奔赴商用车智能出行新赛道。

我们提供有竞争力的薪酬福利、完善培养体系、多元广阔的成长平台，让你的技术想法真正落地全球交通场景。

💼🔥热招岗位全面开放：
研发设计类：自动驾驶感知 / 视觉算法工程师、硬件工程师、嵌入式软件开发工程师、产品经理等；
同时开放营销类、供应制造类、品牌市场类，职能支撑类多方向岗位，多元赛道等你来投递！

🌍工作地点：深圳、重庆、成都、东莞；海外覆盖休斯顿、荷兰，英国、日本，圣保罗等子公司属地。

📌校招小 Tips✨
▪每人最多投递 3 个岗位，志愿为平行志愿，多岗位同步筛选

👉渴望投身AI智能和自动驾驶浪潮，奔赴智能出行下一公里？即刻投递简历，与锐明共赴下', 1, '63377614e4efd0badfe206c7924a3c4b', CURRENT_TIMESTAMP
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
  'smartsheet_0058_fa072799', '拼多多', '互联网', '27届秋招', '["产品","市场类","运营类","视觉类","语言类","综合类","AI","Infra","大模型","算法","服务端","数据","客户端","安全","Web前端"]', '["上海"]',
  '产品/市场类、运营类、视觉类、语言类、综合类
、AI Infra、大模型、算法、服务端、数据、客户端、安全、Web前端', 'NamZDsVRWg', 'https://careers.pddglobalhr.com/campus/grad?t=NamZDsVRWg', '2026-09-01T08:00:00.000Z', '招满即止', 'active',
  '🔥 拼多多集团-PDD｜2027届校招正式批启动！
🌟 7大职类3000+OFFER，岗位招满即止
⏰ 网申时间：9月2日-次年1月31日
立即投递抢占先机！

【招聘岗位】
研发类：AI Infra、大模型、算法、服务端、数据、客户端、安全、Web前端
非研发：产品/市场类、运营类、视觉类、语言类、综合类

推荐链接：https://careers.pddglobalhr.com/campus/grad?t=NamZDsVRWg
推荐码：NamZDsVRWg

同一批次每位同学仅1次投递机会', 1, 'fa072799f0bddb9faa5011c10e4f933b', CURRENT_TIMESTAMP
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
  'smartsheet_0059_8f2ac05f', '金升阳科技', '能源电力', '27届秋招', '["电源硬件","软件研发","工艺","质量","销售","FAE","职能岗等"]', '["广州","怀化","长沙","武汉","西安"]',
  '电源硬件 / 软件研发、工艺、质量、销售、FAE 、职能岗等', 'ESK0K3', 'https://mornsun.zhiye.com/campus/jobs?shareId=479d071f-aa67-4743-9a53-1fa0e15f10f9&shareSource=2', '2026-08-31T08:00:00.000Z', '招满即止', 'active',
  '公司简介：成立于1998年，为国家高新技术企业、国家级专精特新“小巨人”企业，是集研发、生产、销售于一体服务全球的电源解决方案提供商。

招聘岗位：电源硬件 / 软件研发、工艺、质量、销售、FAE 、职能岗等

工作地点：广州、怀化、长沙、武汉、西安

公司平台和福利：
✅ 福利无套路：五天八小时工作制，竞争力薪酬 + 丰厚奖金，年度体检 / 旅游 / 节假福利全有，广州 / 怀化还能免费食宿
✅ 平台够硬核：博士后站点 + 国家高新技术企业，知识产权超 1400 项，研发团队 700 人 +

【内推链接】https://mornsun.zhiye.com/campus/jobs?shareId=479d071f-aa67-4743-9a53-1fa0e15f10f9&shareSource=2

【内推码】ESK0K3 （简历优先筛选，面试流程加快！）', 1, '8f2ac05f9b72354cd08257369be2cd2f', CURRENT_TIMESTAMP
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
  'smartsheet_0060_cb1677b9', '浩鲸科技', '科技', '27届秋招', '["核心研发类","数据算法类","综合技术类","市场营销类","职能支持类"]', '["南京","广州","长沙","福州","厦门","西安"]',
  '核心研发类、数据算法类、综合技术类、市场营销类、职能支持类', 'EZ3MV0', 'https://iwhalecloud1.zhiye.com/campus/jobs?shareId=89c2d5d9-1cc8-404b-aba5-a285976656f2&shareSource=2', '2026-08-31T08:00:00.000Z', '招满即止', 'active',
  '🚀浩鲸科技2027 届秋季校园招聘正式启动！
全球领先数智化全栈能力提供商｜业务覆盖全球 80 + 国家

🔥五大类岗位热招中：
🔹核心研发（12~20 万）：全栈 / 大模型 / AI 应用 / 嵌入式开发
🔹数据算法（18~30 万）：NLP / 图像 / 语音 / VLA / 导航控制 / 强化学习 / 推理加速 / 数据挖掘
🔹综合技术（10~22 万）：云交付 / 测试 / 产品管培 / 国际交付 / 售前管培 / 项目管培 / 培训讲师
🔹市场营销（20~30 万）：全球销售管培生
🔹职能支持（8~12 万）：财务 / 人力资源专员

📍地点：南京｜广州｜长沙｜福州｜厦门｜西安

【内推链接】https://iwhalecloud1.zhiye.com/campus/jobs?shareId=89c2d5d9-1cc8-404b-aba5-a285976656f2&shareSource=2

【内推码】EZ3MV0（内推简历优先筛选）', 1, 'cb1677b9ee8f2895fc56e272a326d219', CURRENT_TIMESTAMP
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
  'smartsheet_0061_8df1a78d', '58同城', '互联网', '27届秋招', '["大语言模型","语音大模型工程师","多模态大模型及应用工程师","搜索推荐工程师","AI","Infra工程师","Agent开发工程师","AI产品经理","安全工程师"]', '["北京"]',
  '大语言模型/语音大模型工程师、多模态大模型及应用工程师、搜索推荐工程师、AI Infra工程师、Agent开发工程师、AI产品经理、安全工程师', 'DSngZnU5', 'https://app.mokahr.com/m/campus_apply/58/150953?recommendCode=DSngZnU5&hash=%23%2Fjobs#/jobs', '2026-08-31T08:00:00.000Z', '招满即止', 'active',
  '58同城【58A计划】2027届招聘启动
 
项目介绍：58A计划是58集团倾力打造的AI人才专项计划，致力于发掘并培养未来领军人才。58每天服务上亿用户,从招聘求职到房产交易，从本地生活到车房买卖，每一个真实场景都是AI技术的试炼场
 
为什么选58A计划
✅硬核项目历练
入局58核心业务战场，参与大语言模型、多模态、AI Infra等20+前沿技术课题，和行业顶尖专家并肩做项目
✅专属大咖带教
一对一专属导师全程指导，定期技术分享、论文研读、源码拆解，技术氛围拉满
 
💼招聘岗位类别
大语言模型/语音大模型工程师、多模态大模型及应用工程师、搜索推荐工程师、AI Infra工程师、Agent开发工程师、AI产品经理
 
📍工作地点
北京（58集团总部）
 
内推链接：https://app.mokahr.com/m/campus_apply/58/150953?recommendCode=DSngZnU5&hash=%23%2Fjobs#/jobs

【内推码】DSngZnU5（内推简历优先筛选，后续流程问题欢迎联系）', 1, '8df1a78d1001bd9e3f64439ca794b152', CURRENT_TIMESTAMP
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
  'smartsheet_0062_98b7572a', '禾赛科技（实习生）', '智能驾驶/机器人', '日常实习', '["系统类","器件类","算法类","软件类","硬件类","光机类","工艺类","芯片类","机械类","产品类","采购类","AI类","销售类"]', '["上海","杭州","重庆"]',
  '系统类、器件类、算法类、软件类、硬件类、光机类、工艺类、芯片类、机械类、产品类、采购类、AI类、销售类', 'EQXUXBJ', 'https://kwh0jtf778.jobs.feishu.cn/s/Pdvp7eXmWfs', '2026-09-01T08:00:00.000Z', '招满即止', 'active',
  '【公司介绍】禾赛科技是纳斯达克&港交所双上市企业，全球三维感知技术领导者，自研芯片和半导体器件累计交付量全球第一。无人驾驶、 ADAS、机器人三大市场市占率全球第一，在上海、硅谷、斯图加特等地设有办公室，在中国和泰国拥有自建工厂，产品覆盖全球40余个国家

【招聘岗位】系统类、器件类、算法类、软件类、硬件类、光机类、工艺类、芯片类、机械类、产品类、采购类、AI类、销售类

【工作地点】上海、杭州、重庆

【福利待遇】行业TOP级薪资、奖金股票，专家一对一导师带教，落户绿色通道，弹性工作，舒适办公环境，各类员工福利

【27届内推链接】
https://kwh0jtf778.jobs.feishu.cn/s/o-aei9Nv6NU

【实习生内推链接】
https://kwh0jtf778.jobs.feishu.cn/s/Pdvp7eXmWfs

【内推码】EQXUXBJ（选择大使推荐，内推简历优先筛选）', 1, '98b7572a276cc2eaa1434a5bb639df34', CURRENT_TIMESTAMP
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
  'smartsheet_0063_83c0edb1', '帆软', '互联网', '27届秋招', '["产品类","设计类","B端销售类","客户交付与运营类","市场类","职能类"]', '["南京","杭州","无锡","福州","厦门","北京","上海","武汉"]',
  '产品类，设计类，B端销售类，客户交付与运营类，市场类，职能类', 'ZNUXX', 'https://t6ixa9nyl6.jiandaoyun.com/f/65e1a1308ce7672fded0f0cf?ext=ZNUXX', '2026-08-31T08:00:00.000Z', '招满即止', 'active',
  '帆软27届秋招启动！专业不限！全线岗位薪酬均在1w+！

公司介绍：ToB 赛道商业智能/零代码 SaaS 领域常年市场占有率第一

招聘岗位：研发类、产品类、销售类、项目类、售前类、海量岗位等你Pick！🔥今年销售岗位和客户类的hc巨巨巨多！

Base地点：成都、无锡（总部）；华中；东北；西北；苏皖；浙闽；川渝等区域

福利：双休，40小时/周工作制，不强制加班，六险一金，氛围轻松扁平化管理

关于研发、产品岗位：帆软研发岗位薪资官网透明！！都是月base！！并且这两个岗位优秀者可获得有SP哦（大额签字费）

【专属内推链接】https://t6ixa9nyl6.jiandaoyun.com/f/65e1a1308ce7672fded0f0cf?ext=ZNUXX

【内推码】ZNUXX（内推投递，简历优先筛选，后续流程问题欢迎联系！）', 1, '83c0edb15534fbe57c8b2a1526e6a313', CURRENT_TIMESTAMP
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
  'smartsheet_0064_ad087b21', '厦门亿联网络', '科技', '27届秋招', '["研发类","产品类","营销类"]', '["福建","北京","上海","广州","深圳"]',
  '研发类、产品类、营销类', 'EVKG9G', 'https://yealink.zhiye.com/campus/jobs?shareId=3c661137-d080-477a-b7fd-7fb6f8e2e307&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-08-31T08:00:00.000Z', '招满即止', 'active',
  '厦门亿联网络2027届秋秋招启动！

【关于亿联】亿联网络 (300628)是全球领先的沟通与协作解决方案提供商，是全球TOP1 IP Phone厂商、全球TOP2微软MTR供应商、全球TOP3音视频会议出货厂商、厦门A股上市企业市值位居前列， 业绩年复合增长率连续多年超30% ，拥有3个海外子公司、5大全球体验中心

【招聘岗位】研发类、产品类、营销类、职能类

【福利待遇】顶额五险一金、丰厚年终奖、一年2次调薪机会，3年免费员工宿舍、通勤班车、租房补贴、超优惠购买厦门人才房、最高百万无息购房贷款，定期健康体检、七大运动俱乐部、部门团建基金...

【内推链接】https://yealink.zhiye.com/campus/jobs?shareId=3c661137-d080-477a-b7fd-7fb6f8e2e307&shareSource=2&qr=1&memory=%7B%7D&silence=1

【内推码】EVKG9G（简历优先筛选，面试流程更快）', 1, 'ad087b216e552b919ea33442a1a433ec', CURRENT_TIMESTAMP
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
  'smartsheet_0065_791ed507', '正浩创新', '新能源', '27届秋招/日常实习', '["产品类","研发类","营销类","供应链类","职能类"]', '["深圳","苏州","西安"]',
  '产品类、研发类、营销类、供应链类、职能类', '6DHKG7V', 'https://jobs.ecoflow.com/s/TrR63uj6lrI', '2026-08-31T08:00:00.000Z', '招满即止', 'active',
  '移动储能独角兽—正浩创新EcoFlow2027届校招启动！

【公司介绍】移动储能行业市占第一、移动储能第一家独角兽企业、1000+专利，全球超600W忠实用户、业务覆盖全球140+国家和地区

【岗位需求】研发、产品、营销服、供应链、采购、职能、设计

【工作地点】深圳、苏州、西安

【薪酬待遇】行业TOP薪酬、多重员工福利、部分岗位同学薪酬最高可达50w，特别优秀同学可配股

【内推链接】
https://jobs.ecoflow.com/s/TrR63uj6lrI

【内推码】6DHKG7V（推荐方式选择大使推荐，内推投递，简历优先筛选，面试流程加快！）', 1, '791ed507bb190d06381f6e4a0fe89265', CURRENT_TIMESTAMP
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
  'smartsheet_0066_8889264b', '银泰百货', '商业', '27届秋招', '["招商营运类","市场企划类","财务管理类","产品技术类","工程物业类"]', '["遍布全国","杭州","宁波","北京","武汉","西安","厦门"]',
  '招商营运类、市场企划类、财务管理类、产品技术类、工程物业类', 'ESKW1G', 'http://talent.intime.com.cn/campus/jobs?shareId=5f143e47-fd2b-4308-93d5-f8b7959fd0db&shareSource=2', '2026-08-31T08:00:00.000Z', '招满即止', 'active',
  '【企业简介】银泰百货创立于1998年，是全面架构在云上的互联网百货公司，位居中国百货零售业前列。旗下有60余家商场，遍布全国8省28城，融合AI尖端科技与大型零售复合体，致力于打造全球商业标杆与智能化新商场。
 
【银泰星项目简介】
定位海内外高校优秀学生，提供创新项目主理人机会及定制化培养方案，为公司储备门店店总、中高层管理人才。

【 招聘岗位】招商营运类、市场企划类、财务管理类、产品技术类、工程物业类

【工作城市】遍布全国、杭州、宁波、北京、武汉、西安、厦门等
 
【内推链接】
http://talent.intime.com.cn/campus/jobs?shareId=5f143e47-fd2b-4308-93d5-f8b7959fd0db&shareSource=2

【内推码】ESKW1G（通过内推投递，可加速简历筛选！）', 1, '8889264bfaffe64ac01fa120c9edd79a', CURRENT_TIMESTAMP
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
  'smartsheet_0067_522d4acf', '友塔游戏（hc多）', '游戏', '27届秋招', '["技术开发类","产品策划类","发行运营类","职能支持类"]', '["上海"]',
  '技术开发类、产品策划类、发行运营类、职能支持类', '通过内推链接投递即可', 'https://www.yottagames.com.cn/zh/internal-recommendation?token=72e67cca4782632fd61e6010a3b39517-999602-3630186243&sub=030', '2026-08-31T08:00:00.000Z', '招满即止', 'active',
  '国内TOP游戏公司，产品覆盖美洲、欧洲、日韩等多个地区2亿以上用户

【招聘岗位】技术开发类、产品策划类、发行运营类、艺术设计类等

【公司福利】有竞争力的薪资、五险一金、年度2次调薪、年度体检、年假12+、餐补、房补、团建、生日/节庆福利、无限量饮料雪糕零食、丰富水果等

【内推链接】https://www.yottagames.com.cn/zh/internal-recommendation?token=72e67cca4782632fd61e6010a3b39517-999602-3630186243&sub=030

通过内推链接投递，自动计入内推，简历优先筛选！', 1, '522d4acf06dccf22aacee8dc5e4ea401', CURRENT_TIMESTAMP
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
  'smartsheet_0068_db20c2a5', '柏楚电子', '科技', '27届秋招/日常实习', '["软件研发类","硬件研发类","互联网开发设计类","市场服务类","产品管理类","技术应用类","商务销售类","专业职能类","供应链类","质量类"]', '["上海（总部）；南京","济南","佛山","深圳","武汉（仅开放技术支持岗位）"]',
  '软件研发类、硬件研发类、互联网开发设计类、市场服务类、产品管理类、技术应用类、商务销售类、专业职能类、供应链类、质量类', 'ESKGAK', 'https://fscut.zhiye.com/campus/jobs?shareId=266d5be8-1496-459b-a831-97d96d7bfdb1&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-08-30T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】2019年科创板上市企业，坚持自主研发，累计获得572项知识产权授权，持续创新，开放式大学氛围，带薪春秋游，国家高新技术企业、重点软件企业、上海市科技小巨人企业、国家级“专精特新”小巨人、上海硬核科技企业TOP100、“人工智能+”全球领航企业TOP30…

【招聘岗位】研发类、产品类、市场类、生产类、职能类

【Base地点】上海（总部）；南京、济南、佛山、深圳、武汉（仅开放技术支持岗位）

【福利待遇】19-42万，六险二金，14天+春节假期，带薪春秋游

✅ 内推链接：
https://fscut.zhiye.com/campus/jobs?shareId=266d5be8-1496-459b-a831-97d96d7bfdb1&shareSource=2&qr=1&memory=%7B%7D&silence=1

内推码：ESKGAK

内推投递，简历优先筛选！', 1, 'db20c2a5f20f0c3464800785fbda2571', CURRENT_TIMESTAMP
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
  'smartsheet_0069_93fed879', '万辰集团（好想来零食）', '零售/快消', '27届秋招', '["辰星计划","前台类","技术类","中后台"]', '["南京","上海"]',
  '辰星计划、前台类、技术类、中后台', 'EVKM3S', 'https://vanchen1.zhiye.com/campus/jobs?shareId=1522417d-e735-4266-ab15-bbe6695d1694&shareSource=2', '2026-08-31T08:00:00.000Z', '招满即止', 'active',
  '万辰集团（好想来零食）2027校园招聘正式启动

【公司简介】万辰集团创立于2011年，于2021年A股上市 (股票代码:300972.SZ)，主营食用菌菇和量贩零食两大板块。其量贩零食业务先后整合五大零食零售品牌（陆小馋、好想来、来优品、吖嘀吖嘀、老婆大人)，目前集团旗下品牌全国门店超2万家。好想来品牌零食以“家门口的零食乐园”为定位，开启中国量贩零食行业新纪元。

【招聘岗位】
辰星计划：旨在通过体系化培训，多领域轮岗与真实一线业务淬炼，提供清晰加速的晋升通道，培养全集团未来领军人才
管培方向：前台类、技术类、中后台

【工作地点】南京、上海

【福利待遇】五险一金、生日福利、节日福利、入职礼包、婚育礼金、员工体检、带薪假期、定期团建等超多福利等你来解锁！

【内推链接】https://vanchen1.zhiye.com/campus/jobs?shareId=1522417d-e735-4266-ab15-bbe6695d1694&shareSource=2

【内推码】EVKM3S（内推简历优先筛选，面试流程加快！）', 1, '93fed879f6d1948425e983647d44bfb8', CURRENT_TIMESTAMP
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
  'smartsheet_0070_b4e185a5', '李森智能（hc多）', '跨境电商', '27届秋招', '["运营","推广","设计","产品","供应链"]', '["深圳"]',
  '运营、推广、设计、产品、供应链', 'EVKMB9', 'https://lisen.zhiye.com/campus/jobs?shareId=24a419fb-d2e5-48a5-9686-e07e86f5a3c7&shareSource=2', '2026-08-30T08:00:00.000Z', '招满即止', 'active',
  '李森智能2027校招启动！运营推广hc多专业不限！

公司简介：李森LISEN创办于2013年，专注于手机外设产品的研发、生产与销售，业务范围遍布北美洲，欧洲及亚洲等50多个国家，年营收14亿；李森三大产品（车充、线材和支架）连续三年蝉联亚马逊平台市场份额第一！

招聘岗位：运营/推广/设计/产品/供应链多岗位可选

福利待遇：年薪14-25W，每年两次调薪机会，甲级写字楼办公环境、年度健康体检、生日带薪假、节日福利，部门团建经费、年度旅游、定期文体活动、交通补贴，以及办公电脑、员工内购优惠、免费零食下午茶等

内推链接：
https://lisen.zhiye.com/campus/jobs?shareId=24a419fb-d2e5-48a5-9686-e07e86f5a3c7&shareSource=2

内推码：EVKMB9（内推简历优先筛选，hc多多，速来投递！）', 1, 'b4e185a51540a1ae11af1022e270cbdf', CURRENT_TIMESTAMP
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
  'smartsheet_0071_777dd0fe', '傲风', '制造业', '27届秋招', '["供应链计划管理","算法工程师","结构工程师","嵌入式软件工程师","嵌入式硬件工程师","ID","设计师","CMF","设计师","FDE","前沿部署工程师","(A方向）","产品营销"]', '["杭州","上海","苏州","成都"]',
  '供应链计划管理、算法工程师、结构工程师、嵌入式软件工程师、嵌入式硬件工程师、ID 设计师、CMF 设计师、FDE 前沿部署工程师 (A方向）、产品营销', 'DSwkXyqC', 'https://app.mokahr.com/m/campus_apply/heibaidiao/54126?recommendCode=DSwkXyqC#/jobs', '2026-08-31T08:00:00.000Z', '招满即止', 'active',
  '傲风2027届校园招聘启动！

公司简介：深耕电竞与健康坐具领域多年，产品覆盖专业电竞椅、人体工学椅、升降桌等，远销全球 100+ 国家和地区。连续多年蝉联电商大促电竞椅类目销量冠军，是 LPL、KPL 等多个顶级职业赛事及战队的官方合作伙伴

 岗位类别：供应链计划管理，算法工程师，结构工程师，嵌入式软件工程师，嵌入式硬件工程师，ID 设计师，CMF 设计师，FDE 前沿部署工程师 (A方向），产品营销

工作地点：杭州 · 上海 · 苏州 · 成都

傲风福利：五险一金 + 年终奖金 + 带薪年假 + 节日礼包 + 员工专属内购折扣 + 定期团建 + 完善培训体系

【 内推链接】https://app.mokahr.com/m/campus_apply/heibaidiao/54126?recommendCode=DSwkXyqC#/jobs

【内推码】DSwkXyqC（简历优先筛选，流程加速）', 1, '777dd0fe460aa4678965c613c707cfc1', CURRENT_TIMESTAMP
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
  'smartsheet_0072_40bf9a0f', '爱迪特Aidite', '制造业', '27届秋招', '["技术类","市场类","职能类"]', '["河北秦皇岛（总部）","杭州","海外"]',
  '技术类、市场类、职能类', 'ADT-C-27122（务必填写，内推简历优先筛选）', 'https://www.aidite.com/zh/positionPage', '2026-08-31T08:00:00.000Z', '招满即止', 'active',
  '爱迪特Aidite2027届校园招聘启动！

【企业简介】爱迪特是A股上市、全球齿科服务商，主营口腔陶瓷材料、数字化设备全套解决方案，业务覆盖全球多国，牵头国家级重点研发项目。

📍工作地点：河北秦皇岛（总部） 、杭州、海外

招聘岗位：技术类、市场类、职能类（详情官网查看
）

 官网网申链接：https://www.aidite.com/zh/positionPage

【内推码】ADT-C-27122（务必填写，内推简历优先筛选）', 1, '40bf9a0fc907a9deb72730b4105450bf', CURRENT_TIMESTAMP
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
  'smartsheet_0073_25bc8c73', '容知日新', '科技', '27届秋招', '["研发技术类","市场营销类","诊断技术类","生产制造类","职能管理类"]', '["合肥"]',
  '研发技术类、市场营销类、诊断技术类、生产制造类、职能管理类', 'DSNhPPBD', 'https://app.mokahr.com/m/campus_apply/anhuirohgzhirixin/73950?recommendCode=DSNhPPBD#/jobs', '2026-08-30T08:00:00.000Z', '招满即止', 'active',
  '容知日新2027秋招启动！｜这波工业数智化浪潮，喊你上车！
 
【公司简介】有点“硬核”的行业玩家，2007年出道，科创板上市（代码688768），AI+工业设备运维的领军者！从传感器到行业大模型，技术链拉满，业务遍及欧美东南亚，正用新质生产力给工业“焕新升级”
 
【招聘岗位】研发技术类、市场营销类、诊断技术类、生产制造类、职能管理类
 
【加入福利】工作成长两不误
1. 成长加速度：“未来星计划”带教入门，“X计划”2-3年冲中基层管理岗
2. 快乐不打烊：弹性打卡、周三运动日早下班、健身房+员工餐厅、生日节日福利拉满
3. 赛道够宽：站工业数智化风口，和行业大佬一起搞事情
4.高竞争力的薪酬
本硕毕业生：技术研发类30-34W、产品/营销类24-27W、其他职能类22-28W，博士毕业生薪资面议，薪酬不设限，优秀者可获sp offer
 
【内推链接】
https://app.mokahr.com/m/campus_apply/anhuirohgzhirixin/73950?recommendCode=DSNhPPBD#/jobs

【内推码】DSNhPPBD（内推简历优先筛选，', 1, '25bc8c732d97d039b4500567d5138a11', CURRENT_TIMESTAMP
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
  'smartsheet_0074_c3372f51', '雷赛智能', '制造业/机器人', '27届秋招', '["产品研发类","技术类","生产供应类","职能类"]', '["深圳","上海","苏州","济南","天津","郑州","东莞","温州","杭州","南京","合肥地"]',
  '产品研发类、技术类、生产供应类、职能类', 'DSevm4Ym', 'https://app.mokahr.com/m/campus_apply/leisai/146886?recommendCode=DSevm4Ym#/jobs', '2026-08-29T08:00:00.000Z', '招满即止', 'active',
  '雷赛智能2027校招启动！

【公司介绍】雷赛智能（上市企业 SZ.002979）是智能装备运动控制领域全球知名品牌和行业领军企业。深耕通用自动化和人形机器人两大千亿级市场。产品服务上万家设备厂商，远销美国、德国、印度等60多个国家

【热招岗位】产品研发类、技术类、生产供应类、职能类

【工作地点】深圳、上海、苏州、济南、天津、郑州、东莞、温州、杭州、南京、合肥等地

【内推通道】https://app.mokahr.com/m/campus_apply/leisai/146886?recommendCode=DSevm4Ym#/jobs

【内推码】DSevm4Ym（简历优先筛选，流程加速）', 1, 'c3372f51cfeccbe631948e489e429307', CURRENT_TIMESTAMP
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
  'smartsheet_0075_fa6bd73c', '商汤科技', 'AI', '27届秋招', '["AI大类（模型研究","AI","Infra","模型应用开发","FDE等）","研发大类（算法","测试","JAVA","AI相关","交付运维","后端","agent等）产品经理","采购","销售等"]', '["北京","上海","深圳"]',
  'AI大类（模型研究 AI Infra 模型应用开发 FDE等）、研发大类（算法 测试 JAVA AI相关 交付运维 后端 agent等）产品经理 、采购、销售等', 'J7274RB', 'https://sensetime.jobs.feishu.cn/s/stXkzWnf4BA', '2026-08-28T08:00:00.000Z', '招满即止', 'active',
  '商汤科技2027校招启动！

公司简介：成立于2014年，以“坚持原创，让AI引领人类进步”为使命。其核心业务围绕“AI大装置（算力基建）+大模型（算法）+应用”的全栈技术闭环展开，主要面向智慧城市、智能汽车、生成式AI、智慧商业、智慧医疗等多个行业提供AI解决方案。

招聘岗位：AI大类（模型研究 AI Infra 模型应用开发 FDE等）  研发大类（算法 测试 JAVA AI相关 交付运维 后端 agent等）产品经理 采购 销售等

工作地点：北京、上海、深圳等

【内推链接】
https://sensetime.jobs.feishu.cn/s/stXkzWnf4BA

【内推码】J7274RB（选择大使推荐，简历优先筛选）', 1, 'fa6bd73c76c10bbbdab4b91e61891433', CURRENT_TIMESTAMP
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
  'smartsheet_0076_bae475ec', '九牧集团', '服装', '27届秋招', '["营销","国际","研发","职能","供应链"]', '["厦门","泉州","上海","深圳"]',
  '营销、国际、研发、职能、供应链', 'DSj5yy53', 'https://app.mokahr.com/m/campus_apply/jomoo/142937?recommendCode=DSj5yy53#/jobs', '2026-08-28T08:00:00.000Z', '招满即止', 'active',
  '九牧集团2027届全球校园招聘正式启动！

五大体系：营销/国际/研发/职能/供应链，全面开放！

✈厦门/泉州/上海/深圳...超多热门base地任你挑！

投递链接🔗：https://app.mokahr.com/m/campus_apply/jomoo/142937?recommendCode=DSj5yy53#/jobs

内推码：DSj5yy53', 1, 'bae475ec34e24ff90a2f466e97f39795', CURRENT_TIMESTAMP
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
  'smartsheet_0077_fe254562', '酷睿程', '智能驾驶', '27届秋招', '["算法类","软件研发类","测试类等"]', '["北京","上海"]',
  '算法类、软件研发类、测试类等', 'Y2UTPSN', 'https://carizon.jobs.feishu.cn/s/BJFJF6mubIk', '2026-08-28T08:00:00.000Z', '招满即止', 'active',
  '酷睿程2027届秋招启动！
【公司介绍】年轻有潜力的硬科技公司，大众CARIAD与地平线合资智驾企业，项目量产落地，深耕前沿自动驾驶技术。

【招聘岗位】算法类、软件研发类、测试类等

【工作地点】北京、上海

【福利待遇】行业竞争力薪资、完善的培训成长体系、弹性工作、带薪年假、节日福利、良好的工作氛围、舒适办公环境 

【内推链接】https://carizon.jobs.feishu.cn/s/BJFJF6mubIk

【内推码】Y2UTPSN（推荐方式选择大使推荐，简历优先筛选）', 1, 'fe2545625f1f50dca3c9f08aa2c5d9f7', CURRENT_TIMESTAMP
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
  'smartsheet_0078_e6505253', '飞步科技', '人工智能/机器人', '27届秋招', '["大模型算法工程师","感知融合算法工程师","标定算法工程师","规控算法工程师","C++","开发工程师","全栈开发工程师"]', '["杭州"]',
  '大模型算法工程师、感知融合算法工程师、标定算法工程师、规控算法工程师、C++ 开发工程师、全栈开发工程师', 'DsfjgJg5', 'https://app.mokahr.com/campus-recruitment/fabu/56114?recommendCode=DSfjgJg5#/jobs', '2026-08-28T08:00:00.000Z', '招满即止', 'active',
  '🚀 飞步科技 2027 届校园招聘启动！

【公司介绍】飞步科技总部位于杭州，是国内前沿物理 AI企业、国家级专精特新 “小巨人”、国家高新技术企业。建成全球规模最大的无人集卡车队，业务落地新加坡、新西兰等海外港口。

重点招聘：
💻 算法研发类：大模型算法工程师、感知融合算法工程师、标定算法工程师、规控算法工程师
🖥 软件开发类：C++ 开发工程师、全栈开发工程师

工作地点：杭州

福利亮点：
▪高竞争力薪酬、多重项目 / 年度奖金、员工股权激励
▪五险一金，双边 12% 公积金
▪餐饮补贴、交通补贴、差旅补贴
▪超长假期、高效弹性工作制
▪节日福利、团建活动、咖啡饮品
▪大牛导师带教，深度参与核心项目实战

【内推链接】https://app.mokahr.com/campus-recruitment/fabu/56114?recommendCode=DSfjgJg5#/jobs

【内推码】DsfjgJg5（简历优先筛选，流程加速）', 1, 'e6505253308c49131116555de6ad6569', CURRENT_TIMESTAMP
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
  'smartsheet_0079_0e665358', '远景能源（夯）', '新能源', '27届秋招', '["研发","工艺","制造","产品","市场","供应链","质量管理","工程管理","综合类等140+岗位"]', '["遍布全国","海外包括东南亚","亚非","欧洲","美洲"]',
  '研发、工艺、制造、产品、市场、供应链、质量管理、工程管理、综合类等140+岗位', 'DSWw6kDD', 'https://app.mokahr.com/m/campus_apply/envisiongroup/182094?recommendCode=DSWw6kDD#/jobs', '2026-08-27T08:00:00.000Z', '招满即止', 'active',
  '远景能源2027秋招正式启动！13大类别，140+岗位职等你来！

【公司简介】
✅远景能源是全球领先的智能风电、智慧储能系统和绿氢解决方案公司；
✅《时代》周刊评选的“全球100家最具影响力企业”；
✅在全球设立超20个运营总部和研发中心、拥有超60个制造基地！

【招聘岗位】研发、工艺、制造、产品、市场、供应链、质量管理、工程管理、综合类等140+岗位职等你来！

【工作地点】遍布全国，海外包括东南亚、亚非、欧洲、美洲等

【福利】落户支持、补充公积金、商业保险、利润分享、食堂、下午茶、健身房、年假十天起超多福利等你来解锁！

【内推链接】
https://app.mokahr.com/m/campus_apply/envisiongroup/182094?recommendCode=DSWw6kDD#/jobs

【推荐码】DSWw6kDD（内推投递，简历优先筛选，面试流程加快！后续有流程问题欢迎随时联系！）', 1, '0e665358818e8fad6be516a2f0a2a7f2', CURRENT_TIMESTAMP
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
  'smartsheet_0080_fd25dd98', '途游游戏', '游戏', '27届秋招/日常实习', '["产品类","运营类","技术类","美术类","发行类"]', '["北京","上海","广州","深圳","长沙","武汉","成都","香港","新加坡"]',
  '产品类、运营类、技术类、美术类、发行类', 'DSPMMknC', 'https://app.mokahr.com/m/campus_apply/tuyoogame/71965?recommendCode=DSPMMknC&hash=%23%2Fjobs#/jobs', '2026-08-26T08:00:00.000Z', '招满即止', 'active',
  '途游2027届校招启动！【专业不限｜500+hc】

关于途游：服务全球十余亿用户，拥有1500+研运团队，集研发、运营、发行于一体，拥有多项自主研发专利和数字智能技术，已在全球多地设立办公室

5大类别｜500+校校hc：产品类、运营类、技术类、美术类、发行类

工作地点：北京、上海、广州、深圳、长沙、武汉、成都、香港、新加坡

薪酬福利：六险一金、各岗位平均综合薪酬18-30k/月，北京户口机会，13-16薪，校招签字费、半年度晋升机会、丰厚年终奖、房补、餐补、免费打车、免费零食饮料、健身房等福利

【内推链接】https://app.mokahr.com/m/campus_apply/tuyoogame/146219?recommendCode=DSSbMyEw#/jobs

【内推码】DSSbMyEw（内推简历优先筛选，早投递早拿offer）', 1, 'fd25dd98d2b9bae9f837ba1c6f0f82db', CURRENT_TIMESTAMP
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
  'smartsheet_0081_cccec797', '海尔集团', '消费电子', '27届秋招', '["硬件研发类","软件研发类","算法类","智能制造类","海外市场类","市场营销&服务类","职能类","设计类","教育类","智慧物流类","金融投资类","GEDP类","MEDP类","GMTP类","DMAP类","智领生类","博士类"]', '["全国"]',
  '硬件研发类、软件研发类、算法类、智能制造类、海外市场类、市场营销&服务类、职能类 、设计类、教育类、智慧物流类、金融投资类、GEDP类、MEDP类 、GMTP类、DMAP类、智领生类、博士类', 'GHJ237（在投递信息栏→职位获取途来源→“未来规划局推荐”→推荐信息填写GHJ237）；若使用手机通过左方内推链接投递，自动计入内推，则无需填写内推码', 'https://maker.haier.net/client/campusmobile/activity/id/68/fid.html?inviter_code=YW1VU3lUa2V5Vms9', '2026-08-26T08:00:00.000Z', '招满即止', 'active',
  '世界500强-海尔集团2027届校园招聘启动！

【了解海尔】
七家上市公司：海尔智家、雷神科技	、海尔生物、盈康生命、上海莱士、新时达、众淼控股
三大生态：智慧住居生态、大健康产业生态	、数字经济产业生态	

【招聘岗位】硬件研发类、软件研发类、算法类、智能制造类、海外市场类、市场营销&服务类、职能类 、设计类、教育类、智慧物流类、金融投资类、GEDP类、MEDP类 、GMTP类、DMAP类、智领生类、博士类

【薪酬福利】世界500强顶尖平台+有竞争力的薪资水平+5大类福利保障超乎想象+大咖导师保驾护航

【推荐码】GHJ237（在投递信息栏→职位获取途来源→“未来规划局推荐”→推荐信息填写GHJ237）

【移动端内推链接】
https://maker.haier.net/client/campusmobile/activity/id/68/fid.html?inviter_code=YW1VU3lUa2V5Vms9
使用手机通过上方内推链接投递，自动计入内推，无需填写内推码，内推简历优先筛选，面试流程更快！', 1, 'cccec79774cbe91a3303e2c0a8fbbff7', CURRENT_TIMESTAMP
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
  'smartsheet_0082_a9f77893', '姚品国际（hc多）', '快消', '27届秋招/往届可投', '["渠道管培生（专业不限）"]', '["全国"]',
  '渠道管培生（专业不限）', 'DSBvS2Q3', 'https://app.mokahr.com/m/campus_apply/ypgj/164305?recommendCode=DSBvS2Q3#/jobs', '2026-08-26T08:00:00.000Z', '招满即止', 'active',
  '🔥姚品国际2027渠道管培生热招｜潮玩TCG赛道高薪管培，年包15-30W！

深耕潮玩、TCG卡牌热门年轻消费赛道，不做基础销售，定向培养区域渠道负责人！

【招聘要求】
26/27届本科及以上，沟通力强、自驱力拉满，能接受出差；
潮玩/零售/快消爱好者优先，学生干部、市场销售实习经历加分！

【工作城市】上海、北京、广深、南京、武汉、长沙、西安、合肥、大连、川渝、东北多区域可选

高薪成长双通道，想深耕消费赛道、独立操盘区域业务的同学速投！

【网申链接】https://app.mokahr.com/m/campus_apply/ypgj/164305?recommendCode=DSBvS2Q3#/jobs

【内推码】DSBvS2Q3（内推简历优先筛选，面试流程加快）', 1, 'a9f77893a222e5ee96b8ae33ed4d4bd7', CURRENT_TIMESTAMP
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
  'smartsheet_0083_b15e11ad', '华宝新能', '新能源', '27届秋招', '["研发管培生","营销管培生","供应链管培生"]', '["深圳","东京","首尔","加利福尼亚","杜塞尔多夫"]',
  '研发管培生、营销管培生、供应链管培生', 'EVKPTH', 'https://career.hello-tech.com/campus/jobs?shareId=7ca7ae1e-3730-404c-8a1f-4860075bf55b&shareSource=2', '2026-08-27T08:00:00.000Z', '招满即止', 'active',
  '【公司介绍】2022年在中国创业板挂牌上市，成为“便携储能第一股”，产品覆盖50+国家和地区，线下零售门店10000+，全球海内外员工2600+

【招聘岗位】研发管培生、营销管培生、供应链管培生

【工作地点】深圳、东京、首尔、加利福尼亚、杜塞尔多夫

【福利待遇】行业内部具竞争力的起薪、住房补贴	、宵夜补贴	、人才房	、滴滴打车	、弹性打卡、高频下午茶	、舒阔办公区等等

【内推链接】https://career.hello-tech.com/campus/jobs?shareId=7ca7ae1e-3730-404c-8a1f-4860075bf55b&shareSource=2

【内推码】EVKPTH（内推简历优先筛选）', 1, 'b15e11ad003442361ea76f25eb1aac04', CURRENT_TIMESTAMP
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
  'smartsheet_0084_4e80a90a', '卓越教育', '教培', '27届秋招/往届可投', '["小初高素质教师","民办学校教师","营运岗","人工智能岗等"]', '["广州","深圳","佛山","东莞","中山","珠海","肇庆","武汉"]',
  '小初高素质教师、民办学校教师、营运岗、人工智能岗等', 'eljzlc', 'https://wecruit.hotjob.cn/SU63366959bef57c270741e2c6/mc/position/campus?acotycoCode=eljzlc&recruitType=1&isLimitShowPostScope=0', '2026-08-26T08:00:00.000Z', '招满即止', 'active',
  '卓越教育2027校园招聘启动！

🙅不限专业，不限教资，不限经验，往届可投！
📥【招聘岗位】小初高素质教师、民办学校教师、营运岗、人工智能岗等
💰【薪酬待遇】首年10-35万，每年多次调薪机会
📍【工作地点】广州、深圳、佛山、东莞、中山、珠海、肇庆、武汉
🧧【卓越福利】六险一金、双休+8小时工作制、住房补贴、国内外团建等等

【关于卓越教育】
卓越教育成立于1997年，2018年在香港主板挂牌上市，深耕华南地区27年，大湾区知名教育科技集团，集团旗下拥有素质教育、职业教育、全日制学校等多元业务。

【内推链接】
https://wecruit.hotjob.cn/SU63366959bef57c270741e2c6/mc/position/campus?acotycoCode=eljzlc&recruitType=1&isLimitShowPostScope=0

【内推码】eljzlc（简历优先筛选，面试流程更快！）', 1, '4e80a90a3f918ddcaed6e1ee17a5e6e9', CURRENT_TIMESTAMP
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
  'smartsheet_0085_4def57ee', '奥克斯集团', '消费电子', '27届秋招', '["研发","算法","软硬件","内外销","技术营销","供应链","人力","财务","法务等17+大类职类"]', '["宁波","西安","武汉","杭州","南京","上海","郑州30+城市"]',
  '研发、算法、软硬件、内外销、技术营销、供应链、人力、财务、法务等17+大类职类', 'EVVM8K', 'https://auxgroup.zhiye.com/campus/jobs?shareId=3b4331b1-27bd-47d5-a0c6-829537ca5783&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-08-27T08:00:00.000Z', '招满即止', 'active',
  '📢奥克斯集团｜2027届校园招聘正式启动

中国500强企业，布局空调、新能源、智算、医疗等多赛道，面向27届本硕博应届生开放投递（海外毕业时间：26.9-27.6）

✅开放岗位：研发、算法、软硬件、内外销、技术营销、供应链、人力、财务、法务等17+大类职类
📍宣讲覆盖：宁波、西安、武汉、杭州、南京、上海、郑州等30+城市
⏰网申时间：即日起—12.31
📮投递入口：https://auxgroup.zhiye.com/campus/jobs?shareId=3b4331b1-27bd-47d5-a0c6-829537ca5783&shareSource=2&qr=1&memory=%7B%7D&silence=1
【内推码】：EVVM8K（优先筛选简历）

📌招聘流程：网申→笔试→AI测评→面试→发放offer

💡投递小贴士：使用内推码投递可优先筛选简历', 1, '4def57eeb8a58a62b49af167ba175b61', CURRENT_TIMESTAMP
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
  'smartsheet_0086_fb3b8a4c', '扬腾创新', '跨境电商/制造业', '27届秋招', '["算法","战略","供应链","运营","技术研发等"]', '["福州","杭州","北京","深圳","香港","美国","德国地"]',
  '算法、战略、供应链、运营、技术研发等', 'ES3MVT', 'https://cht-group3.zhiye.com/campus/jobs?shareId=011e70e3-71db-47c6-816d-382f8779f9a4&shareSource=2', '2026-08-27T08:00:00.000Z', '招满即止', 'active',
  '扬腾创新2027届精英计划｜百万年薪，不限专业，全球布局

万亿美金汽配赛道，覆盖全球超40个国家，数智驱动的全球汽配领军企业，等你加入！

算法/战略/供应链/运营/技术研发等多序列开放，等你来拿offer！

✅ 顶尖人才年薪可达100W  
✅ 专属导师带教+双通道晋升（管理/专家）  
✅ 六险一金、人才补贴、低价人才公寓、年终奖丰厚  
✅ 全球业务布局，成长空间不设限

工作地点：福州、杭州、北京、深圳、香港、美国、德国等地

2027届全球毕业生，不限专业背景，即刻投递！
【内推链接】https://cht-group3.zhiye.com/campus/jobs?shareId=011e70e3-71db-47c6-816d-382f8779f9a4&shareSource=2

【内推码】ES3MVT（简历优先筛选，流程加速！）', 1, 'fb3b8a4c7c1ec1cd2f56e601671ee5b2', CURRENT_TIMESTAMP
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
  'smartsheet_0087_076193be', '三一集团', '制造业', '27届秋招', '["研发技术","计算机及AI","生产制造","营销服务","商务采购","财务金融","综合管理等"]', '["北京","上海","长沙及巴西","韩国海外城市"]',
  '研发技术、计算机及AI、生产制造、营销服务、商务采购、财务金融、综合管理等', 'ESKMBS', 'https://sanycampus.zhiye.com/campus/jobs?shareId=0f1f4dfe-9eb1-4d80-9a35-8d8b4d42d392&shareSource=2', '2026-08-26T08:00:00.000Z', '招满即止', 'active',
  '🌍平台够大：世界500强，业务遍及全球180+国家和地区，海外设有5大研发制造基地
🔥岗位够多：研发技术、计算机及AI、生产制造、营销服务、商务采购、财务金融、综合管理等7大职类开放招聘
🤖方向够新：智能制造、新能源、AI、数智化、全球化等方向都有机会
💰待遇有竞争力：不设限的薪酬激励+完善的薪酬福利体系+清晰的成长发展通道
🎓面向2027届毕业生：不同专业背景都有机会找到适合自己的岗位
内推通道：https://sanycampus.zhiye.com/campus/jobs?shareId=0f1f4dfe-9eb1-4d80-9a35-8d8b4d42d392&shareSource=2
【内推码】ESKMBS（简历优先筛选，流程加速）', 1, '076193be7c1ff989c3149947e593d66f', CURRENT_TIMESTAMP
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
  'smartsheet_0088_612aaf88', '库洛游戏', '游戏', '27届秋招/日常实习', '["策划类","技术类","美术类","营销类","职能类","音频类","运营类","项管类"]', '["广州","上海"]',
  '策划类、技术类、美术类、营销类、职能类、音频类、运营类、项管类', 'YQ6RU5W', 'https://kurogame.jobs.feishu.cn/s/ELc2Pzi-dS0', '2026-08-25T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】库洛游戏总部位于广州，致力打造优质的互动娱乐体验。旗下在营产品包括《战双帕弥什》、《鸣潮》以及游戏IP衍生产品，海外发行覆盖日韩、东南亚、欧美等国家或区域。

【招聘岗位】八大职类，70+个岗位。包括策划类	、技术类	、美术类	、营销类、音频类、职能类、	运营类	、项管类，专业不限，需求量大，通过率高！

【工作地点】广州、上海

【福利待遇】行业竞争力的薪酬，超nice工作氛围，超浓郁二次元化！

【内推链接】
https://kurogame.jobs.feishu.cn/s/oqWyk8uhOiA

【内推码】YQ6RU5W（推荐方式选择大使推荐，简历优先筛选）', 1, '612aaf88762d7125ba90a882b2d5880a', CURRENT_TIMESTAMP
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
  'smartsheet_0089_244d87ae', '极致游戏', '游戏', '27届秋招', '["游戏策划","产品","用户研究"]', '["厦门","成都"]',
  '游戏策划、产品、用户研究', 'RTJY3UV', 'https://jzyxgames.jobs.feishu.cn/s/GTyw0M28b-E', '2026-08-25T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】研运一体实力派，16年深耕游戏赛道，新三板挂牌企业，多款流水过亿爆款傍身，海外市场全面开花，国家高新技术企业、文化出口重点企业等多项荣誉加身。
 
【招聘岗位】游戏策划、产品、用户研究

【工作地点】厦门、成都
 
【福利保障】每年两次调薪机会+高额年终奖，六险一金（公积金最高比例），年假最高18天，下午茶、每月观影、缤纷俱乐部与团建，工作生活两不误

【内推链接】
https://jzyxgames.jobs.feishu.cn/s/GTyw0M28b-E

【内推码】RTJY3UV（推荐方式选择大使推荐，内推简历优先筛选）', 1, '244d87aea0a3882058c289aaf98bf545', CURRENT_TIMESTAMP
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
  'smartsheet_0090_978c4845', '嘉士伯', '快消', '27届秋招/日常实习', '["商务管理培训生","供应链管理培训生","职能管培生"]', '["广州","成都","重庆","昆明全国多地"]',
  '商务管理培训生/供应链管理培训生/职能管培生', 'DShMaUDS', 'https://app.mokahr.com/m/campus_apply/carlsberg/37541?recommendCode=DShMaUDS&hash=%23%2Fjobs#/jobs', '2026-08-25T08:00:00.000Z', '招满即止', 'active',
  '关于我们：嘉士伯集团是全球三大啤酒公司之一，创建于1847年，旗下180多个品牌畅销于全球150个市场。嘉士伯中国运营着由27个酒厂组成的生产供应网络和覆盖中国各省区市的市场销售网络，员工数量近7000人。

【校招项目】
商务管理培训生/供应链管理培训生

工作地点：广州、成都、重庆、昆明等全国多地

我们提供：有竞争力的薪酬待遇、外企多元福利、年终奖金、六险一金、带薪年假、年度体检、女性友好专属福利、福利酒水 Happy Hour、生日派对、节日福利、导师带教、集团内职业发展机会丰富学习资源、轮岗趣游职场等

内推链接：
https://app.mokahr.com/m/campus_apply/carlsberg/37541?recommendCode=DShMaUDS&hash=%23%2Fjobs#/jobs

内推码：DShMaUDS（简历优先筛选，后续有流程上的问题欢迎随时联系）', 1, '978c484594acc48a8ea57b2e25758763', CURRENT_TIMESTAMP
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
  'smartsheet_0091_be02c495', '九号公司', '新能源', '27届秋招/往届可投', '["技术研发类","设计类","产品类","营销类","供应链类","服务类","质量类","生产制造类","职能类"]', '["常州","北京","上海","深圳","杭州","珠海"]',
  '技术研发类、设计类、产品类、营销类、供应链类、服务类、质量类、生产制造类、职能类', 'DSknaq5k', 'https://app.mokahr.com/m/campus_apply/ninebot/45627?recommendCode=DSknaq5k#/jobs', '2026-08-26T08:00:00.000Z', '招满即止', 'active',
  '26-27届可投！九号公司2027届校园招聘全面启动！
 国际化智能短交通与机器人企业，2020年科创板上市（VIE+CDR第一股），员工超4000人，遍布30+国家。
【招聘岗位】
🈶技术研发类、设计类、产品类、营销类、供应链类、服务类、质量类、生产制造类、职能类9大类岗位任你挑选！

【工作地点】
常州、北京、上海、深圳、杭州、珠海

 🔈26届可投，不限制岗位投递数量，加入九号，快速起步！

内推链接：https://app.mokahr.com/m/campus_apply/ninebot/45627?recommendCode=DSknaq5k#/jobs

🎯内推码：DSknaq5k
（使用内推码投递，简历优先筛选）', 1, 'be02c4955d18f4a4798d1c6dfd7747b4', CURRENT_TIMESTAMP
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
  'smartsheet_0092_30a8a1ac', '蔚来', '汽车', '27届秋招', '["数字技术类","工程技术类","动力电池类","产品类","项目管理类","用户与服务类","设计类","职能与支持类"]', '["上海","北京","深圳","南京","合肥","武汉60+城市"]',
  '数字技术类、工程技术类、动力电池类、产品类、项目管理类、用户与服务类、设计类、职能与支持类', '36M7YH5', 'https://nio.jobs.feishu.cn/s/LeR2d-HQHZY', '2026-08-25T08:00:00.000Z', '招满即止', 'active',
  '蔚来2027届校园招聘正式启动！

在前沿科技的浪潮中并肩成长
一起创造可持续和更美好的未来
我们期待每一位心怀热忱的你，来加入

【招聘岗位】数字技术类、工程技术类、动力电池类、产品类、项目管理类、用户与服务类、设计类、职能与支持类

【内推链接】https://nio.jobs.feishu.cn/s/LeR2d-HQHZY

【内推码】36M7YH5
内推简历优先筛选，进程跟进', 1, '30a8a1ac0d9fa3e17861e4c99062769a', CURRENT_TIMESTAMP
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
  'smartsheet_0093_c180415e', '昂科技术', '芯片半导体', '27届秋招', '["硬件研发类","软件研发类","算法类","机械结构类","电气与自动化类","支持类","营销","市场类","供应链","生产运营类等"]', '["深圳（总部）","上海","成都","苏州（昆山）"]',
  '硬件研发类、软件研发类、算法类、机械结构类、电气与自动化类、支持类、营销/市场类、供应链/生产运营类等', 'ACHU271XX（网申时务必在-基本信息-内推码一栏填写，内推简历优先筛选，面试优先安排！）', 'https://s.51job.com/2vSIuH', '2026-08-25T08:00:00.000Z', '招满即止', 'active',
  '公司简介：昂科技术是全球领先半导体烧录与测试设备供应商。聚焦芯片烧录、老化测试等领域。拥有1000+全球行业头部客户，半导体TOP100企业中90%为合作伙伴，服务超80%全球500强电子企业

招聘岗位：硬件研发类、软件研发类、算法类、机械结构类、电气与自动化类、支持类、营销/市场类、供应链/生产运营类等

工作地点：深圳（总部）、上海、成都、苏州（昆山）

为什么选择昂科：半导体国产替代风口，IPO筹备中，发展前景好；可参与核心项目，Leader+HR双导师带教；有竞争力薪资，享有股权激励计划；校招专属人才补贴

【网申链接】https://s.51job.com/2vSIuH

【内推码】ACHU271XX
网申时务必在-基本信息-内推码一栏填写ACHU271XX，内推简历优先筛选，面试优先安排！', 1, 'c180415e0a39eab8e6b086af0989b920', CURRENT_TIMESTAMP
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
  'smartsheet_0094_588c58b6', '科华集团', '新能源', '27届秋招', '["英才类","产品研发类","营销类","供应链类","职能类"]', '["厦门","漳州","深圳","全国各省会城市","海外各区域"]',
  '英才类、产品研发类、营销类、供应链类、职能类', 'DSYkEB8U', 'https://app.mokahr.com/m/campus_apply/kehua/92510?recommendCode=DSYkEB8U&hash=%23%2Fjobs#/jobs', '2026-08-24T08:00:00.000Z', '招满即止', 'active',
  '【关于我们】创立于1988年，总部位于厦门，清洁能源、数据中心、高端电源三大业务矩阵，行业首家上市公司，全球拥有80多个办事处及网络服务点，服务全球100多个国家和地区客户，荣获中国最佳雇主奖，连续11年全球新能源企业500强

【岗位类别】英才类、产品研发类、营销类、供应链类、职能类

【工作地点】厦门、漳州、深圳

【薪酬福利】
✅多元薪酬，行业领先，每年两次5-20%调薪机会
✅七险一金+人才公寓+下午茶+健身房+免费班车+自助食堂
✅入职礼+生日礼+司龄礼+节日礼+优惠购房+政府补贴等36项福利

【简历优先筛选通道】
https://app.mokahr.com/m/campus_apply/kehua/92510?recommendCode=DSYkEB8U&hash=%23%2Fjobs#/jobs

【内推码】DSYkEB8U（内推投递即刻获得简历优先筛选资格！）', 1, '588c58b61de8988e6addac4326ca65d0', CURRENT_TIMESTAMP
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
  'smartsheet_0095_2ee0a0c4', '宁德时代', '新能源', '27届秋招', '["研发与工程类","质量类","计算机与AI类","市场类","职能类","供应链与运营类"]', '["福建宁德(总部)","福建福州","福建厦门","上海","香港","贵州贵阳","山东济宁","江西宜春","广东肇庆","四川宜宾","四川成都","河南洛阳"]',
  '研发与工程类、质量类、计算机与AI类、市场类、职能类、供应链与运营类', 'DSa2uJtx', 'https://app.mokahr.com/m/campus-recruitment/catlhr/148948?recommendCode=DSa2uJtx#/jobs', '2026-08-24T08:00:00.000Z', '招满即止', 'active',
  '宁德时代2027届全球校园招聘正式启动！ 
🖇️6大类岗位，50+部门，3次志愿机会，6000+offer海量加码！
【宁德时代】
🌟全球领先的新能源创新科技公司
✅深交所+港交所两地上市
🚀锂电行业唯一世界 500 强
✨央视《大国重器》两度报道
🎯多元业务覆盖海陆空，布局储充检、换电新生态
🗺️全球已设立六大研发中心及十五大生产基地
🥇SNE Research认证动力电池使用量、储能电池出货量双第一

💻招聘流程：网申投递- AI面试-测评-专业面试-Offer发放

🏫宣讲行程将于9月启动！尽请关注！

【网申地址】https://app.mokahr.com/m/campus-recruitment/catlhr/148948?recommendCode=DSa2uJtx#/jobs

【内推码】DSa2uJtx', 1, '2ee0a0c41e386505231ad974eb49d667', CURRENT_TIMESTAMP
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
  'smartsheet_0096_64ef9412', '博众精工', '科技', '27届秋招', '["软件类","机械类","电气类","质量类","采购类","职能类","管培类等"]', '["苏州","上海","长沙"]',
  '软件类、机械类、	电气类、质量类、	采购类、职能类	、管培类等', 'ESVPRS', 'https://bozhon3.zhiye.com/campus/jobs?shareId=0becf12e-5695-4a8b-8b10-7aec11a590a6&shareSource=2', '2026-08-24T08:00:00.000Z', '招满即止', 'active',
  '公司简介：博众精工（688097）科创板上市企业，聚焦新能源、半导体、智能装备赛道

招聘岗位：软件类	、机械类、	电气类		、质量类、	采购类	、职能类	、管培类等

培养&福利：博众新星训练营，导师带教，技术/管理双向晋升通道；园林化工作环境、免费宿舍、园区食堂、带薪年假等

【工作地点】苏州、上海、长沙

【内推链接】https://bozhon3.zhiye.com/campus/jobs?shareId=0becf12e-5695-4a8b-8b10-7aec11a590a6&shareSource=2

【内推码】ESVPRS(内推简历优先筛选)', 1, '64ef94122c7d8c8b118c5d208dcd01fc', CURRENT_TIMESTAMP
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
  'smartsheet_0097_99ac7ea5', 'TCL华星光电', '制造业', '27届秋招', '["研发类","制造类","职能类等"]', '["深圳","武汉","惠州","苏州","广州","美国","新加坡","日本","韩国","印度"]',
  '研发类，制造类，职能类等', 'bjkxay', 'https://wecruit.hotjob.cn/SU6491506a2f9d24316e91b81b/mc/position/campus?acotycoCode=bjkxay&orgId=100801%2C104101&projectId=308501&recruitType=1&isLimitShowPostScope=1', '2026-08-23T08:00:00.000Z', '招满即止', 'active',
  '【关于华星】
🖥全球半导体显示龙头之一，总投资额超2600亿元，员工4万+
🖥国家级半导体显示高新技术企业，多产品全球市占率第一
🖥产品覆盖电视、手机、笔记本等全类型显示

【招聘岗位】
✅研发类，制造类，职能类等等，职等你来！

【招聘亮点】
✅本、硕、博专业全面覆盖
✅福利宿舍/食堂餐补/免费班车/带薪病假/员工社团/免费健身房...30余种福利等你来！

【工作地点】
📍深圳、武汉、惠州、苏州、广州
📍美国、新加坡、日本、韩国、印度

【内推链接】
https://wecruit.hotjob.cn/SU6491506a2f9d24316e91b81b/mc/position/campus?acotycoCode=bjkxay&orgId=100801%2C104101&projectId=308501&recruitType=1&isLimitShowPostScope=1

【内推码】bjkxay（使用内推码或者内推链接投递，内推简历优先安排面试！）', 1, '99ac7ea5f94170091ca61da15f81ac08', CURRENT_TIMESTAMP
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
  'smartsheet_0098_d5fa63f0', 'TCL实业', '制造业', '27届秋招', '["技术研发类","产品设计类","市场营销类","智能制造类","供应链类","财务金融类","综合管理类等"]', '["深圳","惠州","中山","上海","武汉","西安全国各地及海外城市"]',
  '技术研发类、产品设计类、市场营销类、智能制造类、供应链类、财务金融类、综合管理类等', 'abvfcz', 'https://actyco.wintalent.cn/actyco/home/receiver/poster/redirect?id=2ce781f69fb84c0101a03349ffe7273d', '2026-08-23T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】聚焦智能终端业务，主要涵盖显示、智能家电、创新业务及家庭互联网等全品类智能消费电子产品及服务，业务遍及160多个国家和地区，全球有20个智能制造基地，2023年，TCL实业实现营业总收入1203.2亿元

【招聘岗位类别】技术研发类、产品设计类、市场营销类、智能制造类、供应链类、财务金融类、综合管理类等等

【工作地点】深圳、惠州、中山、上海、武汉、西安等全国各地及海外城市

划重点：TCL实业和TCL华星共用招聘系统，两家子公司一共只能投递两个岗位！

【内推链接】https://actyco.wintalent.cn/actyco/home/receiver/poster/redirect?id=2ce781f69fb84c0101a03349ffe7273d

【内推码】abvfcz（内推投递，简历优先筛选！）', 1, 'd5fa63f08202bb67e4fe8b1d1428ed48', CURRENT_TIMESTAMP
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
  'smartsheet_0099_024e2129', '电科金仓', '科技', '27届秋招', '["C语言研发工程师","JAVA开发工程师","前端开发工程师","测试工程师","售前工程师","销售管培生"]', '["北京","上海","天津","成都","青岛","西安"]',
  'C语言研发工程师、JAVA开发工程师、前端开发工程师、测试工程师、售前工程师、销售管培生', 'DSRUBmAA', 'https://app.mokahr.com/m/campus_apply/kingbase/47259?recommendCode=DSRUBmAA&hash=%23%2Fjobs#/jobs', '2026-08-23T08:00:00.000Z', '招满即止', 'active',
  '央企背景-电科金仓2027校园招聘启动！

【公司简介】
中电科金仓（北京）科技股份有限公司1999年成立，是中国电子科技集团成员企业，专注数据库领域20余年，核心产品金仓数据库管理系统KingbaseES具备国际先进水平。

【在招岗位】C语言研发工程师、JAVA开发工程师、前端开发工程师、测试工程师、售前工程师、销售管培生

【工作地点】
北京、上海、天津、成都、青岛、西安等

【内推链接】
https://app.mokahr.com/m/campus_apply/kingbase/47259?recommendCode=DSRUBmAA&hash=%23%2Fjobs#/jobs

【内推码】DSRUBmAA

央企背景、前景广阔、待遇优厚、培训完善、新人友好、技术有深度、稳定且成长空间大！期待您的到来！', 1, '024e2129647226eb55e3639a9404c881', CURRENT_TIMESTAMP
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
  'smartsheet_0100_9bfef84c', '荣耀HONOR', '手机', '27届秋招', '["产品与设计","研发","财经","法务","公共关系","人力资源","营销","采购","审计","流程IT与质量运营","供应链"]', '["工作地点：深圳","北京","南京","上海","西安","部分非研发岗位全球派遣"]',
  '产品与设计、研发、财经、法务、公共关系、人力资源、营销、采购、审计、流程IT与质量运营、供应链', 'adaidh', 'https://career.honor.com/SU60ee9e002f9d247b98da489e/mc/position/campus?acotycoCode=adaidh&projectId=101401%2C101601%2C101801%2C101901&recruitType=1&isLimitShowPostScope=1', '2026-08-23T08:00:00.000Z', '招满即止', 'active',
  '荣耀2027届全球校招正式启动！
本硕博岗位全面开放，8大职位类别海量岗位虚位以待！
包含大模型算法、机器人感知、AIGC图像视频、系统研发、软件开发、测试、大数据、多模态算法等研发岗位
📍工作地点：北京｜上海｜深圳｜南京｜西安
岗位持续上新，抓紧投递！

✅内推码：adaidh
🔗投递链接：https://actyco.wintalent.cn/actyco/home/receiver/poster/redirect?id=2ce781e59d2f6aaa019d8ed4b4fa0678', 1, '9bfef84c8ae4dc40494d42314d28cd43', CURRENT_TIMESTAMP
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
  'smartsheet_0101_10544a8a', 'TP-Link联洲', '制造业', '27届秋招', '["研发类","营销类","产品类","设计类","制造类","供应链类","财务类","行政类","人力资源类","hc充足！"]', '["深圳","上海","成都","东莞","海外"]',
  '研发类 、营销类 、产品类、设计类、 制造类、 供应链类、财务类 、行政类、人力资源类，hc充足！', 'EZKRB9', 'https://join.tplinkglobal.com:443/share/jobs?share_id=2091011259323105282&share_type=ck', '2026-08-21T08:00:00.000Z', '招满即止', 'active',
  '企业介绍：TP-Link是涉足消费网络、消费电子、商用网络、商用安防、运营商网络、软件和云服务等领域的全球性跨国集团,致力于为全球170多个国家和地区,累计超20亿用户,提供高品质、高可靠、高性能的产品体验。

九大类岗位全面开放：
研发类 、营销类 、产品类、设计类、 制造类、 供应链类、财务类 、行政类、人力资源类，hc充足！

薪资福利：超高薪酬＋丰厚年终＋固定调薪窗口+年度体检＋健身游泳+节日红包＋产品折扣＋丰富礼品，超多福利等你解锁！

工作地点：深圳、上海、成都、东莞、海外

专属内推通道:
https://join.tplinkglobal.com:443/share/jobs?share_id=2091011259323105282&share_type=ck

【推荐码】EZKRB9（内推简历全程点亮，优先处理）', 1, '10544a8aa02b64f5fa5ebad8c1dda778', CURRENT_TIMESTAMP
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
  'smartsheet_0102_f1ed610b', 'TP-LINK', '制造业', '27届秋招', '["软件类","技术市场类","市场营销类","制造类","人事行政类","供应链计划类","采购类","财务类"]', '["深圳","杭州","北京","南京","东莞"]',
  '软件类，技术市场类，市场营销类，制造类，人事行政类，供应链计划类，采购类，财务类', 'XYDS015【在提交简历前的最后一栏“TP内推码”中填写】', 'http://hr.tp-link.com.cn', '2026-08-21T08:00:00.000Z', '招满即止', 'active',
  '企业介绍：TP-LINK (普联)是领先的ICT设备与解决方案供应商。自1996年成立以来，我们提供的海量设备已服务千行百业、千家万户，用以构建万物互联的世界。

招聘岗位：软件类，技术市场类，市场营销类，制造类，人事行政类，供应链计划类，采购类，财务类

工作地点：深圳，杭州，北京，南京，东莞等

投递链接：http://hr.tp-link.com.cn

内推码：XYDS015（在提交简历前的最后一栏“TP内推码”中填写，内推简历优先筛选，后续有疑问/流程问题欢迎联系）', 1, 'f1ed610b0feccd07d15c64e8494821ea', CURRENT_TIMESTAMP
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
  'smartsheet_0103_f6bf1f12', '轻舟智航', '智能驾驶', '27届秋招', '["算法类｜工程类｜产品项目类"]', '["北京","苏州"]',
  '算法类｜工程类｜产品项目类', 'MWTTW2R', 'https://qcraft.jobs.feishu.cn/s/11tH8fCyewY', '2026-08-22T08:00:00.000Z', '招满即止', 'active',
  '【关于轻舟智航】由国内唯一拥有Waymo背景的团队创立，是全球领先的从无人驾驶向通用物理AI迈进的公司。在L2++领域，乘用车辅助驾驶搭载量超过100万台，覆盖约40款车型，稳居第一梯队；在L4领域，Robovan、Robotaxi、Robobus等场景均建立起行业领先的量产落地优势

【招聘岗位】
算法类｜工程类｜产品项目类等多个方向开放招聘

【工作地点】北京、苏州

【内推链接】https://qcraft.jobs.feishu.cn/s/11tH8fCyewY

【内推码】MWTTW2R
（选择大使推荐，优先筛选）', 1, 'f6bf1f12fd1d377b728ba77c420cec82', CURRENT_TIMESTAMP
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
  'smartsheet_0104_6138bd4f', '禾迈股份', '新能源', '27届秋招', '["研发类"]', '["杭州","苏州"]',
  '研发类', 'DSB5dfpS', 'https://app.mokahr.com/m/campus_apply/hoymiles/70377?recommendCode=DSB5dfpS#/jobs', '2026-08-21T08:00:00.000Z', '招满即止', 'active',
  '✅企业背书：科创板上市微逆龙头，光储双增长曲线，百亿市值，产品覆盖190+国家和地区

招聘岗位：研发/产品/智能制造/市场营销全面开放

工作地点：杭州·苏州·成都·海宁·丽水｜拉美·欧洲·亚太·中东非

福利满满：员工宿舍、通勤班车、餐费补贴、交通补贴、通讯补贴等

【内推链接】https://app.mokahr.com/m/campus_apply/hoymiles/70377?recommendCode=DSpptKY2#/jobs

【内推码】DSpptKY2（内推简历优先，后续流程问题欢迎联系）', 1, '6138bd4fa92e5efbe2435875fe8a3106', CURRENT_TIMESTAMP
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
  'smartsheet_0105_ec4b6288', '康冠科技', '制造业', '27届秋招', '["算法类","软件类","硬件类","结构光学类","设计类","技术类","职能类等"]', '["深圳","惠州"]',
  '算法类、软件类、硬件类、结构光学类、设计类、技术类、职能类等', 'ESVP1R', 'https://careerktc.zhiye.com/campus/jobs?shareId=dd8023db-f2ca-4df9-b751-3e43149be167&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-08-21T08:00:00.000Z', '招满即止', 'active',
  '✅成立于1995年(股票代码:001308)，是一家全球性平板显示解决方案服务商
✅员工规模超7,000名，业务遍及全球170多个国家和地区
✅拥有1208项知识产权，营业额超百亿

【在招职位】算法类、软件类、硬件类、结构光学类、设计类、技术类、职能类等

【在招专业】机电类、材料化工类、电气电子类、自动化、信息类、能动类、市场营销、人资类等专业本硕博毕业生…

【工作地点】深圳、惠州、香港

【薪资待遇】
✅本科生年薪12万-21万，硕士年薪15万-27万，博士年薪40万起，每年至少2次调薪机会，双通道晋升
✅免费员工宿舍，豪华食堂、健身房、电影院、游戏厅等娱乐设施，定期举办文体活动，不定期组织旅游

【简历优先筛选通道】
https://careerktc.zhiye.com/campus/jobs?shareId=dd8023db-f2ca-4df9-b751-3e43149be167&shareSource=2&qr=1&memory=%7B%7D&silence=1

【内推码】ESVP1R

内推简历优先筛选，求职更高效！', 1, 'ec4b6288500d31c25456aa7d0906fac0', CURRENT_TIMESTAMP
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
  'smartsheet_0106_5584d1fa', 'MetaApp', '游戏', '27届秋招/日常实习', '["运营类","研发类","产品类","职能类","设计类","销售类"]', '["北京","成都","厦门"]',
  '运营类、研发类、产品类、职能类、设计类、销售类', 'J627X47', 'https://meta.jobs.feishu.cn/s/1Qh37qPds9M', '2026-08-21T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】成立于2017年，是一家估值10亿美金的C轮独角兽企业，由SIG海纳亚洲、云九资本等顶级基金投资；旗下《233乐园》是国内最大的安卓游戏平台，日活过千万；旗下《口袋方舟》编辑器已有超1000个中小游戏团队入驻。

【6大类70+岗位】运营类、研发类、产品类、职能类、设计类、销售类

【工作城市】北京、成都、厦门

【公司福利】有竞争力的薪资、年终奖金、六险一金、餐补、交通补贴、住房补贴、健身补贴、节日福利、带薪年假、弹性工作时间、健身房、社团团建经费等

【内推链接】
https://meta.jobs.feishu.cn/s/1Qh37qPds9M

【内推码】J627X47

内推投递，简历优先筛选！', 1, '5584d1fa650e88b202f7d324b28319d4', CURRENT_TIMESTAMP
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
  'smartsheet_0107_e1ffef81', '传音控股（27届秋招）', '手机', '27届秋招', '["软件开发类","硬件开发类","算法类","测试类","运维类","数据类","产品类","运营类","设计类","市场营销类","供应链类","职能类"]', '["上海","深圳","重庆","海外"]',
  '软件开发类、硬件开发类、算法类、测试类、运维类、数据类、产品类、运营类、设计类、市场营销类、供应链类、职能类', 'ESHRR2', 'https://transsion.zhiye.com/campus/jobs?shareId=bfbc4454-a3db-4733-a0ab-dfc0a017aa1e&shareSource=2', '2026-08-21T08:00:00.000Z', '招满即止', 'active',
  '传音控股2027校园招聘启动！

公司介绍：2019年上海科创板上市公司，新兴市场消费者最喜爱的智能终端产品和移动互联服务提供商，全球销售超过70个国家和地区。

招聘岗位：软件开发类、硬件开发类、算法类、测试类、运维类、数据类、产品类、运营类、设计类、市场营销类、供应链类、职能类

岗位城市：上海、深圳、重庆、海外

【内推链接】
https://transsion.zhiye.com/campus/jobs?shareId=d0cd0e67-7cba-4e97-9246-d0bb1036d40b&shareSource=2

内推码：ESHRR2（简历优先被筛选，流程问题欢迎联系）', 1, 'e1ffef8143b92550d42e229eaee39088', CURRENT_TIMESTAMP
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
  'smartsheet_0108_886b33a4', '传音控股（海东青计划）', '手机', '27届秋招', '["产品","市场","运营","GTM"]', '["上海","深圳","重庆","海外"]',
  '产品、市场、运营、GTM', 'ESHRR2', 'https://transsion.zhiye.com/5/jobs?shareId=90f6e40d-40fc-4874-a5db-48724b392d58&shareSource=2', '2026-08-21T08:00:00.000Z', '招满即止', 'active',
  '公司介绍：2019年上海科创板上市公司，新兴市场消费者最喜爱的智能终端产品和移动互联服务提供商，全球销售超过70个国家和地区。

招聘岗位：软件开发类、硬件开发类、算法类、测试类、运维类、数据类、产品类、运营类、设计类、市场营销类、供应链类、职能类

岗位城市：上海、深圳、重庆、海外

【海东青计划内推链接】
https://transsion.zhiye.com/5/jobs?shareId=90f6e40d-40fc-4874-a5db-48724b392d58&shareSource=2

【AI人才计划内推链接】
https://transsion.zhiye.com/4/jobs?shareId=636fceb7-19fd-408e-9b0b-aaf1c29ecedb&shareSource=2

内推码：ESHRR2（简历优先被筛选，流程问题欢迎联系）', 1, '886b33a4f3170b052ff1e6a290edf54c', CURRENT_TIMESTAMP
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
  'smartsheet_0109_a6c70be7', '传音控股（AI人才计划）', '手机', '27届秋招', '["算法类"]', '["上海","深圳","重庆","海外"]',
  '算法类', 'ESHRR2', 'https://transsion.zhiye.com/4/jobs?shareId=636fceb7-19fd-408e-9b0b-aaf1c29ecedb&shareSource=2', '2026-08-21T08:00:00.000Z', '招满即止', 'active',
  '公司介绍：2019年上海科创板上市公司，新兴市场消费者最喜爱的智能终端产品和移动互联服务提供商，全球销售超过70个国家和地区。

招聘岗位：软件开发类、硬件开发类、算法类、测试类、运维类、数据类、产品类、运营类、设计类、市场营销类、供应链类、职能类

岗位城市：上海、深圳、重庆、海外

【海东青计划内推链接】
https://transsion.zhiye.com/5/jobs?shareId=90f6e40d-40fc-4874-a5db-48724b392d58&shareSource=2

【AI人才计划内推链接】
https://transsion.zhiye.com/4/jobs?shareId=636fceb7-19fd-408e-9b0b-aaf1c29ecedb&shareSource=2

内推码：ESHRR2（简历优先被筛选，流程问题欢迎联系）', 1, 'a6c70be78f6eb68d1efd5bbb167c6b13', CURRENT_TIMESTAMP
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
  'smartsheet_0110_62ce7869', '经纬恒润', '智能驾驶', '27届秋招', '["研发技术类","研发管理类","公共职能类"]', '["北京","上海","深圳","武汉","成都","天津","南京"]',
  '研发技术类、  研发管理类、公共职能类', 'DSxQbxTW', 'https://app.mokahr.com/m/campus-recruitment/jingweihengrun/168294?recommendCode=DSxQbxTW#/jobs', '2026-08-20T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】北京经纬恒润科技股份有限公司（股票代码：688326）专注于汽车电子、智能驾驶及无人运输领域的创新突破。 

【招聘岗位】
✅研发技术类：智能汽车开发、硬件设计、软件开发、算法与仿真建模等。  
✅研发管理类：项目管理、产品规划、体系质量等。  
✅公共职能类：市场、人力、财务、供应链等。  
 
【工作地点】
北京、上海、深圳、武汉、成都、天津、南京、长沙等

【内推链接】https://app.mokahr.com/m/campus-recruitment/jingweihengrun/168294?recommendCode=DSxQbxTW#/jobs

【内推码】DSxQbxTW（内推投递，简历优先筛选，后续流程/进度有问题欢迎联系）', 1, '62ce786935b67bca5d24ae5eea40bd11', CURRENT_TIMESTAMP
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
  'smartsheet_0111_4c23a365', '禾望电气', '新能源/能源电力', '27届秋招', '["研发类","市场类","售后类"]', '["深圳","苏州","西安","武汉","海外"]',
  '研发类、市场类、售后类', 'EVKWA2', 'https://hopewind1.zhiye.com/campus/jobs?shareId=6697dc02-53da-4f50-a8ef-f8ae99dd0ce2&shareSource=2', '2026-08-21T08:00:00.000Z', '招满即止', 'active',
  '关于禾望：主板上市企业，新能源风电变流器龙头，国家高新技术企业！900+专利，20年+行业经验，实力硬核！六大研发制造基地，全球十大服务中心！

薪酬福利：行业高薪+丰厚项目奖金，核心骨干期权激励，七险一金各项补贴福利全覆盖

招聘岗位：研发类、市场类、售后类

工作地点：深圳、苏州、西安、武汉、海外

内推链接：https://hopewind1.zhiye.com/campus/jobs?shareId=6697dc02-53da-4f50-a8ef-f8ae99dd0ce2&shareSource=2

【内推码】EVKWA2（简历优先筛选，流程问题欢迎联系）', 1, '4c23a365c03253938411b54678f6750d', CURRENT_TIMESTAMP
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
  'smartsheet_0112_b61b0e32', '诺瓦星云', '制造业', '27届秋招', '["研发类","营销类","职能＆制造类"]', '["西安","深圳","北京"]',
  '研发类、营销类、职能＆制造类', 'EV1M1T', 'https://novastar.zhiye.com/campus/jobs?shareId=f156c994-cbf4-4608-8629-2e0d9723aa8f&shareSource=2', '2026-08-20T08:00:00.000Z', '招满即止', 'active',
  '【我们是】全球极具竞争力的LED方案解决供应商，业务布局全球150个国家和地区

【需求】研发类、营销类、职能＆制造类超多机会

【Base】北京+深圳+西安三大研发中心

【福利满满】自有餐厅、 健身房 、游泳馆等设施、六险一金、定期体检、带薪年假最多20天、节日礼品、 特殊礼金、 社团活动 、部门团建等

【内推链接】
https://novastar.zhiye.com/campus/jobs?shareId=f156c994-cbf4-4608-8629-2e0d9723aa8f&shareSource=2

【内推码】EV1M1T（内推简历优先筛选）', 1, 'b61b0e32c5025556611b0813c83a4c13', CURRENT_TIMESTAMP
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
  'smartsheet_0113_f23c0eb1', '海康威视', '制造业', '27届秋招', '["算法","网络安全","大数据类","器件电路类","软件","嵌入式类","硬件","结构类","国内营销","技术支持类","国际营销","技术支持类","测试","支撑类","供应链类","体验设计类","综合类"]', '["杭州","武汉","西安","上海","成都","海外多地"]',
  '算法/网络安全/大数据类、器件电路类、软件/嵌入式类、硬件/结构类、国内营销/技术支持类、国际营销/技术支持类、测试/支撑类、供应链类、体验设计类、综合类', '21F38N', 'https://campushr.hikvision.com', '2026-08-20T08:00:00.000Z', '招满即止', 'active',
  '10大类岗位、N多方向、全球工作地点开放投递

我们为你提供：
🚀  影响世界的宽广舞台（业务覆盖全球180+国家/地区）
✨  持续可期的成长回报（全球员工5.7w+）
💪  踏实专注的做事氛围（研发技术员工2.6w+，工程师文化）
💡  接轨市场的创新实践（25年研发投入117亿元）

📮 【简历投递方式】
➡  PC-电脑端校招官网(建议)：campushr.hikvision.com
▶  微信端：关注“海康威视招聘”公众号

【内推码】21F38N

加入我们，智未来，因你来！', 1, 'f23c0eb17633a42ad48bdfd19a2521b9', CURRENT_TIMESTAMP
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
  'smartsheet_0114_a43f9ae2', '千里智驾', '智能驾驶', '27届秋招/日常实习', '["算法类","研发技术类","产品","解决方案类","职能类"]', '["上海","北京","重庆","宁波","杭州","宁波"]',
  '算法类、研发技术类、产品/解决方案类、职能类', 'DSPfBBxn', 'https://app.mokahr.com/m/campus_apply/qianli1/147197?recommendCode=DSPfBBxn&hash=%23%2Fjobs#/jobs', '2026-08-19T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】千里科技（A股601777），聚焦AI+车全栈解决方案，布局L2+到L4智能驾驶、智能座舱，北上渝甬多地设有办公室，核心团队AI、智驾技术实力雄厚
 
岗位方向：算法类、研发技术类、交付类、产品/运营类、职能类、销售类
 
工作城市：上海、北京、重庆、宁波、杭州、宁波

内推链接：https://app.mokahr.com/m/campus_apply/qianli1/147197?recommendCode=DS95rSW1#/jobs

内推码：DS95rSW1（简历优先筛选）', 1, 'a43f9ae2ed8cc359e4017d3f695221e5', CURRENT_TIMESTAMP
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
  'smartsheet_0115_90536ed5', '睿联技术', '制造业', '27届秋招', '["研发技术类","销售运营类","市场推广类","职能支持类"]', '["深圳","武汉","海外"]',
  '研发技术类、销售运营类、市场推广类、
职能支持类', 'DSQZ1hNF', 'https://app.mokahr.com/m/campus_apply/reo/136006?recommendCode=DSQZ1hNF#/jobs', '2026-08-19T08:00:00.000Z', '招满即止', 'active',
  '公司介绍：睿联技术Reolink多年来聚焦于智能家居+互联网云服务，是该领域领先的品牌商。公司客户遍布全球百余个国家和地区，拥有良好的市场口碑和占有率，为数百万用户提供智能、安全、便捷的智慧生活

岗位类别：
产品研发类（13-42w/年）
销售运营类（14-28w/年）
市场推广类（14-25w/年）
职能支持类（13-28w/年）

工作地点：深圳、武汉、海外

薪酬福利：行业领先的薪酬水平和完善的福利制度+入职&转正礼包、生日礼包、周年礼包、婚育礼金+免费班车、下午茶、咖啡畅饮、无限零食、节日礼物、晚归餐券、免费打车

内推通道：
https://app.mokahr.com/m/campus_apply/reo/136006?recommendCode=DSQZ1hNF#/jobs

内推码：DSQZ1hNF（填写推荐码，简历优先筛选，面试优先安排）', 1, '90536ed53a0f3c5b284315fd5fd83eea', CURRENT_TIMESTAMP
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
  'smartsheet_0116_34edc691', '学而思', '教培/互联网', '27届秋招/往届可投', '["科学思维教师","人文创作教师","国际素养教师（外语方向）","彼芯学习教练","理科主讲教师"]', '["全国多地"]',
  '科学思维教师、人文创作教师、国际素养教师（外语方向）、彼芯学习教练、理科主讲教师', 'DSVfy2RZ', 'https://app.mokahr.com/m/campus_apply/tal/148080?recommendCode=DSVfy2RZ&hash=%23%2Fjobs#/jobs', '2026-08-19T08:00:00.000Z', '招满即止', 'active',
  '学而思27届秋招启动！不限专业，不要教资！

【公司简介】学而思于2003年成立，是一家综合性教育科技公司。2010年在美国纽交所正式挂牌上市，现于北京、上海、广州、深圳等40+城市均设立分校，在职员工2W+，为千万用户与家庭提供优质服务！

【业务线】素养教育、 国际语言、彼芯托管、竞赛教练、职能类等

【工作地点】全国 40 + 城任你选！一线冲事业，二三线享生活！

【福利待遇】
✅ 行业 TOP 薪资：15-35W + 年薪起，每年 4-6 次调薪机会！
✅ 六险一金 + 带薪年假 / 病假，安全感拉满
✅ 百万级培训：手把手带你从萌新到名师
✅ 快乐加成：节日礼盒 + 零食自由 + 定制周边

【内推通道】
https://app.mokahr.com/m/campus_apply/tal/148080?recommendCode=DSVfy2RZ&hash=%23%2Fjobs#/jobs

【内推码】DSVfy2RZ（内推简历优先筛选，光速约面！）', 1, '34edc691a95bb357046ada7b93c8c740', CURRENT_TIMESTAMP
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
  'smartsheet_0117_6d757e47', 'Sea（Shopee+Monee+Garena）', '互联网/外企/跨境/游戏/金融科技', '27届秋招/往届可投', '["全球管理培训生【跨职能轮岗】产品管理","人工智能","运营管理","市场营销","电竞赛事","游戏设计"]', '["上海","新加坡"]',
  '全球管理培训生【跨职能轮岗】产品管理/人工智能/运营管理/市场营销/电竞赛事/游戏设计', 'DSTvWb8w', 'https://app.mokahr.com/campus_apply/garena/148076?recommendCode=DSTvWb8w#/job/911f2cc8-7514-4788-bd2e-75a6a3718eba', '2026-08-18T08:00:00.000Z', '招满即止', 'active',
  '【About Sea】
Sea(股票代码:SE)成立于2009年，是全球领先的消费互联网企业。三大核心业务涵盖电子娱乐Garena、电子商务Shopee和数字金融Monee

【About Garena】
Garena是全球领先的在线游戏开发商和发行商。自研自发的大逃杀类型手机游戏《Garena Free Fire》连续七年蝉联该品类全球下载量最高的手机游戏，并多次登顶全球手机游戏下载总榜

【全球管理培训生计划】
GMAP是 Sea 为有潜力的年轻人才打造的旗舰项目，为期2年，包括4个为期6个月的轮岗，旨在培养对游戏/互联网行业有热情的年轻人成为未来的领导者

【跨职能轮岗】
游戏设计/产品管理/人工智能/运营管理/市场营销/电竞赛事

【面向对象】
2027应届毕业生/工作经验不超过2年的年轻人才/专业不限

【内推链接】
https://app.mokahr.com/m/campus_apply/garena/148076?recommendCode=DSTvWb8w#/jobs

【内推码】DSTvWb8w(简历优先筛选，后续流程问题欢迎联系)', 1, '6d757e47f7fed1d468d0b8211b1c2c78', CURRENT_TIMESTAMP
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
  'smartsheet_0118_eb049f68', '群核科技', '科技', '27届秋招/日常实习', '["技术","运营","产品","设计"]', '["杭州"]',
  '技术、运营、产品、设计', 'DS4Gg9hR', 'https://app.mokahr.com/m/campus_apply/qunhemail/2832?recommendCode=DS4Gg9hR#/jobs', '2026-08-19T08:00:00.000Z', '招满即止', 'active',
  '杭州六小龙-群核科技2027届秋招正式启动！27届校招生+储备实习生岗位开放！

【公司介绍】群核科技是全球领先的空间智能服务提供商，致力于推动人工智能加速进入物理世界！

【岗位包括】技术、运营、产品、设计等方向

【工作地点】杭州

【投递链接】https://app.mokahr.com/m/campus_apply/qunhemail/2832?recommendCode=DS4Gg9hR#/jobs

【内推码】DS4Gg9hR（简历优先内推筛选，直达HR）', 1, 'eb049f68eb546a8a164fb0a82df631a7', CURRENT_TIMESTAMP
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
  'smartsheet_0119_c97d3bff', '亿道集团', '制造业', '27届秋招', '["研发类","营销类","其他（会计","采购","销售）"]', '["深圳","重庆"]',
  '研发类、营销类、其他（会计/采购/销售）', 'EVBPTJ', 'https://emdoor1.zhiye.com/campus/jobs?shareId=94dbb51d-08c8-41cb-b6d6-dc6eef99d4bc&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-08-18T08:00:00.000Z', '招满即止', 'active',
  '📢亿道集团及其子公司——国家高新技术企业、国家专精特新“小巨人”企业、深圳市行业领袖百强企业、A股上市（001314）企业，连续多年获得“最佳雇主”称号...

【💼招聘岗位】
研发岗：产品经理、项目工程师、嵌入式软件工程师-C语言方向、算法工程师(机器人)、硬件工程师、结构工程师、热设计工程师、测试工程师
非研发岗：智能制造管培生—品质管理方向、智能制造管培生—工程技术方向、智能制造管培生—生产交付方向、采购工程师、成本工程师、人力资源专员

【🎁福利待遇】
🌈酒店式公寓、公租房、智慧食堂、六险一金、健康体检、带薪年/病假、下午茶、员工旅游、过节费、节日礼物、婚育礼金、专业培训等...
【[跳跳]职业发展】：多通道发展，双导师制，直接接触核心项目，公司80%管理者从内部提拔。

【💌投递通道】
💻网申链接：https://emdoor1.zhiye.com/campus/jobs?shareId=94dbb51d-08c8-41cb-b6d6-dc6eef99d4bc&shareSource=2&qr=1&memory=%7B%7D&silence=1

✅内推码：EVB', 1, 'c97d3bff6533373b7fcad0bf6df43e0f', CURRENT_TIMESTAMP
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
  'smartsheet_0120_157c94d9', '吉利控股集团', '汽车', '27届秋招', '["整车研发类","IT互联网类","采购","供应链","质量类","智能制造类","新能源开发类","营销服务类","设计类","职能类","航空航天类"]', '["全国多地"]',
  '整车研发类 、IT互联网类 、采购/供应链/质量类 、智能制造类、 新能源开发类 、营销服务类、 设计类、 职能类 、航空航天类', 'DSV9DCmy', 'https://app.mokahr.com/m/campus_apply/geely/78436?recommendCode=DSV9DCmy#/jobs', '2026-08-19T08:00:00.000Z', '招满即止', 'active',
  '公司简介：从中国走向世界的全球化汽车企业，业务遍及全球一百多个国家和地区 ，销量排名全球第八位 ，连续15年入榜《财富》世界500强 

招聘岗位：5000+offer ！整车研发类 、IT互联网类 、采购/供应链/质量类 、智能制造类、 新能源开发类 、营销服务类、 设计类、 职能类 、航空航天类

工作地点：全国多地

【内推链接】
https://app.mokahr.com/m/campus_apply/geely/78436?recommendCode=DSD7R4fZ#/jobs

【内推码】DSD7R4fZ（简历优先筛选，流程问题欢迎联系）', 1, '157c94d96bf1c12f8d974ffd0bef11c0', CURRENT_TIMESTAMP
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
  'smartsheet_0121_77bc86b0', '韶音科技', '消费电子', '27届秋招', '["研究类","开发类","产品类","工程技术类","品质管理类","IT类","营销运营类","设计策划类","供应链运营类","职能类"]', '["深圳","香港","武汉"]',
  '研究类、开发类、产品类、工程技术类、品质管理类、IT类、营销运营类、设计策划类、供应链运营类、职能类', 'DSJ44dby', 'https://app.mokahr.com/m/campus_apply/aftershokzhr/36940?recommendCode=DSJ44dby&hash=%23%2Fjobs#/jobs', '2026-08-17T08:00:00.000Z', '招满即止', 'active',
  '企业介绍：骨传导耳机领导者，全球运动耳机销量名列前茅，产品进驻60+国家；深耕声学器件、助听器、算法、MEMS和大健康五大方向

企业文化：倡导工作生活平衡，拒绝内卷，拒绝996！！ 反对形式主义加班，强调运动和认识升级。每年投入百万运营21个运动俱乐部，鼓励员工参与运动，健康生活

招聘岗位：研究类、开发类、产品类、工程技术类、品质管理类、IT类、营销运营类、设计策划类、供应链运营类、职能类等100+岗位

薪酬福利：极具竞争力的薪资，租房补贴，校招生公寓，免费健身房，季度团建经费，21个运动俱乐部…

工作城市：深圳，香港，武汉

内推链接：
https://app.mokahr.com/m/campus_apply/aftershokzhr/36940?recommendCode=DStwmDHt&hash=%23%2Fjobs#/jobs

内推码：DStwmDHt（内推简历优先筛选，后续有任何疑问欢迎联系）', 1, '77bc86b06d507eeb377d2cc57b54bdd7', CURRENT_TIMESTAMP
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
  'smartsheet_0122_2147c921', '启源芯动力', '制造业/能源电力', '27届秋招', '["研发","产品","销售","运营","职能管理类等"]', '["上海市","成都市","天津市","乌鲁木齐市全国各地"]',
  '研发、产品、销售、运营、职能管理类等', 'EVVM9A', 'https://spicqyxdl.zhiye.com/campus/jobs?shareId=8481a904-2c90-4d2d-a5c1-bdff2187e5b7&shareSource=2', '2026-08-17T08:00:00.000Z', '招满即止', 'active',
  '公司简介：新能源商用车先进技术开发和能源服务商，是国家交通强国建设试点任务牵头实施单位，市场占有率处于领先地位

岗位方向：研发、产品、销售、运营、职能管理类等

薪资福利：具有竞争力的薪酬体系｜完善的福利保障｜绩效激励与成长奖励｜多元职业发展通道

培养体系：校招生专属培养方案｜导师带教机制｜专业能力提升培训｜项目实践锻炼机会｜多岗位发展通道

内推链接：
https://spicqyxdl.zhiye.com/campus/jobs?shareId=8481a904-2c90-4d2d-a5c1-bdff2187e5b7&shareSource=2

内推码：EVVM9A（简历优先筛选，流程问题欢迎联系）', 1, '2147c9213a8902656b5f6826e237f2fc', CURRENT_TIMESTAMP
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
  'smartsheet_0123_f89e9d3e', '安克创新', '跨境电商', '27届秋招', '["技术类","产品类","营销服类","供应链类","职能类","商科类"]', '["深圳","长沙","上海","北京","苏州","海外"]',
  '技术类、产品类、营销服类、供应链类、职能类、商科类', 'XPJDV68', 'https://anker-in.jobs.feishu.cn/s/xBXcWuds31Q', '2026-08-17T08:00:00.000Z', '招满即止', 'active',
  '【公司介绍】跨境电商龙头，全球29个办公室，从设计研发，到营销体验，与我们一起，千亿营收，百万年薪！等你共同奔赴全球

【岗位需求】研发技术、产品与体验、设计、市场营销、采购与供应链、品质、职能、制造

【工作地点】深圳、长沙、上海、北京、苏州、杭州、西安、海外

【薪酬待遇】行业TOP薪酬、多重员工福利、全年两次调薪

【内推链接】https://anker-in.jobs.feishu.cn/s/xBXcWuds31Q

【内推码】XPJDV68
推荐方式选择大使推荐，内推简历优先筛选，加速流程推进！', 1, 'f89e9d3e86327b2fb9060c8b193c8317', CURRENT_TIMESTAMP
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
  'smartsheet_0124_1b686f49', '美团', '互联网', '27届秋招/日常实习', '["技术类","产品类","商业分析类","零售类","运营类","设计类","市场营销类","职能类","金融类","销售","客服与支持类","综合类"]', '["全国多地"]',
  '技术类、产品类、商业分析类、零售类、运营类、设计类、市场营销类、职能类、金融类、销售/客服与支持类、综合类', '3ADPE4G', 'https://zhaopin.meituan.com/m/campus?token=5505723df1e44c768ddc6fd523bc2b55', '2026-08-17T08:00:00.000Z', '招满即止', 'active',
  '10 大类岗位，100+ 种选择：
技术 / 产品 / 商分 / 零售 / 运营 / 设计 / 市场 / 职能 / 金融 / 销售客服

🌍工作地全球几十个城市等你选择

【内推链接】
https://zhaopin.meituan.com/m/campus?token=5505723df1e44c768ddc6fd523bc2b55

【专属内推码】3ADPE4G

内推投递，简历优先筛选，面试流程加快！', 1, '1b686f498dc500dc02f68a9b59105001', CURRENT_TIMESTAMP
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
  'smartsheet_0125_65533a80', '三环集团', '制造业', '27届秋招', '["研发大类","机电大类","技术支持类","职能类","金融类","战略研究类","采购销售类","法务"]', '["潮州","深圳","成都"]',
  '研发大类、机电大类、技术支持类、职能类、金融类、战略研究类、采购销售类、法务', '811237', 'https://hr.cctc.cc', '2026-08-18T08:00:00.000Z', '招满即止', 'active',
  '📣【三环集团】27届秋招招聘启动！
深交所上市 国家百强高新技术企业

➡️【岗位】：研发大类 机电大类  技术支持类 职能类 金融类  战略研究类 采购销售类 法务类等
➡️base潮州深圳成都等

✅专属内推码:811237 
优先筛选 提前进面！！！
⬆️投递网址：hr.cctc.cc 校园招聘', 1, '65533a80ded6f50dfc6a76082badf1c8', CURRENT_TIMESTAMP
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
  'smartsheet_0126_6399a8c2', '波克城市', '游戏', '27届秋招', '["研发类","运营类","策划类","职能类"]', '["上海"]',
  '研发类、运营类、策划类、职能类', '71GPKXD', 'https://boke.jobs.feishu.cn/s/Lc5yYCiX7pk', '2026-08-16T08:00:00.000Z', '招满即止', 'active',
  '【关于我们】上海超香游戏公司！立足精品游戏的全球化研发与发行，业务范围覆盖全球 200+国家和地区，在全球拥有超 5 亿注册用户，日活跃用户3000万+，抖音小游戏流水登顶全行业，已连续7年入选中国互联网百强企业，累计综合纳税超100亿元！

【招聘岗位】研发类、运营类、策划类、美术类、职能类

【工作地点】上海

【我们提供】有竞争力薪资、一日免费三餐+下午茶自由、租房自由（房补/人才公寓）、年度旅游五天、30+社团、辅助落户上海、春节额外2天假期

【内推链接】
https://boke.jobs.feishu.cn/s/Lc5yYCiX7pk

【内推码】71GPKXD（推荐方式选择“大使推荐”，内推简历优先筛选，加速流程推进）', 1, '6399a8c20b70a13a621dfa5a6c80f7d5', CURRENT_TIMESTAMP
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
  'smartsheet_0127_6c135181', '作业帮产研', '互联网/教培', '27届秋招', '["产品类","运营类","教研类","职能类","IT类"]', '["北京","上海","西安","重庆","济南","石家庄"]',
  '产品类、运营类、教研类、职能类、IT类', 'DSDKtsmB', 'https://app.mokahr.com/m/campus_apply/zuoyebang/39595?recommendCode=DSDKtsmB&hash=%23%2Fjobs#/jobs', '2026-08-16T08:00:00.000Z', '招满即止', 'active',
  '【热招岗位】
产品类、运营类、教研类、职能类、IT类

【工作地点】
北京、上海、西安、重庆、济南、石家庄等
 
【福利待遇】
✅七险一金+免费三餐+打车福利+带薪年假，年度体检+节日礼品+亲属报课福利全拉满
✅导师带教+阶段化培养+实战项目，专业能力双轨进阶，新人快速成长
 
📩内推通道：https://app.mokahr.com/m/campus_apply/zuoyebang/39595?recommendCode=DSDKtsmB&hash=%23%2Fjobs#/jobs

【内推码】DSDKtsmB（内推享优先筛选，招聘进度可实时查询）', 1, '6c135181f6614b11f37608d381eb8995', CURRENT_TIMESTAMP
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
  'smartsheet_0128_4e429313', '凌云光', '科技', '27届秋招', '["AI","算法","深度学习","图像算法","光学工程师","软件研发","硬件","结构电控","测试","项目经理","技术支持"]', '["北京","苏州","深圳","西安"]',
  'AI 算法 / 深度学习 / 图像算法 / 光学工程师 / 软件研发 / 硬件 / 结构电控 / 测试 / 项目经理 / 技术支持', 'DSj3DT9x', 'https://app.mokahr.com/m/campus-recruitment/lusterinc/44882?recommendCode=DSj3DT9x#/jobs', '2026-08-17T08:00:00.000Z', '招满即止', 'active',
  '公司简介：中国机器视觉销售额 Top1、科创板上市，使命是“为机器植入眼睛和大脑” ！

 岗位方向：AI 算法 / 深度学习 / 图像算法 / 光学工程师 / 软件研发 / 硬件 / 结构电控 / 测试 / 项目经理 / 技术支持

 工作地点：北京 / 苏州 / 深圳 / 西安 等

薪资福利：八险一金、住房补贴、免费班车、期权股票

【内推链接】https://app.mokahr.com/m/campus-recruitment/lusterinc/44882?recommendCode=DSj3DT9x#/jobs

【内推码】DSj3DT9x（内推简历优先筛选，流程加快）', 1, '4e4293135c0c13fd3186dd9b43a5c262', CURRENT_TIMESTAMP
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
  'smartsheet_0129_9ce3315a', '汇川技术', '制造业', '27届秋招', '["技术族","营销族","产品管理族","供应链管理族","职能族","海外事业部"]', '["苏州","西安","南京","深圳","上海","岳阳","济南","斯图加特","泰国","马来西亚海内外多个城市"]',
  '技术族、营销族、产品管理族、供应链管理族、职能族、海外事业部', 'ABBPREB', 'https://recruit.inovance.com/#/jobs?ref=ABBPREB', '2026-08-15T08:00:00.000Z', '招满即止', 'active',
  '汇川技术2027届秋季校园招聘
【我们是谁】
“上榜2024年《财富》亚洲未来30强”、“”2024年中国自动化+数字化品牌50强“、“2023年福布斯中国创新力企业50强”……
📈【汇川业务】
汇川技术是中国工业自动化控制与驱动技术的佼佼者，集变频器、伺服、控制系统(PLC/CNC)、工业视觉系统、高性能电机、高精密丝杠、工业互联网、工业AI、机器人、储能等核心部件及光机电液一体化解决方案供应商。
新能源汽车业务子公司汇川联合动力是智能电动汽车部件及解决方案提供商，涉及电驱系统（电机、电机控制器、电驱总成）、电源系统（DC/DC、OBC、电源总成）和智能底盘化（悬架、域控制器）等产品
🔔【招聘类别】
技术族、营销族、产品管理族、供应链管理族、职能族 海外事业部
📍【工作地点】
苏州、西安、南京、深圳、上海、岳阳、济南、斯图加特、泰国、马来西亚等海内外多个城市
👔【企业福利】
工作双休，14天超长春节假期；
食堂价格亲民，班车接送；
另有住宿补贴，交通补贴等多项福利补贴；

✅内推链接https://recruit.inovance.com/#/jobs?ref=ABBPREB', 1, '9ce3315a3722184708b764535be7ee6f', CURRENT_TIMESTAMP
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
  'smartsheet_0130_9947e15d', '埃科光电', '制造业', '27届秋招', '["研发类","营销类"]', '["合肥","成都","北京","苏州","深圳"]',
  '研发类、营销类', 'XDHW045
（简历命名格式：内推码+应聘岗位-姓名-学校-学历）', 'http://career.i-tek.cn/', '2026-08-15T08:00:00.000Z', '招满即止', 'active',
  '📣埃科光电27届校园招聘正式开启
📷【公司介绍】新一线城市合肥➕优厚薪资➕国内工业相机第一股
埃科光电（股票代码：688610）是专业研发、生产和销售高端工业成像核心部件的国家高新技术企业。目前已推出工业相机、图像采集卡、智能光学单元等全系列核心产品，在电子制造、新型显示、半导体、锂电、光伏、生命科学等领域的多家知名终端龙头企业实现规模化应用。
🏆【企业荣誉】
国家专精特新“小巨人”企业、国家博士后科研工作站、国家知识产权优势企业等
🎯【研发类岗位】
✨✨FPGA硬件开发、嵌入式开发、软件开发、图像算法、光学系统、结构设计
📍【工作地点】合肥、成都
🎯【营销类岗位】
✨✨销售、现场应用
📍【工作地点】北京、苏州、深圳
💰【福利待遇】
研发类岗位硕士综合年薪30w起，每年定期调薪，六险一金、定期体检等完善的福利体系。

✅内推码 XDHW045
👉【投递方式】
网申http://career.i-tek.cn/
（简历命名格式：❗️内推码❗️+应聘岗位-姓名-学校-学历）', 1, '9947e15da4443a0910d901958e400694', CURRENT_TIMESTAMP
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
  'smartsheet_0131_c5677dc7', '鸿擎科技', '科技', '27届秋招', '["光学类","智能制造类","项目管理类","供应链类","市场营销类","航空航天类","机械类","自动化类","计算机类等等"]', '["北京","上海","西安","雄安新区","深圳"]',
  '光学类、智能制造类、项目管理类、供应链类、市场营销类、航空航天类、机械类、自动化类、计算机类等等', '8M2CV7C', 'https://qcnhg4ksaiwt.jobs.feishu.cn/257870/m/position?external_referral_code=8M2CV7C', '2026-08-15T08:00:00.000Z', '招满即止', 'active',
  '🚀 星河邀约｜鸿擎科技 2027 全球校招正式启动！ ✨想亲手造卫星、把设计图纸送上太空吗？🛰️国内唯一具备全生态服务能力的卫星组网解决方案商，2027全球校招火热开启！
📍 北京/上海/西安/雄安新区/深圳
高薪绩效+七险一金｜导师带教｜国家级项目实战

➡️岗位覆盖 航空宇航、计算机、电气电子、机械机电光电、自动化、通信等理工科专业不限 另有运营管理类 职能类等
✅内推链接 https://qcnhg4ksaiwt.jobs.feishu.cn/257870/m/position?external_referral_code=8M2CV7C
✅内推码8M2CV7C', 1, 'c5677dc71e08a1af58e4bf38877a17bc', CURRENT_TIMESTAMP
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
  'smartsheet_0132_780837c5', '金证科技', '金融科技', '27届秋招', '["软件研发（C","C++","Java","Web","大模型应用开发工程师等）","技术支持（测试","实施","维护工程师）","市场营销类等岗位"]', '["深圳","长沙","成都","上海"]',
  '软件研发（C/C++、Java、Web、大模型应用开发工程师等）、技术支持（测试、实施、维护工程师）、市场营销类等岗位', 'EV3G00', 'https://szkingdom1.zhiye.com/campus/jobs?shareId=58e12668-45c0-4e80-b264-11afbf26b7e6&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-08-15T08:00:00.000Z', '招满即止', 'active',
  '金融科技行业龙头 — 金证科技2027届校招启动
➡️金融科技行业头部公司，交易所、证券、基金、期货、银行和信托等机构整体解决方案的首选服务商，上市公司（600446，SH），AA级证券公司交易系统占比50%，余额宝/理财通核心技术搭建。
➡️【校招岗位】软件研发（C/C++、Java、Web、大模型应用开发工程师等）、技术支持（测试、实施、维护工程师）、市场营销类等岗位
➡️【薪酬福利】有竞争力的薪资，六险一金，2年免费住宿或租房补助，周末双休，校招生专属培训方案，高潜人才晋升通道等！
➡️【工作城市】深圳、长沙、成都、上海

✅内推链接https://szkingdom1.zhiye.com/campus/jobs?shareId=58e12668-45c0-4e80-b264-11afbf26b7e6&shareSource=2&qr=1&memory=%7B%7D&silence=1
➡️内推码EV3G00', 1, '780837c58ead2d1b42771f7da4d1180a', CURRENT_TIMESTAMP
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
  'smartsheet_0133_2bb181c4', '小米（应届生校招）', '手机/汽车', '27届秋招', '["软件研发类","算法类","硬件研发类","芯片类","产品类","设计类","市场类","职能类","供应链类等"]', '["北京","上海","深圳","武汉","西安","南京","新加坡国内及海外城市"]',
  '软件研发类、算法类 、硬件研发类、芯片类、产品类、设计类 、市场类、职能类、供应链类等', '7AQ2UV5', 'https://xiaomi.jobs.f.mioffice.cn/s/wkOnmIfxVAk', '2026-08-15T08:00:00.000Z', '招满即止', 'active',
  '17+职类开放投递 今年需求更大！
➡️软件研发类、算法类、 硬件研发类 、芯片类、 产品类、设计类、 市场类 、职能类 、供应链类等等等

➡️base北京、上海 、深圳、 武汉 、西安、 南京、慕尼黑 、新加坡等国内外城市

✅专属内推链接
➡️正式秋招https://xiaomi.jobs.f.mioffice.cn/s/wkOnmIfxVAk
➡️新零售秋招https://xiaomi.jobs.f.mioffice.cn/s/E2SHPRYJLFQ
➡️顶尖人才计划https://xiaomi.jobs.f.mioffice.cn/s/N2fwT_oLnLI

✅专属内推码7AQ2UV5（推荐方式选择大使推荐，后续有问题欢迎联系！）', 1, '2bb181c45f2cc22bfb546ebb5d5249e4', CURRENT_TIMESTAMP
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
  'smartsheet_0134_8f2dc62b', '小米（顶尖人才计划）', '手机/汽车', '27届秋招', '["算法类","硬件研发类","芯片类"]', '["北京","上海","深圳","武汉","南京"]',
  '算法类 、硬件研发类、芯片类', '7AQ2UV5', 'https://xiaomi.jobs.f.mioffice.cn/s/N2fwT_oLnLI', '2026-08-15T08:00:00.000Z', '招满即止', 'active',
  '🌟小米2027届全球校园招聘正式启动！
➡️软件研发类、算法类、 硬件研发类 、芯片类、 产品类、设计类、 市场类 、职能类 、供应链类等等等

➡️base北京、上海 、深圳、 武汉 、西安、 南京、慕尼黑 、新加坡等国内外城市

✅专属内推链接
➡️正式秋招https://xiaomi.jobs.f.mioffice.cn/s/wkOnmIfxVAk
➡️新零售秋招https://xiaomi.jobs.f.mioffice.cn/s/E2SHPRYJLFQ
➡️顶尖人才计划https://xiaomi.jobs.f.mioffice.cn/s/N2fwT_oLnLI

✅专属内推码7AQ2UV5（推荐方式选择大使推荐，后续有问题欢迎联系！）', 1, '8f2dc62b8b8b0b0af905b132081bd8ea', CURRENT_TIMESTAMP
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
  'smartsheet_0135_76af0ce1', '小米（新零售招聘计划）', '手机/汽车', '27届秋招', '["新零售"]', '["全国多地"]',
  '新零售', '7AQ2UV5', 'https://xiaomi.jobs.f.mioffice.cn/s/E2SHPRYJLFQ', '2026-08-15T08:00:00.000Z', '招满即止', 'active',
  '🌟小米2027届全球校园招聘正式启动！
➡️软件研发类、算法类、 硬件研发类 、芯片类、 产品类、设计类、 市场类 、职能类 、供应链类等等等

➡️base北京、上海 、深圳、 武汉 、西安、 南京、慕尼黑 、新加坡等国内外城市

✅专属内推链接
➡️正式秋招https://xiaomi.jobs.f.mioffice.cn/s/wkOnmIfxVAk
➡️新零售秋招https://xiaomi.jobs.f.mioffice.cn/s/E2SHPRYJLFQ
➡️顶尖人才计划https://xiaomi.jobs.f.mioffice.cn/s/N2fwT_oLnLI

✅专属内推码7AQ2UV5（推荐方式选择大使推荐，后续有问题欢迎联系！）', 1, '76af0ce12f473d3db36259f2abdafbec', CURRENT_TIMESTAMP
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
  'smartsheet_0136_8c4cc45a', '舜宇集团', '制造业', '27届秋招', '["结构设计","光学设计","电子设计","软件开发","图像算法处理","工艺技术","销售","市场开发","质量管理等1500+岗位需求"]', '["宁波","中山","杭州","上海"]',
  '结构设计、光学设计、电子设计、软件开发、图像算法处理、工艺技术、销售、市场开发、质量管理等1500+岗位需求', 'DSkqx31C', 'https://app.mokahr.com/m/campus_apply/sunnyoptical/45602?recommendCode=DSkqx31C#/jobs', '2026-08-14T08:00:00.000Z', '招满即止', 'active',
  '中国制造业500强🌟舜宇集团2027届秋招启动
➡️全球领先的综合光学产品制造商，公司成立于1984年，2007年成为第一家在香港联交所主板上市的国内光学企业。连续多年入围《财富》中国500强排行榜。车载镜头、手机摄像模组、手机镜头市占率全球第一
➡️提供住宿/住房补贴+工作餐13薪+年终奖+EVA+年度调薪+五险一金，双休
➡️专业需求：机械、自动化、电子、电气、通信、控制、测控、计算机、软件、物理、光学、外语、人力资源等专业
➡️【热招岗位】结构设计、光学设计、电子设计、软件开发、图像算法处理、工艺技术、销售、市场开发、质量管理等1500+岗位需求
📍 【主要工作地点】宁波余姚、广东中山、浙江杭州、上海、深圳、陕西西安等

✅ 内推链接https://app.mokahr.com/m/campus_apply/sunnyoptical/45602?recommendCode=DSkqx31C#/jobs
✅内推码DSkqx31C', 1, '8c4cc45af5e367275c0a7707e7e23888', CURRENT_TIMESTAMP
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
  'smartsheet_0137_e762d1fd', '百度', '互联网', '27届秋招', '["技术类","产品类","运营类等"]', '["北京","上海","深圳","广州","成都","大连","杭州"]',
  '技术类、产品类、运营类等', 'IZS1K9', 'https://dwz.cn/SCFzP6dE', '2026-08-14T08:00:00.000Z', '招满即止', 'active',
  '百度2027届校园招聘启动！
🔥 AI相关岗位占90%——大模型、智能体、自动驾驶、AI Infra……最硬核的前沿赛道，直接上手！
🔥 来百度，挑大梁——培养复合型人才，跨级晋升的同学中60%来自校招，成长空间拉满！
🔥 投递机制友好——全年开放投递，流程结束可以投递新职业，没有次数限制，相当于“无限复活”！常规校招、AIDU、管培生可以各投1个，流程互不冲突，机会翻三倍！
➡️招聘岗位：技术类、产品类、政企类、销售类、综合类等
毕业时间：2026.9-2027.8
base地：北京/上海/深圳/广州/杭州等全国有岗

✅ 内推码IZS1K9
✅内推链接 https://dwz.cn/SCFzP6dE', 1, 'e762d1fd3050cd730a9cc451c5195dd8', CURRENT_TIMESTAMP
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
  'smartsheet_0138_0170d702', '盛趣游戏', '游戏', '27届秋招', '["研发策划类","程序开发类","综合管理类"]', '["上海市"]',
  '研发策划类、程序开发类、综合管理类', 'DS8pwqbc', 'https://app.mokahr.com/m/campus-recruitment/shengqu/96336?recommendCode=DS8pwqbc&hash=%23%2Fjobs#/jobs', '2026-08-14T08:00:00.000Z', '招满即止', 'active',
  '公司介绍：作为全球领先的游戏开发、运营与发行商，盛趣游戏深耕行业多年，拥有《热血传奇》《龙之谷》等爆款游戏，自研产品占比超 50%，注册用户突破 23 亿，是中国游戏产业的开创者与变革者

 热招岗位：研发策划类、程序开发类、综合管理类，更多岗位可关注招聘官网信息

 公司福利：新升级舒适办公环境、入职即享超长年假、补充商业医疗保险、免费健身房&锻炼课程、节假日精美礼包、技术创造节等，让你在热爱的游戏行业里快乐成长！

工作地点：上海市

【内推链接】
https://app.mokahr.com/m/campus-recruitment/shengqu/96336?recommendCode=DS8pwqbc&hash=%23%2Fjobs#/jobs

内推码：DS8pwqbc【内推简历优先筛选，岗位流程更顺畅】', 1, '0170d70205017446f06dc3646c471a47', CURRENT_TIMESTAMP
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
  'smartsheet_0139_331d95b4', '卧安机器人（校招岗）', '机器人', '27届秋招', '["算法工程师","运营管培生","人力资源专员"]', '["深圳"]',
  '算法工程师、运营管培生、人力资源专员', 'EVKRTK', 'https://woanhome.zhiye.com/campus/jobs?shareId=f70f0966-6795-4433-98aa-a83c588f07a2&shareSource=2', '2026-08-13T08:00:00.000Z', '招满即止', 'active',
  '🔥卧安机器人2027届秋季校园招聘正式启动！

📝【关于卧安】
卧安机器人（OneRobotics，6600.HK） 是全球领先的AI具身家庭机器人系统提供商。2025年12月30日，我们在香港交易所主板挂牌上市，成为“AI具身家庭机器人第一股”。
🏆发明数量全国NO.1 | 🔬研发投入20%+ | 👥研发占比50%+
🎾全球首款AI网球机器人 | 🤖全球首款AI陪伴机器人 | 🏠为家庭场景打造的具身人形智能机器人

🙋【招聘对象】2027届应届生
📖【热招岗位】
算法工程师、运营管培生、人力资源专员

🌱 【成长发展】
定制化培养、导师带教、多元发展路径、动态晋升机制
💰 【薪酬激励】
试用期薪资不打折，每年两次调薪窗口
月度/季度绩效奖金、年终奖及专项激励
🛡️ 【福利保障】
六险一金、体检福利、搬家补贴、生日礼物、法定节假日福利
🍱 【活力生活】
营养餐福利、无限量零食饮料、季度团建经费、羽毛球/网球等兴趣社团
⏰ 【工作时间】
弹性打卡、周末双休

🔗【内推链接】https://woanhome.zhiye.com/campus/jobs?shar', 1, '331d95b4349c538ec1ab14d5cec606d5', CURRENT_TIMESTAMP
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
  'smartsheet_0140_b5babc14', '卧安机器人（实习岗）', '机器人', '日常实习', '["技术类：算法实习生","结构实习生","嵌入式实习生","软件测试实习生","市场类：海外市场实习生","市场营销实习生"]', '["深圳"]',
  '技术类：算法实习生、结构实习生、嵌入式实习生、软件测试实习生
市场类：海外市场实习生、市场营销实习生', 'EVKRTK', 'https://woanhome.zhiye.com/intern/jobs?shareId=7fc0e779-ca08-40a2-9405-5f20ffd548c9&shareSource=2', '2026-08-13T08:00:00.000Z', '招满即止', 'active',
  '🔥卧安机器人「OneRo Star」可转正实习生计划火热进行中！

📝【关于卧安】
卧安机器人（OneRobotics，6600.HK） 是全球领先的AI具身家庭机器人系统提供商。2025年12月30日，我们在香港交易所主板挂牌上市，成为“AI具身家庭机器人第一股”。
🏆发明数量全国NO.1 | 🔬研发投入20%+ | 👥研发占比50%+
🎾全球首款AI网球机器人 | 🤖全球首款AI陪伴机器人 | 🏠全球首款多功能家用机器人

🙋【招聘对象】2027届在校生（优秀可转正）
📖【热招岗位】
技术类：算法实习生、结构实习生、嵌入式实习生、软件测试实习生
市场类：海外市场实习生、市场营销实习生

📈【成长篇——在这里，你将获得】
深度入局核心项目，告别打杂旁观，硬核实战历练
年轻化管理团队，扁平高效氛围，沟通轻松无壁垒
导师带教，全程指引成长
实习转正率高，优秀者提前锁定正式 offer

🎁【薪资福利篇——在这里，你将享受】
丰厚实习薪资 + 季度团建经费 + 营养餐补贴
节日礼品：生日礼物、法定节假日福利
不限量零食饮料 + 羽毛球/篮球兴趣协会
早十晚七弹性上下', 1, 'b5babc14545e83f3179eaa1f61f41de8', CURRENT_TIMESTAMP
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
  'smartsheet_0141_2b502919', '三七互娱', '游戏', '27届秋招', '["游戏策划类","游戏运营类","AI类","技术开发类","职能管理类"]', '["广州","北京"]',
  '游戏策划类、 游戏运营类、 AI类、 技术开发类、 职能管理类', 'DSzrdUrF', 'https://app.mokahr.com/m/campus_apply/37/58016?recommendCode=DSzrdUrF&hash=%23%2Fjobs#/jobs', '2026-08-13T08:00:00.000Z', '招满即止', 'active',
  '【公司介绍】三七互娱是全球TOP20上市游戏公司，中国游戏厂商出海Top3，A股上市公司。

【招聘岗位】技术开发类、游戏策划类、市场推广类、游戏运营类、美术设计类、职能管理类等

【我们提供】行业TOP薪酬、有竞争力的薪酬待遇、住房免息贷款、超长年假、六险一金等

【工作地点】广州、北京、上海

【内推链接】
https://app.mokahr.com/m/campus_apply/37/58016?recommendCode=DSzrdUrF&hash=%23%2Fjobs#/jobs

【内推码】DSzrdUrF

内推投递，简历优先筛选！', 1, '2b5029193e54b62336950277b5480269', CURRENT_TIMESTAMP
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
  'smartsheet_0142_177e7c37', '大参林医药集团', '医药', '27届秋招/往届可投', '["营运类","商品类","新零售类","人力类","财务类"]', '["全国多地"]',
  '营运类、商品类、新零售类、人力类、财务类', 'DSvpx4RR', 'https://app.mokahr.com/m/campus_apply/dslyy/136052?recommendCode=DSvpx4RR&hash=%23%2Fjobs#/jobs', '2026-08-13T08:00:00.000Z', '招满即止', 'active',
  '【关于我们】
✅成立于1999年，是中国具有影响力的药品零售连锁企业（股票代码：603233）
✅门店数量达14074家，获评“中国药店价值榜100强第一名”“中国A股上市企业500强”“2024年度最受大学生欢迎雇主奖”等荣誉

【招聘岗位】
营运类、商品类、新零售类、人力类、财务类

❣️综合年薪12-18万，免费住宿

【工作地点】
职能岗：广州市
营运岗：全国各城市均可安排

【薪酬福利】
❣️五险一金，基础薪资+福利补贴+绩效激励/年终奖/利润分成
💓现代一体化产业园，高级写字楼
🔥提供公寓式宿舍配公司班车接送，还有丰富的多彩的节日活动、团建活动提供快乐保障！

【内推链接】
https://app.mokahr.com/m/campus_apply/dslyy/136052?recommendCode=DSvpx4RR&hash=%23%2Fjobs#/jobs

【专属内推码】DSvpx4RR

🤝大参林医药集团期待你的加入！', 1, '177e7c375d90e29c4c0df3e4344883a6', CURRENT_TIMESTAMP
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
  'smartsheet_0143_21d67ddc', 'OBSBOT寻影', '制造业', '27届秋招', '["算法类","软件类","硬件类","产品类","测试&项目管理类","销售类","管培生类"]', '["成都","深圳","杭州","西安"]',
  '算法类 | 软件类 | 硬件类 | 产品类 | 测试&项目管理类 | 销售类 | 管培生类', 'P67G6GC', 'https://n8r2cr07gk.jobs.feishu.cn/s/wPrfO6AKhqI', '2026-08-13T08:00:00.000Z', '招满即止', 'active',
  'OBSBOT 寻影 · 2027届秋季校园招聘正式启动！

关于我们: 2016年创立于深圳，是AI 影像智能硬件赛道准独角兽 ，公司产品已为全球150多个国家和地区的超百万用户提供服务，团队总人数超过800人，目前已完成 C+ 轮融资 

工作地点：成都/深圳/杭州/西安

 热招岗位：算法类 | 软件类 | 硬件类 | 产品类 | 测试&项目管理类 | 销售类 | 管培生类

薪酬福利：极具竞争力的薪酬：不输一线大厂，丰厚年终，全额高比例公积金

【内推链接】https://n8r2cr07gk.jobs.feishu.cn/s/wPrfO6AKhqI

【内推码】P67G6GC（内推方式选择大使推荐，简历优先筛选）', 1, '21d67ddc6a1487e95885eacd44d6708d', CURRENT_TIMESTAMP
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
  'smartsheet_0144_e7296ce4', '新能安', '新能源', '27届秋招', '["材料","&","电芯研发","电源电子研发","结构研发","IT","大数据","智能制造","工艺质量","项目运营","职能"]', '["厦门","东莞"]',
  '材料 & 电芯研发、电源电子研发、结构研发、IT 大数据、智能制造、工艺质量、项目运营、职能', 'mhdujr', 'https://wecruit.hotjob.cn/SU6618fd381eb8053acd5fc2b9/mc/position/campus?acotycoCode=mhdujr&projectId=505401%2C505501&recruitType=1', '2026-08-13T08:00:00.000Z', '招满即止', 'active',
  '🔥宁德时代+ATL合资，储能/无人机电池全球TOP1，产品覆盖30+国。
👥招聘对象：27 届本 / 硕 / 博应届生，base：厦门

💼岗位方向：
AGT全球顶尖人才项目
▪材料 & 电芯研发｜电源电子研发｜结构研发
▪IT 大数据｜智能制造｜工艺质量｜项目运营职能

✅免费人才公寓 / 住房补贴、园区食堂、核心人才股权激励、无息购房支持+超长带薪年假

【内推链接】https://wecruit.hotjob.cn/SU6618fd381eb8053acd5fc2b9/mc/position/campus?acotycoCode=mhdujr&projectId=505401%2C505501&recruitType=1
【内推码】mhdujr', 1, 'e7296ce4e8593531c9f45599bd07a058', CURRENT_TIMESTAMP
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
  'smartsheet_0145_04f179af', '恒生电子', '金融科技', '27届秋招', '["软件开发类","技术支持类","金融业务研究类","产品运营类","产品售前类","软件测试类"]', '["北京","上海","杭州","武汉","长沙"]',
  '软件开发类 、技术支持类、金融业务研究类	、产品运营类	、产品售前类、软件测试类', 'EZBA8S', 'https://campus.hundsun.com/campus/jobs?shareId=3138bdc7-f8de-4862-84f0-43aa0b9c5d7b&shareSource=2', '2026-08-12T08:00:00.000Z', '招满即止', 'active',
  '【关于恒生】恒生于95年成立，03年上市，在北京、上海、深圳、武汉、南京、香港、新加波等地设有研发中心和子公司。聚焦金融，连续17年入选Fintech100全球金融科技百强榜单，2024年排名第22位，亚洲企业第一。

【招聘岗位】
软件开发类 、技术支持类、金融业务研究类	、产品运营类	、产品售前类、软件测试类

【工作地点】北京、上海、杭州、武汉、长沙

【福利成长】
专属导师辅导/高潜应届生培养/多通道发展/海量学习资源/带薪年假/员工餐厅/年度体检/多元社团/运动场馆/EAP项目等各类福利等你来

【内推链接】
https://campus.hundsun.com/campus/jobs?shareId=3138bdc7-f8de-4862-84f0-43aa0b9c5d7b&shareSource=2

【内推码】EZBA8S（内推投递，简历优先筛选，跟进流程！）', 1, '04f179afe8e288b9a803c48fe20c1f15', CURRENT_TIMESTAMP
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
  'smartsheet_0146_6f1320e1', '搜狐集团', '互联网', '27届秋招', '["算法","研发","产品","运营"]', '["北京","天津"]',
  '算法、研发、产品、运营', 'DS9NZHcV', 'https://app.mokahr.com/m/campus_apply/sohu/5682?recommendCode=DS9NZHcV#/jobs', '2026-08-13T08:00:00.000Z', '招满即止', 'active',
  '搜狐集团2027届秋招启动！

【招聘职位】算法、研发、产品、运营

【工作地点】北京、天津

【入职福利】 
• 法定假期外 享受15天年假、15天年假、15天年假！
• 公司日常福利活动多阳光普照奖多~
• 独栋办公楼，有竞争力的薪资，二十余年技术沉淀

【内推链接】https://app.mokahr.com/m/campus_apply/sohu/5682?recommendCode=DS9NZHcV#/jobs

【内推码】DS9NZHcV（内推简历优先筛选，面试流程加速）', 1, '6f1320e1b904e422cc389718a4cdfbd6', CURRENT_TIMESTAMP
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
  'smartsheet_0147_bc19739b', '滴滴', '互联网', '27届秋招', '["工程","算法","机器人","数据","安全技术","效能管理","产品","商业分析","金融模型","运营","专业职能"]', '["北京","杭州","上海","广州"]',
  '工程/算法/机器人/数据/安全技术/效能管理/产品/商业分析/金融模型/运营/专业职能', 'DSDR3uen', 'https://app.mokahr.com/m/campus_apply/didiglobal/96064?recommendCode=DSDR3uen&hash=%23%2Fjobs#/jobs', '2026-08-12T08:00:00.000Z', '招满即止', 'active',
  '公司简介：滴滴是全球卓越的移动出行科技平台，在亚太、拉美等市场提供网约车、出租车召车、代驾、顺风车等多元化出行服务，并运营车服、外卖、货运等业务

岗位类别：工程/算法/机器人/数据/安全技术/效能管理/产品/商业分析/金融业务/运营/专业职能

工作地点：北京、上海、广州、杭州等15+城市

招聘亮点:覆盖出行、海外业务、金融风控等多条业务线，海量真实业务场景，完善校招培养体系，薪资福利优厚，每人可投递3个岗位！

内推链接：
https://app.mokahr.com/m/campus_apply/didiglobal/96064?recommendCode=DSG3UEmN&hash=%23%2Fjobs#/jobs

内推码：DSG3UEmN（内推简历优先筛选，后续流程跟进~）', 1, 'bc19739b1f0fe6a4ca6e9cf725734cef', CURRENT_TIMESTAMP
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
  'smartsheet_0148_87ce02fe', '高途集团', '教培/互联网', '27届提前批/往届可投', '["素养学习顾问"]', '["郑州","成都","西安","武汉","石家庄"]',
  '素养学习顾问', 'GT123', 'https://jsj.top/f/BIm7xU', '2026-08-12T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】高途教育科技集团（NYSE:GOTU）是一家兼具教育基因和科技驱动力的公司。由陈向东先生在2014年创立，2019年成功在美国纽交所上市，被誉为“全球A轮融资后直接上市的科技教育第一股”。
- 实力背书： 是中国国家跳水队、游泳队、花样游泳队的官方学习合作伙伴。
- 全球影响力： 累计服务近9000万学员，业务遍布全球138个国家和地区。
- 全龄覆盖： 教育产品覆盖儿童、青少年、大学生及成人等全年龄段，提供素质素养、全科规划、国际教育、文旅研学等多元化服务。
 
【招聘岗位】3500+ Offer，覆盖 8大核心职类，研发类、产品类、线上主讲类 / 线下教师类、国际教育类、教学教研类、运营类、顾问二讲类
 
【工作地点】北京、上海、深圳、广州、杭州、成都、武汉、西安、南京等全部24个城市
 
【高途体验】
- 舒适环境： 拥有现代化的办公大厦、共享服务中心、健身房、图书馆和活动中心，让你在工作之余享受生活。
- 双通道发展： 提供清晰的 专业通道 和 管理通道 双轨晋升路径，每年多次晋升机会，机制公开透明，以数据为导向。
- 全面培养： 从“G星球”新伙伴培养体系到“追光', 1, '87ce02fec37ddbcc4a7b80bcc7d1e1c9', CURRENT_TIMESTAMP
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
  'smartsheet_0149_9a4e9e42', '欣旺达', '新能源', '27届秋招', '["研发类","运营类","职能类","营销类"]', '["深圳","惠州","南昌","南京","宜昌","义乌","枣庄","德阳","重庆","匈牙利"]',
  '研发类、运营类、职能类、营销类', 'EVHAB9', 'https://sunwodacampus.zhiye.com/campus/jobs?shareId=b3a7b136-9d44-4e46-919b-fc536f54dc40&shareSource=2', '2026-08-11T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】新能源上市公司欣旺达—全球手机电池pack出货量NO.1、中国民营企业500强第258名、《财富》中国500强，《财富》中国科技50强（欣旺达动力），全球新能源企业500强第17名、全球动力电池一级制造商

【四大职类】研发类/运营类/职能类/营销类

【工作地点】南京/南昌/枣庄/德阳/宜昌/西安/义乌/北京/重庆/深圳/惠州/茂名/泰国

【薪酬福利】
人才股权+多维度奖金+五险一金+提供食宿+带薪年假+员工班车+节日礼品等多维福利

【内推通道】
https://sunwodacampus.zhiye.com/campus/jobs?shareId=b3a7b136-9d44-4e46-919b-fc536f54dc40&shareSource=2

【内推码】EVHAB9（内推投递优先筛选）', 1, '9a4e9e42a8d65b4ca3f84a0af5ddde5f', CURRENT_TIMESTAMP
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
  'smartsheet_0150_9b8e991f', '快手', '互联网', '27届秋招/27届实习', '["游戏类","项目管理类","销售类","算法类","工程类","产品类","运营类","市场类","设计类","职能类","战略分析类"]', '["北京","杭州","上海","深圳","广州"]',
  '游戏类、项目管理类、销售类、算法类、工程类、产品类、运营类、市场类、设计类、职能类、战略分析类', 'campusLEUoiNvbJ', 'https://campus.kuaishou.cn/recruit/campus/e/h5/#/campus/jobs?code=campusLEUoiNvbJ', '2026-08-11T08:00:00.000Z', '招满即止', 'active',
  '🚨【快手27届秋招】正式启动！岗位已官网上线！

热招方向:产品、运营、设计、市场、职能……不限专业，看中能力和潜力！

多元选择：11大类岗位，200+岗位超多选择！

不设上限：无投递次数上限，无限次复活，一次优先投递一个岗位！

优越回报：极具竞争力的薪酬福利，完善的培养/成长机制，伴你一路前行

工作地点：北京、杭州、上海、深圳、广州等城市

【专属内推链接】
https://campus.kuaishou.cn/recruit/campus/e/h5/#/campus/jobs?code=campusLEUoiNvbJ

【内推码】campusLEUoiNvbJ（内推简历筛选快人一步，早投递早offer！）', 1, '9b8e991f5aee5dfc10ddcf65c664afdf', CURRENT_TIMESTAMP
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
  'smartsheet_0151_203c109d', '点点互动-应届生校招', '游戏', '27届秋招', '["策划类","美术类","市场类","技术类","AI相关类","其他类"]', '["北京","上海","深圳","广州","福州","成都"]',
  '策划类	、美术类	、市场类、技术类	、AI相关类 、其他类', 'EVBP2T', 'https://career.centurygames.cn/campus/jobs?shareId=56fc50ae-914a-4614-97a7-32b1e161bffa&shareSource=1', '2026-08-11T08:00:00.000Z', '招满即止', 'active',
  'Elite Program+ 与应届生校招双通道同步开放，两个项目均可投递，互不冲突！每个项目每人三次投递机会！

【公司简介】点点互动全球布局、在休闲游戏、角色扮演游戏、策略游戏3大品类都拥有全球头部游戏，代表作有《无尽冬日》、《奔奔王国》等

【招聘岗位】策划类	、美术类	、市场类、技术类	、AI相关类 、其他类

【福利待遇】极具竞争力的顶尖薪酬福利+签约奖金+入职安置+住房补贴+长期激励

【工作城市】北京 / 上海 / 深圳 / 广州 / 福州 / 成都

【内推链接】
https://career.centurygames.cn/campus/jobs?shareId=56fc50ae-914a-4614-97a7-32b1e161bffa&shareSource=1

【推荐码】EVBP2T（简历优先筛选，后续问题欢迎联系）', 1, '203c109d1c0de31126356d835dbee224', CURRENT_TIMESTAMP
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
  'smartsheet_0152_d01519b1', '点点互动-「Elite Program+」计划', '游戏', '27届秋招', '["技术类","策划类","市场类","AI相关"]', '["北京","上海","广州","深圳"]',
  '技术类、策划类、市场类、AI相关', 'EVBP2T', 'https://career.centurygames.cn/4/jobs?shareId=53b9291b-dff5-4cff-9a12-00f9c828ab96&shareSource=1', '2026-08-11T08:00:00.000Z', '招满即止', 'active',
  '点点互动「Elite Program+」2027届人才计划招聘启动（8月31日前投递免笔试！）

【简介】点点互动全球布局、在休闲游戏、角色扮演游戏、策略游戏3大品类都拥有全球头部游戏，代表作有《无尽冬日》、《奔奔王国》等

【岗位】技术类、策划类、市场类、AI相关

【福利】极具竞争力的顶尖薪酬福利+签约奖金+入职安置+住房补贴+长期激励

【地点】北京、上海、广州、深圳

【内推链接】https://career.centurygames.cn/4/jobs?shareId=53b9291b-dff5-4cff-9a12-00f9c828ab96&shareSource=1

【推荐码】EVBP2T（简历优先筛选，后续问题欢迎联系）', 1, 'd01519b186b44f2a8eccb8c9b2d8d5d7', CURRENT_TIMESTAMP
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
  'smartsheet_0153_a67a400d', '沐瞳科技', '游戏', '27届秋招/日常实习', '["技术岗位","美术岗位","产品岗位","发行岗位","职能岗位"]', '["上海","杭州","马尼拉","北京","深圳"]',
  '技术岗位、美术岗位、产品岗位、发行岗位、职能岗位', 'FF42KAQ', 'https://moonton.jobs.feishu.cn/s/pO9kcITv5Ng', '2026-08-11T08:00:00.000Z', '招满即止', 'active',
  '【关于我们】沐瞳科技是最早一批致力于游戏出海的中国公司，拥有9个全球办公室，15亿+全球注册用户，200+个发行国家和地区。

【招聘岗位】技术、产品、美术、发行、职能

【工作地点】上海、杭州、马尼拉、北京、深圳

【我们提供】极具竞争力的薪资、弹性工作时间、充足的假期和个性化员工福利；定制化培训助你成长；坦诚开放的工作氛围

【内推链接】https://moonton.jobs.feishu.cn/s/pO9kcITv5Ng

【推荐码】FF42KAQ

通过内推链接投递自动计入内推，简历优先筛选，面试流程加快！', 1, 'a67a400ddf9e60f5aab17917b54999ed', CURRENT_TIMESTAMP
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
  'smartsheet_0154_6dc33620', 'WIS凡岛', '电商/快消', '27届秋招', '["日化研发类","广告营销类","市场商务类","日化产品类","财务类","设计类等"]', '["广州"]',
  '日化研发类、广告营销类、市场商务类、日化产品类、财务类、设计类等', 'JPS4A6K', 'https://job.fandow.com/home?pushCode=JPS4A6K', '2026-08-10T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】凡岛是一家以全数据驱动的日化新消费品品牌管理公司，旗下品牌涵盖护肤、洗护及家清三大领域，旗下品牌：WIS、KONO卡厘、赫系、魔渍等。 

【工作地点】广州黄埔区，交通便利，环境优雅

【招聘岗位】管培生、研发类、营销类、 供应类、运营类、IT技术类、财务类、职能类等，岗位年薪18w起，更多岗位详情见网申链接

【内推链接】
https://job.fandow.com/home?pushCode=JPS4A6K

【内推码】JPS4A6K

一键投递，内推简历优先筛选，直达面试官！', 1, '6dc33620cfdbd92ec74bc61aaac9538a', CURRENT_TIMESTAMP
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
  'smartsheet_0155_0714a409', 'CVTE视源股份', '制造业', '27届秋招', '["制造质量类","供应链类","软件类","硬件类","算法类","商务类","设计类","职能类"]', '["广州","合肥","西安","武汉","青岛","苏州"]',
  '制造质量类、供应链类、软件类、硬件类、算法类、商务类、设计类、职能类', 'CVTECSXX(先选择招聘信息来源为【内部推荐】，再填写内推码，简历优先筛选)', 'https://campus.cvte.com', '2026-08-10T08:00:00.000Z', '招满即止', 'active',
  'CVTE视源股份2027校招启动！
【公司简介】A 股上市公司 ，希沃seewo、MAXHUB等行业领军品牌，福布斯出海TOP30，连续四年营收超200亿， 10大国内产业园 、6 家海外子公司，专利授权量超 11300 件

【招聘岗位】制造质量类、供应链类、软件类、硬件类、算法类、商务类、设计类、职能类

【薪酬福利】能力定薪，年度服务奖，绩效奖金，多项补贴！免费星级自助三餐+班车+代租公寓，健康管理中心、健身房、恒温泳池、影院等园区配套

【工作地点】
广州、苏州、合肥、西安、重庆

【网申链接】
https://campus.cvte.com

【内推码】CVTECSXX(先选择招聘信息来源为【内部推荐】，再填写内推码，简历优先筛选)', 1, '0714a409c2512efaf888cd7d26d8db76', CURRENT_TIMESTAMP
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
  'smartsheet_0156_c5a8f0c9', '得物', '电商/互联网', '27届秋招', '["技术类","运营类","供应链类","设计类","商品研究类","职能类","风控类","产品类","数据分析类"]', '["上海","杭州","成都","贵阳","长沙","广州","沈阳","廊坊","武汉","咸阳"]',
  '技术类、运营类、供应链类、设计类、商品研究类、职能类、风控类、产品类、数据分析类', 'H4HSD9J', 'https://poizon.jobs.feishu.cn/s/chQ9bWfF9QQ', '2026-08-10T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】得物App2015年在上海成立，是新一代潮流网购社区，开创性地推出了"先鉴别，再发货"的购物流程，目前注册用户超5亿，《2024年·胡润全球独角兽榜》，得物估值高达710亿元。

【招聘岗位】技术类、运营类、供应链类、设计类、职能类、商品研究类、风控类、产品类、数据分析类

【工作城市】上海、杭州、成都、贵阳、长沙、广州、沈阳、廊坊、武汉、咸阳

【内推链接】
https://poizon.jobs.feishu.cn/s/chQ9bWfF9QQ

【内推码】H4HSD9J（内推简历优先筛选，流程问题欢迎联系）

【校招内推合集+真题题库+面试经验+答题思路】
2027届校招内推合集（欢迎收藏分享）', 1, 'c5a8f0c942cab139fcc1f92964c0a5f4', CURRENT_TIMESTAMP
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
  'smartsheet_0157_d1e57052', '思特威', '科技/芯片半导体', '27届秋招', '["技术类","运营类","职能类"]', '["上海","苏州"]',
  '技术类、运营类、职能类', 'DSPdUrWp', 'https://app.mokahr.com/m/campus_apply/smartsenstech1/56088?recommendCode=DSPdUrWp&hash=%23%2Fjobs#/jobs', '2026-08-10T08:00:00.000Z', '招满即止', 'active',
  '【关于我们】
✅在上海证券交易所科创板上市（股票代码：688213）
✅ 中国IC风云榜 - 年度独角兽公司，在多个城市及国家设有研发公司
✅安防监控&机器视觉Global Shutter应用领域市场占有率全球领先
✅产品覆盖安防监控、机器视觉、智能车载电子等多场景应用领域的全性能需求
✅技术成果曾获国际固态电路峰会ISSCC认可

【校招类别】技术类、运营类、职能类

【工作地点】上海、苏州

【你将收获】
✅上海快速落户通道，前沿技术资源支持，完善的应届生培养体系
✅有竞争力的薪资，国际化平台视野，丰富的员工福利
✅专业导师带教，各色体育俱乐部，年度旅游
✅每月餐补，加班餐，股权激励计划，打车报销，零食无限量供应，各式节日礼品

【内推链接】https://app.mokahr.com/m/campus_apply/smartsenstech1/56088?recommendCode=DSPdUrWp&hash=%23%2Fjobs#/jobs

【内推码】DSPdUrWp（内推简历优先筛选！）', 1, 'd1e57052c84af98071696c949ef19ff3', CURRENT_TIMESTAMP
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
  'smartsheet_0158_d8d4628d', '地平线', '智能驾驶', '27届秋招', '["算法","芯片","软件","硬件","测试","系统安全","设计","财务等"]', '["北京","上海","南京","杭州","成都","西安","深圳","香港"]',
  '算法、芯片、软件、硬件、测试、系统安全、设计、财务等', 'rbfvbi', 'https://wecruit.hotjob.cn/SU62d915040dcad43c775ec12c/mc/position/campus?acotycoCode=rbfvbi&projectId=103302&recruitType=1&isLimitShowPostScope=1', '2026-08-10T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】地平线是市场领先的乘用车高级辅助驾驶和高阶智能驾驶解决方案供应商。
我们有1900+全球知识产权布局；1500+智驾软硬件方向研发人员

【招聘岗位】算法、芯片、软件、硬件、测试、系统安全、设计等 

【岗位城市】 北京、上海、南京、杭州、成都、西安、深圳、香港等

【内推链接】https://wecruit.hotjob.cn/SU62d915040dcad43c775ec12c/mc/position/campus?acotycoCode=rbfvbi&projectId=103302&recruitType=1&isLimitShowPostScope=1

【内推码】rbfvbi（内推简历优先筛选）', 1, 'd8d4628d59e4fcba1913c999a4e98e5e', CURRENT_TIMESTAMP
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
  'smartsheet_0159_e12a2bf4', '阿里灵犀互娱', '游戏', '27届秋招', '["策划","技术","美术","产品","运营","营销","项目管理","服务体验"]', '["广州","上海","北京"]',
  '策划 、技术、美术 、产品 、运营、营销、项目管理、 服务体验', '通过左侧内推链接投递灵犀互娱的岗位，自动计入内推，无需填写内推码；通过该内推链接投递阿里其他公司的岗位不计入内推。', 'https://campus-talent.alibaba.com/campus/position?campusShareCode=K_v0JrdUmKBKUmhFGVdZ73OlUoW6Iy%2FZKsr2kb6kRq0%3D&batchId=100000540002', '2026-08-10T08:00:00.000Z', '招满即止', 'active',
  '公司介绍：灵犀互娱隶属于阿里巴巴集团，是中国领先的数字娱乐研发商，旗下包括游戏自研工作室，以及九游、交易猫、BiuBiu等多个专业游戏运营子品牌

招聘岗位：策划 | 技术 | 美术 | 产品 | 运营 | 营销 | 项目管理 | 服务体验等

工作地点：广州/上海/北京

福利待遇：极具竞争力的薪酬福利、节日礼金、年度体检等；完善的校招生培养体系，资深导师指导等

【内推码】11RH65

【内推链接】
https://go.lingxigames.com/s/RXXTfi
通过内推链接投递灵犀互娱的岗位，自动计入内推，无需填写内推码；通过该内推链接投递阿里其他公司的岗位不计入内推。', 1, 'e12a2bf400d1206ae608dd19690f0db2', CURRENT_TIMESTAMP
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
  'smartsheet_0160_42609ad8', '深蓝互动', '游戏', '27届秋招', '["美术大佬","技术大神","策划鬼才","运营能手","市场达人"]', '["广州"]',
  '美术大佬、技术大神、策划鬼才、运营能手、市场达人', 'DSvcMPQC', 'https://app.mokahr.com/m/campus_apply/blueinteractive/38434?recommendCode=DSvcMPQC#/jobs', '2026-08-10T08:00:00.000Z', '招满即止', 'active',
  '【关于深蓝】深蓝互动首款产品《重返未来:1999》2023年全球公测，上线即登游戏畅销榜第3、免费榜第1，2024年全球下载用户突破3000万
 
【工作地点】广州
 
【招聘岗位】美术支持类、研发技术类、游戏策划类、发行运营类、产品支持类、公共职能类
 
【深蓝福利】
年度服务奖金，年度绩效奖金，年度薪酬回顾，周末双休，五险一金(公积金全额买)，外加商业保险，年度体检，不限量零食+饮料+咖啡+每周下午茶供应，用餐补贴，入职培训，新人导师
入职礼包，季度团建，周年活动，节假日各种礼包礼品,全勤奖金,超长年假，生日礼金，司龄礼品等
 
【内推通道】https://app.mokahr.com/m/campus_apply/blueinteractive/38434?recommendCode=DSvcMPQC#/jobs

【内推码】DSvcMPQC（内推简历优先筛选！）', 1, '42609ad8a570a1ad7519ae682d24b939', CURRENT_TIMESTAMP
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
  'smartsheet_0161_f42eacae', '巨人网络', '游戏', '27届秋招', '["游戏策划","游戏开发","游戏美术","运营发行","项目管理","职能"]', '["上海市"]',
  '游戏策划 / 游戏开发 / 游戏美术 / 运营发行 / 项目管理 / 职能', 'DSRurSQ8', 'https://app.mokahr.com/m/campus_apply/ztgame/92438?recommendCode=DSRurSQ8#/jobs', '2026-08-10T08:00:00.000Z', '招满即止', 'active',
  '公司简介:巨人网络是国内领先的A股上市游戏公司，长期坚持自主研发精品化战略，在国战MMO和休闲竞技等核心赛道深耕，打造了多款国民级产品，覆盖用户超过10亿人。

六大岗位：游戏策划 / 游戏开发 / 游戏美术 / 运营发行 / 项目管理 / 职能

工作地点:上海市

为什么值得投：爆款项目实战机会 ；有竞争力的薪资， 一年两次调薪机会；环境顶配，福利拉满，吃穿住行都安排好了，入职就可入住员工宿舍；完善培养体系 + 开放创作环境 ！

【内推链接】https://app.mokahr.com/m/campus_apply/ztgame/92438?recommendCode=DSRurSQ8#/jobs

【内推码】DSRurSQ8（简历优先筛选，流程加速！）', 1, 'f42eacae5d23f88195e44e2d6623ec7b', CURRENT_TIMESTAMP
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
  'smartsheet_0162_4aca5c73', 'ZURU（校招岗）', '外企/快消', '27届秋招', '["商科","创意","设计","研发","制造"]', '["广州","上海","深圳","东莞","惠州","中山"]',
  '商科、创意、设计、研发、制造', 'smwkew', 'https://wecruit.hotjob.cn/SU69fd8f7f1f17c372512fdd19/mc/position/campus?acotycoCode=smwkew&projectId=100501&recruitType=1&isLimitShowPostScope=1', '2026-08-10T08:00:00.000Z', '招满即止', 'active',
  '【关于ZURU】全球排名前十玩具外企，在全球拥有超过 5000 名雇员，设有32个办事处和国际办公室，核心的office 在中国，深圳为研发中心，产品远销121个国家和地区，年销售额超20亿美元。

【招聘亮点】外企待遇+工作WLB，六险一金包吃住+双休！带薪撸宠，入职旅行，朝九晚六还能弹性上班！

【招聘岗位】商科、创意、设计、研发、制造五大类岗位等你来投！

【Base地】广州、上海、深圳、东莞、惠州、中山

【校招内推链接】
https://wecruit.hotjob.cn/SU69fd8f7f1f17c372512fdd19/mc/position/campus?acotycoCode=smwkew&projectId=100501&recruitType=1&isLimitShowPostScope=1
【实习内推链接】
https://wecruit.hotjob.cn/SU69fd8f7f1f17c372512fdd19/mc/position/intern?acotycoCode=llsmgh&projectId=100201&recruitType=12&isLim', 1, '4aca5c738054e0749930d986186059aa', CURRENT_TIMESTAMP
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
  'smartsheet_0163_db8b6749', 'ZURU（实习岗）', '外企/快消', '日常实习', '["职能类"]', '["广州","上海","深圳","东莞","惠州","中山"]',
  '职能类', 'llsmgh', 'https://wecruit.hotjob.cn/SU69fd8f7f1f17c372512fdd19/mc/position/intern?acotycoCode=llsmgh&projectId=100201&recruitType=12&isLimitShowPostScope=1', '2026-08-10T08:00:00.000Z', '招满即止', 'active',
  '【关于ZURU】全球排名前十玩具外企，在全球拥有超过 5000 名雇员，设有32个办事处和国际办公室，核心的office 在中国，深圳为研发中心，产品远销121个国家和地区，年销售额超20亿美元。

【招聘亮点】外企待遇+工作WLB，六险一金包吃住+双休！带薪撸宠，入职旅行，朝九晚六还能弹性上班！

【招聘岗位】商科、创意、设计、研发、制造五大类岗位等你来投！

【Base地】广州、上海、深圳、东莞、惠州、中山

【校招内推链接】
https://wecruit.hotjob.cn/SU69fd8f7f1f17c372512fdd19/mc/position/campus?acotycoCode=smwkew&projectId=100501&recruitType=1&isLimitShowPostScope=1
【实习内推链接】
https://wecruit.hotjob.cn/SU69fd8f7f1f17c372512fdd19/mc/position/intern?acotycoCode=llsmgh&projectId=100201&recruitType=12&isLim', 1, 'db8b67496f5334a2648f3d4cce5edd9d', CURRENT_TIMESTAMP
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
  'smartsheet_0164_c6f2fcbb', 'Garena', '游戏', '27届秋招', '["产品&运营类","PM&策划类","技术开发类","美术&表现类"]', '["上海市"]',
  '产品&运营类、PM&策划类、技术开发类、美术&表现类', 'DSyr8a7u', 'https://app.mokahr.com/m/campus_apply/garena/148076?recommendCode=DSyr8a7u&hash=%23%2Fjobs#/jobs', '2026-08-09T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】
Sea是全球领先的消费互联网企业。三大核心业务涵盖电子娱乐Garena、电子商务Shopee和数字金融Monee
Garena是全球领先的在线游戏开发商和发行商。自研自发的大逃杀类型手机游戏《Garena Free Fire》已连续七年蝉联该类型全球下载量榜首。该游戏也多次成为全球下载量最高的手机游戏

【招聘岗位】
🈶产品&运营类、PM&策划类、技术开发类、美术&表现类

【福利关怀】
✅补充医疗保险，年度体检
✅Garena学院、年度学习经费
✅15天带薪年假+14天带薪病假，弹性上下班时间
✅协助落户上海、兴趣社团、节日礼品等

【内推链接】https://app.mokahr.com/m/campus_apply/garena/148076?recommendCode=DSCeKKBe#/jobs

【内推码】DSCeKKBe（内推简历优先筛选，面试流程加快！）', 1, 'c6f2fcbb4ffd2fdfb7d258b5365d5a12', CURRENT_TIMESTAMP
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
  'smartsheet_0165_ee556c95', '蚂蚁集团', '互联网', '27届秋招/日常实习', '["技术","运营","产品","风险管理","设计","数据","金融类"]', '["杭州","北京","上海","深圳","成都","重庆","武汉","广州"]',
  '技术、运营、产品、风险管理、设计、数据、金融类', '通过内推链接投递即可', 'https://hrrecommend.antgroup.com/job-list.html?source=campus_external_recommend&code=9WUKwSiFYoQz6V7DNnLiNTXzBEovnIkIGj3ze2CMnLw%3D', '2026-08-09T08:00:00.000Z', '招满即止', 'active',
  '蚂蚁集团2027校招内推通道开启！

【公司简介】蚂蚁起步于支付宝，致力于数字支付和数字金融，现已成为世界领先的互联网开发平台。

【招聘岗位】技术、产品、运营、数据、风险管理等

【工作地点】杭州、北京、上海、深圳、成都、重庆、武汉、广州等

【内推通道】
https://hrrecommend.antgroup.com/job-list.html?source=campus_external_recommend&code=9WUKwSiFYoQz6V7DNnLiNTXzBEovnIkIGj3ze2CMnLw%3D
通过上方内推链接投递，无需填写内推码，自动计入内推！简历优先筛选，面试流程更快！', 1, 'ee556c95d090a4a70179924e7d3f7de7', CURRENT_TIMESTAMP
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
  'smartsheet_0166_6f7113fe', '拓竹科技', '制造业', '27届秋招/日常实习', '["供应链","产品","市场","销售运营","零售","物流","技术支持","客户关系","职能支持","机械","硬件","系统测试","力学","光学","算法","嵌入式","软件","材料","数据","信息安全","项目管理","包装"]', '["深圳","上海","北京","武汉","杭州","惠州"]',
  '供应链、产品、市场、销售运营、零售、物流、技术支持、客户关系、职能支持、机械、硬件、系统测试、力学、光学、算法、嵌入式、软件、材料、数据、信息安全、项目管理、包装', '8V1YFPF', 'https://bambulab.jobs.feishu.cn/s/zRK7D2h6BRw', '2026-08-09T08:00:00.000Z', '招满即止', 'active',
  '【企业简介】全球消费级3D打印革命领导者，国内增长和盈利最快的独角兽之一

【研发&非研发校招职位全面开启】
机械、硬件、系统测试、力学、光学、算法、嵌入式、软件、材料、数据、信息安全、项目管理、包装、供应链、产品、市场、销售运营、零售、物流、技术支持、客户关系、职能支持等

【工作地点】深圳、上海、北京、武汉、杭州、惠州

【薪酬福利】
超一线互联网大厂的工资薪酬，年终奖在硬件科技公司中遥遥领先；
六险一金、免费水果/饮料/零食、丰富团建及下午茶、节日礼品、全薪病假、年度体检；
研发氛围浓厚，重点是可畅玩3D打印，实现手办自由！！

【内推通道】
https://bambulab.jobs.feishu.cn/s/zRK7D2h6BRw

【内推码】8V1YFPF（推荐方式选择大使推荐，内推投递，简历第一时间送到HR面前！）', 1, '6f7113fe621e17b60c933ec9ed5cd19c', CURRENT_TIMESTAMP
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
  'smartsheet_0167_07ba99e4', '阿里云智能集团瓴羊', '互联网', '27届秋招', '["AI","Agent研发工程师","AI产品经理","数据科学家","大模型应用算法工程师","FDE(前沿部署工程师)"]', '["杭州","北京"]',
  'AI Agent研发工程师、AI产品经理、数据科学家、大模型应用算法工程师、FDE(前沿部署工程师)', 'WSZHM62（务必填写内推码，通过链接极速投递，简历直达面试官，不需要再去阿里巴巴官网网申！offer快人一步！
）', 'https://alidocs.dingtalk.com/notable/share/form/v01eYVOL5ozy48eAlpz_dv19yqvsgs3oebp3pcjys_1qX0QQ0?utm_source=qrcode_form&source=qrcode', '2026-08-09T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】专注企业DaaS，推出的智能体服务(Agent)能够在不同场景中实现精准的数据洞察和业务支持，已有超20个行业，5万家企业携手瓴羊开启AI时代的企业数智化增长。

【招聘岗位】AI研发类、算法类、AI技术服务类、数据类

【base】杭州/北京

【极速网申链接】
https://alidocs.dingtalk.com/notable/share/form/v018oLl952zDVX9klap_dv19yqvsgs3oebp3pcjys_1qX0QQ0
通过链接极速投递，简历直达面试官，不需要再去阿里巴巴官网网申！offer快人一步！

【内推码】WSZHM62（务必填写内推码，简历优先筛选，流程加快）', 1, '07ba99e4f51df36b2357fadd6b5dd565', CURRENT_TIMESTAMP
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
  'smartsheet_0168_74a92ea6', '睿创微纳', '芯片半导体', '27届秋招', '["算法类","芯片研发","硬件电路类","半导体工艺类","软件嵌入式类","测试可靠性类","机械光学结构类","市场产品职能类"]', '["烟台","苏州","合肥","无锡","重庆","上海","成都","西安","武汉多地可选"]',
  '算法类、芯片研发 / 硬件电路类、半导体工艺类、软件嵌入式类、测试可靠性类、机械光学结构类、市场产品职能类', 'EVKMB0', 'https://raytrontek1.zhiye.com/campus/jobs?shareId=73a31824-bf97-41c2-8ffb-6c13053ca1f0&shareSource=2', '2026-08-09T08:00:00.000Z', '招满即止', 'active',
  '公司简介】科创板上市硬科技企业，深耕多维感知 + AI融合创新，布局红外、微波、激光三大感知技术赛道，是国内非制冷红外热成像领域绝对领军企业

【招聘岗位】算法类、芯片研发 / 硬件电路类、半导体工艺类、软件嵌入式类、测试可靠性类、机械光学结构类、市场产品职能类

【Base】烟台、苏州、合肥、无锡、重庆、上海、成都、西安、武汉等多地可选

【内推链接】https://raytrontek1.zhiye.com/campus/jobs?shareId=73a31824-bf97-41c2-8ffb-6c13053ca1f0&shareSource=2

【推荐码】EVKMB0（内推简历优先筛选，后续流程问题欢迎联系）', 1, '74a92ea666f44eeb0e5ada25caa12b3d', CURRENT_TIMESTAMP
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
  'smartsheet_0169_b1f59d16', '迅雷', '互联网', '27届秋招/日常实习', '["技术类","运营类","产品类","设计类"]', '["深圳","北京","香港"]',
  '技术类、运营类、产品类、设计类', 'DS9mfNE4', 'https://app.mokahr.com/m/campus-recruitment/xunlei/26600?recommendCode=DS9mfNE4&hash=%23%2Fjobs#/jobs', '2026-08-09T08:00:00.000Z', '招满即止', 'active',
  '公司简介：迅雷成立于2003年，于纳斯达克上市，是一家全球领先的去中心化服务商，以技术构建商业，以服务创造共识，从而建立一个高效可信的存储与传输网络

热招岗位：技术类、运营类、产品类、设计类

工作地点：深圳、北京、香港

福利待遇：有竞争力的薪资、企业礼金类福利、节日福利、年度旅游、节日活动、员工专享优惠、各类团建、各类专业培训

【内推链接】https://app.mokahr.com/m/campus-recruitment/xunlei/26600?recommendCode=DS9mfNE4&hash=%23%2Fjobs#/jobs

内推码：DS9mfNE4

内推投递简历优先筛选，面试流程加快，后续有任何问题可以随时联系！', 1, 'b1f59d16a6dd4f05a1b1541329d24133', CURRENT_TIMESTAMP
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
  'smartsheet_0170_27f2c90b', '中芯国际', '芯片半导体', '27届秋招', '["技术研发类","电路设计类","工艺工程类","设备管理类","智能制造类","软件算法类","质量管理类","工程支持类","职能支持类"]', '["上海","北京","天津","深圳"]',
  '技术研发类、电路设计类、工艺工程类、设备管理类、智能制造类、软件算法类、质量管理类、工程支持类、职能支持类', 'SZ06', 'https://smics.zhiye.com/campus', '2026-08-08T08:00:00.000Z', '招满即止', 'active',
  '中芯国际2027届校园招聘正式启动

tips：每位同学可投递6个2027届校招职位（含所有城市）投递后无法修改

【我们是】世界领先的集成电路制造业领军企业，总部位于中国上海，拥有全球化的制造和服务基地

【岗位需求】技术研发类、电路设计类、工艺工程类、设备管理类、智能制造类、软件算法类、质量管理类、工程支持类、职能支持类

【工作地点】上海、北京、天津、深圳

【投递链接】https://smics.zhiye.com/campus
【大使内推码】SZ06
（内推简历优先筛选，进程加速）', 1, '27f2c90b1f1b667ee2e1b43436482912', CURRENT_TIMESTAMP
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
  'smartsheet_0171_ad775204', '哔哩哔哩', '互联网', '27届秋招', '["技术类","产品运营类","内容类","游戏类","市场营销类","大职能类"]', '["上海","北京","深圳","新加坡"]',
  '技术类、产品运营类、内容类、游戏类、市场营销类、大职能类', 'H490ZN', 'https://jobs.bilibili.com/campus/positions?token=ca072e63-1373-4cce-a8f5-07126b2b2de5&page=1', '2026-08-05T08:00:00.000Z', '招满即止', 'active',
  '哔哩哔哩2027届秋招正式开启！
 
【关于B站】哔哩哔哩是国内头部年轻人文化视频社区，纳斯达克+港交所双重上市企业，月活3.63亿，覆盖知识、国创、游戏、直播、电商、虚拟偶像全赛道，是千万创作者与年轻人的创意沃土，在这里兴趣能变成事业。
 
【热招全品类岗位】
技术类、产品运营类、内容类游戏类市场营销类大职能类
 
【工作地点】上海、北京、深圳、新加坡
 
【B站专属福利】
1. 24个月B-STAR校招专属培养：一对一带教、双通道晋升、系统化课程，全程护航应届生成长
2. 宠物友好办公：可带猫狗上班，治愈办公氛围
3. 完善薪酬保障：行业竞争力薪资、年终奖、带薪年假
4. 趣味员工福利：免费下午茶、节日限定周边、漫展门票、线下活动、年度体检
 
【内推链接】https://jobs.bilibili.com/campus/positions?token=ca072e63-1373-4cce-a8f5-07126b2b2de5&page=1

【内推码】H490ZN（内推简历优先筛选，面试流程加快）', 1, 'ad775204ef876619295d8791e7d710d5', CURRENT_TIMESTAMP
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
  'smartsheet_0172_f3629039', '联想集团（hc多）', '消费电子', '27届秋招', '["产品与项目","技术","市场与销售","职能","供应链","设计"]', '["北京","上海","深圳","天津","武汉","成都","广州","杭州"]',
  '产品与项目、技术、市场与销售、职能、供应链、设计', '2027XZLMXX【内推入口】在“联想校招官网”投递校招职位，创建简历时在我的简历-其他中“从哪儿获知招聘信息”选择“联想员工推荐”并且输入推荐人itCode：2027XZLMXX
内推简历优先筛选，面试流程加快！', 'https://talent.lenovo.com.cn/home', '2026-08-04T08:00:00.000Z', '招满即止', 'active',
  '联想集团2027届秋招启动！

联想是一家成立于中国、年收入超过4100亿人民币、业务遍及180个市场的全球化科技公司。

【招聘岗位】产品与项目、技术、市场与销售、职能、供应链、设计等六大方向，总有适合你的！

【20+工作地点】北京、上海、深圳、天津、武汉、成都、广州、杭州、南京、厦门、长沙、郑州、济南、沈阳、哈尔滨、昆山、南宁等

【网申链接】
https://talent.lenovo.com.cn/home

【内推码】2027XZLMXX
之前在联想校招官网已创建过简历的需要重新创建简历才能填写内推码进入内推！

【内推入口】在“联想校招官网”投递校招职位，创建简历时在我的简历-其他中“从哪儿获知招聘信息”选择“联想员工推荐”并且输入推荐人itCode：2027XZLMXX
内推简历优先筛选，面试流程加快！', 1, 'f3629039ddb4a3c547ac9b4c55369ea1', CURRENT_TIMESTAMP
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
  'smartsheet_0173_27e267b9', '阿里淘宝闪购', '互联网/物流', '27届秋招', '["风险策略运营","AI商业分析师","商品运营","整合营销专员","用户运营","AI应用研发工程师","AI应用算法工程师","AI体验设计师","AI视觉设计师","AI","Infra工程师","算法工程师","安全技术工程师","数据科学家","AI产品经理","AI产品运营"]', '["北京","杭州","上海"]',
  '风险策略运营、AI商业分析师、商品运营、整合营销专员、用户运营、AI应用研发工程师、AI应用算法工程师、AI体验设计师、AI视觉设计师、AI Infra工程师、算法工程师、安全技术工程师、数据科学家、AI产品经理、AI产品运营', '通过左侧内推链接投递淘宝闪购的岗位，自动计入内推，无需填写内推码；通过该内推链接投递阿里其他公司的岗位不计入内推。', 'https://campus-talent.alibaba.com/campus/position?campusShareCode=64ASJpc4VPgjiLII1Mk5H4Cus_0df4q5Fk5unniUT2YBWVed_rPEoMZ7XbzhY47V&batchId=100000760001', '2026-08-04T08:00:00.000Z', '招满即止', 'active',
  '淘宝闪购27届应届生招聘启动！

✅ 招聘岗位：AI应用研发工程师、AI应用算法工程师、AI体验设计师、AI视觉设计师、AI Infra工程师、算法工程师、安全技术工程师、数据科学家、AI产品经理、AI产品运营、风险策略运营、AI商业分析师、商品运营、整合营销专员、用户运营

✅ base地：北京、杭州、上海

为什么选择淘宝闪购？
✅ 大平台：行业领先，成长空间无限！
✅ 强培养：师兄带教，专属培训计划！
✅ 超nice团队：扁平化管理，年轻活力氛围！

【内推码】2T51PADD
【内推链接】https://campus-talent.alibaba.com/campus/position?campusShareCode=64ASJpc4VPgjiLII1Mk5H4Cus_0df4q5Fk5unniUT2YBWVed_rPEoMZ7XbzhY47V&batchId=100000760001
通过上方内推链接投递淘天的岗位，自动计入内推，无需填写内推码！面试流程加速！', 1, '27e267b951248393acb51a6390586bdf', CURRENT_TIMESTAMP
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
  'smartsheet_0174_393b0cfe', '阿里淘天集团', '互联网', '27届秋招', '["技术类（算法","工程","数研）","产品类","设计类","运营类","营销类","数据类","风险管理类"]', '["杭州","北京"]',
  '技术类（算法/工程/数研）、产品类、设计类、运营类、营销类、数据类、风险管理类', '通过左侧内推链接投递淘天集团的岗位，自动计入内推，无需填写内推码；通过该内推链接投递阿里其他公司的岗位不计入内推。', 'https://campus-talent.alibaba.com/campus/position?campusShareCode=qd8GPq_HNhVzrIjdM8q3lCiMtmQO7G_W4c5P6dyUbuaj_hqWFQazKoGJS0GhiZpC&batchId=100000760001', '2026-08-04T08:00:00.000Z', '招满即止', 'active',
  '淘天集团2027届秋招正式启动！

【加入淘天，你将拥有】
✅ 超强成长：1V1师兄带教，技术大牛护航，快速突破职场天花板！
✅ 硬核福利：行业领先薪酬+交通补贴+餐饮补贴+住宿支持，实习无忧！
✅ 前沿探索：60+岗位方向（技术/产品/设计/等），新增大量AI类岗位，让热爱与趋势同行！
【公司简介】淘天集团是阿里巴巴核心引擎，旗下淘宝、天猫、天猫国际、淘宝直播等业务领跑全球电商。
【工作地点】杭州/北京
【内推码】2T4L7MMH
【内推链接】https://campus-talent.alibaba.com/campus/position?campusShareCode=qd8GPq_HNhVzrIjdM8q3lCiMtmQO7G_W4c5P6dyUbuaj_hqWFQazKoGJS0GhiZpC&batchId=100000760001
通过上方内推链接投递淘天的岗位，自动计入内推，无需填写内推码！面试流程加速！', 1, '393b0cfe6951d5afbb2498dea3fa79b3', CURRENT_TIMESTAMP
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
  'smartsheet_0175_cfc1f4f0', '阿里云', '互联网', '27届秋招', '["研发类","算法类","销售类","安全类","产品类","设计类","运营类","风险管理类"]', '["杭州｜北京｜上海｜成都｜广州｜香港｜新加坡｜西雅图全球20+城市开放"]',
  '研发类、算法类、销售类 、安全类、产品类、设计类、运营类、风险管理类', '通过左侧内推链接投递阿里云的岗位，自动计入内推，无需填写内推码；通过该内推链接投递阿里其他公司的岗位不计入内推。', 'https://campus-talent.alibaba.com/campus/position?campusShareCode=bYQ3kD4ZZflQxD%2F278e7XNkeuPaoM09SOULCRKpVfEjFxquk5wiI_EziG4M1zFEB&batchId=100000760001', '2026-08-04T08:00:00.000Z', '招满即止', 'active',
  '阿里云2027届秋季校园招聘即将启动！

【关于阿里云】阿里云创立于2009年，是全球领先的云计算及人工智能科技公司，是亚太第一、中国最大的公共云服务提供商

【岗位方向】研发类｜算法类｜销售类 | 安全类 | 产品类 | 设计类 | 运营类 | 风险管理类

【工作地点】杭州｜北京｜上海｜成都｜广州｜香港｜新加坡｜西雅图等全球20+城市开放

【内推数字码】1DAIOR

【内推链接】https://campus-talent.alibaba.com/campus/position?campusShareCode=bYQ3kD4ZZflQxD%2F278e7XNkeuPaoM09SOULCRKpVfEjFxquk5wiI_EziG4M1zFEB&batchId=100000760001
通过上方内推链接投递阿里云的岗位，自动计入内推，无需填写内推码！面试流程加速！', 1, 'cfc1f4f0b1ada72cd7a17a376fd4d88d', CURRENT_TIMESTAMP
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
  'smartsheet_0176_d828adbe', '米哈游', '游戏', '27届秋招/日常实习', '["程序&技术类","美术&表现类","产品策划类","质量管理类:","运营类","市场&商务类","综合类","国际化类"]', '["上海","北京"]',
  '程序&技术类、美术&表现类、产品策划类、质量管理类:、运营类、市场&商务类、综合类、国际化类', '25BW', 'https://jobs.mihoyo.com/m/?recommendationCode=25BW&isRecommendation=true#/campus/position', '2026-08-02T08:00:00.000Z', '招满即止', 'active',
  '米哈游2027秋季校园招聘&实习生专项启动啦！

八大通道全覆盖，超多校招&实习岗位等你来投！不限专业！
 
【岗位类型】
程序&技术类、美术&表现类、产品策划类、质量管理类、国际化类、 市场&商务类、运营类、综合类。
 
【面向人群】
应届生：2027届毕业生
实习生：2028届及以后毕业的在校生
 
【关于实习】
①不限专业，低年级/0实习经验也可投递
②丰厚实习薪资+大量实习留用机会，提前锁定校招Offer
 
【内推通道】
https://jobs.mihoyo.com/m/?recommendationCode=25BW&isRecommendation=true#/campus/position

【内推码】25BW（内推投递，简历优先筛选，面试流程加快！）
 
快来加入米哈游，一起踏上拯救世界的旅程吧！', 1, 'd828adbef5be27549c1cfa60d6b8c645', CURRENT_TIMESTAMP
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
  'smartsheet_0177_98ec0cc5', '京东', '互联网/电商', '27届秋招/日常实习', '["采销方向","产品方向","健康方向","物流方向","运营方向","工程方向","技术方向","设计方向","职能方向","保险与金融方向","市场与商务方向"]', '["北京","上海","广州","深圳","成都","武汉","杭州"]',
  '采销方向、产品方向、健康方向、物流方向、运营方向、工程方向、技术方向、设计方向、职能方向、保险与金融方向、市场与商务方向', 'XK113Y', 'https://campus.jd.com/api/wx/position/index#/?emplErp=XK113Y', '2026-08-02T08:00:00.000Z', '招满即止', 'active',
  '京东2027新星计划校园招聘全面启动！（专属内推码：XK113Y）

🔥海量校招岗位，多元业务方向
🔥五年培养计划，长期主义人才培养
🔥广阔业务平台，实战中飞速成长
🔥极具竞争力的薪酬福利，成长后顾无忧

采销岗位不限专业，各专业方向均可投递！

技术岗位超多方向，丰富技术场景等你探索！

【投递链接】
电脑端：campus.jd.com
手机端：https://campus.jd.com/api/wx/position/index#/?emplErp=XK113Y

【内推码】XK113Y（记得填写专属内推码，简历更容易被看见哦！）', 1, '98ec0cc508ff88c1066b71c47031ab85', CURRENT_TIMESTAMP
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
  'smartsheet_0178_42a52253', 'Shopee虾皮', '互联网/跨境电商', '27届秋招', '["研发类（算法","测试","开发","安全","项目经理","大数据","AI","工程师）","-产品与设计类（产品经理","运营","设计","IT","审计合规）","-职能类（人力","行政）"]', '["深圳","北京","上海"]',
  '研发类（算法、测试、开发、安全、项目经理、大数据、AI 工程师）
-产品与设计类（产品经理、运营、设计、IT 审计合规）
-职能类（人力、行政）', 'DSC8JF9W', 'https://app.mokahr.com/m/campus_apply/shopee/2962?recommendCode=DSC8JF9W&hash=%23%2Fjobs#/jobs', '2026-07-30T08:00:00.000Z', '招满即止', 'active',
  'Shopee虾皮2027届秋招正式启动！

【关于我们】Shopee是领航跨境电商平台，业务覆盖东南亚与拉美10+市场，触达超10亿消费者。Shopee研发中心自2017年成立以来，目前已涵盖电商、供应链、O2O、金融等多元业务方向。

【热招岗位】
-研发算法类（算法类、测试、开发、安全、项目经理、大数据、AI 工程师）
-产品与设计类（产品经理、运营、设计、IT 审计合规）
-职能类（人力、行政）

【工作地点】深圳、北京、上海

【我们提供】有竞争力的薪资水平+充足的福利与关怀+完善的培训体系

内推链接：
https://app.mokahr.com/m/campus_apply/shopee/2962?recommendCode=DSJNb6BE&hash=%23%2Fjobs#/jobs

内推码：DSJNb6BE（内推链接优先筛选，加速流程推荐）', 1, '42a522532c75da2beef2fdd049353070', CURRENT_TIMESTAMP
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
  'smartsheet_0179_5075a92d', '4399游戏', '游戏', '27届秋招', '["策划类","开发类","美术类","运营市场类","职能类"]', '["广州"]',
  '策划类、开发类、美术类、运营市场类、职能类', '9ueia', 'https://hr.4399om.com/weixin/?r=job/agent&type=2&isOpen=0&jobTableType=1&code=9ueia', '2026-07-30T08:00:00.000Z', '招满即止', 'active',
  '4399游戏2027届校招启动！

✅全球领先的中文娱乐平台之一，连续12年中国互联网企业百强前50强 
✅拥有多款亿级流水、百万DAU游戏作品
✅薪酬待遇：策划/市场运营类 25-45w+ ，其他类岗20-40w+，还有专属SSP
✅专属大牛导师、快速成长通道、项目高额奖金、六险一金保障…
✅独栋江景办公楼、大牛导师带教、兴趣俱乐部、带薪假期，超多福利等你来解锁！

招聘岗位：产品类、技术类、美术类、运营市场类、职能类

工作地点：广州市

内推链接：
https://hr.4399om.com/weixin/?r=job/agent&type=2&isOpen=0&jobTableType=1&code=9ueia

【内推码】9ueia
⚠️务必通过内推投递，简历免筛选直通笔试，快人一步斩获offer！', 1, '5075a92d4601c18839f817d707b84cea', CURRENT_TIMESTAMP
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
  'smartsheet_0180_be4bbd3a', '柠檬微趣', '游戏', '27届秋招', '["游戏开发","数据分析","游戏策划","后台","运维","测试","运营等"]', '["北京市"]',
  '游戏开发、数据分析、游戏策划、后台、运维、测试、运营等', 'NTAmT3s（注意大小写）', 'https://app.mokahr.com/su/efxllo', '2026-07-30T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】2025年中国出海手游发行商收入 Top 3，合成赛道手游全球 Top 1 ，研发发行《宾果消消消》《浪漫餐厅》《梦幻旅行》等爆款手游

【春招岗位】岗位全覆盖！游戏开发、数据分析、游戏策划、后台、运维、测试、运营等，总有一款适合你！

【工作地点】北京市
  
【薪酬福利】行业顶级薪资水平 ，健康作息文化，拒绝恶性内卷式加班 ，应届生北京落户 ，应届生免费住宿， 免费早晚餐 ，七险一金 ， 年度全员带薪旅行，免费健身房等

【内推链接】https://app.mokahr.com/su/efxllo

【内推码】NTAmT3s（内推投递，简历优先筛选，一周极速offer！）', 1, 'be4bbd3aac63f570b0361483ae08db5b', CURRENT_TIMESTAMP
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
  'smartsheet_0181_f6d404de', '招商银行·招银网络', '金融科技', '27届秋招', '["后端开发工程师","前端开发工程师","算法工程师","测试开发工程师","运维研发工程师","数据开发工程师","移动端开发工程师"]', '["深圳","杭州","成都"]',
  '后端开发工程师、 前端开发工程师、算法工程师、测试开发工程师、运维研发工程师、数据开发工程师、移动端开发工程师', 'MWLWTF', 'https://cmbnt.cmbchina.com/pages/bindInvited.html?qrCode=CEA9A9E2831F4C01B4724A7C7A48EE02&rand=1785380174329&blNtCode=MWLWTF', '2026-07-30T08:00:00.000Z', '招满即止', 'active',
  '招商银行·招银网络科技2027届秋招启动

【关于我们】招银网络科技成立于2002年，是招商银行全资子公司、总行软件中心

【招聘岗位】后端开发工程师/前端开发工程师/算法工程师/测试开发工程师/智能运维研发工程师

【工作地点】深圳、杭州、成都

【内推链接】
https://cmbnt.cmbchina.com/pages/bindInvited.html?qrCode=CEA9A9E2831F4C01B4724A7C7A48EE02&rand=1785380174329&blNtCode=MWLWTF

【内推码】MWLWTF（内推简历优先筛选，加速流程推进）

【27届校招内推合集】
2027届校招内推合集（欢迎收藏分享）', 1, 'f6d404ded1e8fd0a3b60dfb5e3817c40', CURRENT_TIMESTAMP
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
  'smartsheet_0182_f2a6dc79', '四方股份', '能源电力', '27届提前批/26届可投', '["硬件研发类","软件算法类","测试开发类"]', '["北京","南京","武汉","保定","湖州","海外"]',
  '硬件研发类、软件算法类、测试开发类', 'EVKPVH', 'https://sf-auto1.zhiye.com/campus/jobs?shareId=dcfb8b9e-8eba-49cd-bf73-5b900f038fbc&shareSource=2', '2026-07-29T08:00:00.000Z', '招满即止', 'active',
  '四方股份2027届校招提前批全面启动！

【公司简介】电力自动化龙头企业（股票代码601126），院士创办，深耕新型电力系统、新能源、储能赛道，4000+员工，超1/3研发人员，业务覆盖全球90+国家。
 
【招聘岗位】硬件研发类、软件算法类、测试开发类
 
【提前批专属通道】HC充足、面试流程快、不影响秋招正式批投递，双倍拿offer机会

【福利待遇】
✅ 完善培养：校招专属「云帆计划」，一对一导师带教，技术/管理双通道晋升
✅ 行业顶配福利：八险一金、交通通讯补贴、无息购房借款、北京落户指标、博士后工作站、年度体检、婚育礼金、团建基金

【工作地点】北京、南京、武汉、保定、湖州海外岗位同步开放

【内推链接】https://sf-auto1.zhiye.com/campus/jobs?shareId=88d6c6b3-6950-44e5-ac3c-54acbde918b8&shareSource=2

【内推码】EVVP1H（简历优先筛选，面试流程加快）', 1, 'f2a6dc795aeee28dba93a5afe75f5dbc', CURRENT_TIMESTAMP
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
  'smartsheet_0183_33228863', '聚宽量化', '量化投资', '27届秋招/27届实习', '["投研类：AI","算法研究员","量化研究员（CTA","股票因子","基本面","其他方向）","技术类：量化开发工程师","职能类：基金运营专员","产品策略专员","市场营销专员"]', '["北京（总部）","上海","广州","深圳"]',
  '投研类：AI 算法研究员、量化研究员（CTA / 股票因子 / 基本面 / 其他方向）
技术类：量化开发工程师
职能类：基金运营专员、产品策略专员、市场营销专员', 'DSvaDH5P', 'https://app.mokahr.com/m/campus-recruitment/joinquant/92347?recommendCode=DSvaDH5P&hash=%23%2Fjobs#/jobs', '2026-07-28T08:00:00.000Z', '招满即止', 'active',
  '聚宽量化2027届校招启动【部分岗位实习薪资1000-2000元/天】

关于我们：聚宽（JoinQuant）是一家基于金融市场大数据通过量化研究、人工智能等技术，不断挖掘规律、优化算法、精益模型，开展量化投资的私募基金管理人，管理资金规模百亿+，公司多次获得中国私募金牛奖、英华奖金长江奖等行业殊荣。

岗位类别：投研、IT岗、产品、职能等

工作地点：北京、上海、深圳、广州

福利待遇：投研&IT岗实习薪资1000-2000元/天、广阔成长空间、丰厚补贴福利（生日会下午茶、水果零食饮品无限量）、丰富技术资源等

内推链接：
https://app.mokahr.com/m/campus-recruitment/joinquant/92347?recommendCode=DSvaDH5P&hash=%23%2Fjobs#/jobs

内推码：DSvaDH5P（内推简历优先筛选，如有疑问/流程问题欢迎联系）

【27届校招内推合集】
2027届校招内推合集（欢迎收藏分享）', 1, '33228863af234017b4f291d19b7a741f', CURRENT_TIMESTAMP
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
  'smartsheet_0184_194b5997', '合合信息', '人工智能', '27届秋招', '["算法","技术","产运","设计","职能"]', '["上海","苏州","广州"]',
  '算法、技术、产运、设计、职能', 'ESVM89', 'https://intsig.zhiye.com/campus/jobs?shareId=fe41530e-6b2f-4bf8-8110-eae32dcf2cb3&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-07-26T08:00:00.000Z', '招满即止', 'active',
  '合合信息2027届校招全面启动！ 

【公司简介】合合信息(688615.SH) 是中国领先的人工智能产品公司，19年深耕AI领域，C端产品与B端服务布局矩阵完善，用户遍布全球200个国家和地区，部分合合信息明星产品包括扫描全能王 、名片全能王、启信宝等

🏌多领域岗位等你来！
算法、技术、产品、运营、设计、职能，统统满足你的潜能！
💪极具竞争力的薪酬、飞速成长路径、极致创新氛围，这一次，统统拿下！

【工作地点】上海、苏州、广州等

【内推链接】https://intsig.zhiye.com/campus/jobs?shareId=fe41530e-6b2f-4bf8-8110-eae32dcf2cb3&shareSource=2&qr=1&memory=%7B%7D&silence=1

【内推码】ESVM89（内推投递，简历筛选快人一步）', 1, '194b59976e10cc4f96225fcead732f5f', CURRENT_TIMESTAMP
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
  'smartsheet_0185_437a50e9', 'MiniMax （hc多）', 'AI', '27届秋招/日常实习', '["研发","运营","产品","设计"]', '["北京","上海","全球remote"]',
  '研发、运营、产品、设计', 'MJMNS4C', 'https://vrfi1sk8a0.jobs.feishu.cn/s/asR1WdbhB4c', '2026-07-26T08:00:00.000Z', '招满即止', 'active',
  'MiniMax（大模型第一股）2027届招聘启动！

【公司简介】MiniMax是全球领先的通用人工智能科技公司，市值超2500亿港元，自研多模态大模型包括MiniMax M2.1、Hailuo 2.3、Speech 2.6和Music 2.0等，产品包括MiniMax Agent、海螺AI、星野等，覆盖200多个国家和地区

【招聘岗位】研发、运营、产品

【工作地点】北京、上海、深圳

【福利待遇】
✅ 行业顶尖薪资+免费三餐
✅ 近距离接触AI前沿技术
✅ 大佬带飞+快速成长通道

【内推链接】
https://vrfi1sk8a0.jobs.feishu.cn/s/asR1WdbhB4c

【内推码】MJMNS4C（推荐方式选择大使推荐，简历筛选加速，面试流程加快！）', 1, '437a50e941b7209031f1700743b800f6', CURRENT_TIMESTAMP
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
  'smartsheet_0186_b0ff858c', '新东方', '教培', '27届秋招/26届可投', '["教师"]', '["深圳"]',
  '教师', '8QOED87', 'https://z2u.tv/adPRcD', '2026-07-27T08:00:00.000Z', '招满即止', 'active',
  '15-40w首年综合年薪
深圳新东方提前批开始招聘啦！专业不限，26-27届可投！

📍来了就是深圳人，深圳新东方欢迎你！
💥高薪offer发给你15-40w
💥双休+六险一金+超多福利
💥免费培训、包住宿、报大交通、培训补贴

❗️内推链接：https://z2u.tv/adPRcD

❗️【内推码】 8QOED87（内推投递后初筛后直通复试）', 1, 'b0ff858c4d7f2d83831ad62f77b15c63', CURRENT_TIMESTAMP
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
  'smartsheet_0187_ad406016', '高标科技', '制造业', '27届秋招', '["研发类","销服类","供应类","职能类"]', '["东莞","天津","重庆","无锡","徐州","台州","德国","印尼","越南"]',
  '研发类、销服类、供应类、职能类', 'ESKM3G', 'https://kjgb.zhiye.com/campus/jobs?shareId=f26679f3-4178-46fd-bea6-f056e1c1a7a4&shareSource=2', '2026-07-23T08:00:00.000Z', '招满即止', 'active',
  '【我们是谁】
👉二轮车电控的业界"大佬"，市占率50%以上！
👉热门出海赛道，ebike-三电系统新势力！
----------
🌍国际化平台，格局打开
🚀全方位培养，火箭晋升

【岗位需求】研发类、销服类、供应类、职能类

【薪酬福利】
💡五险一金、周末双休、带薪年假、报到礼金、食宿安排、节假日礼品等
💡薪酬待遇：研发类硕士21~35万/年，本科&非研发类12-21万/年；派驻海外岗位额外补贴1.4万+/月!

【工作地点】东莞/天津/重庆/无锡/徐州/台州/德国/印尼/越南等

【内推链接】
https://kjgb.zhiye.com/campus/jobs?shareId=f26679f3-4178-46fd-bea6-f056e1c1a7a4&shareSource=2

【内推码】ESKM3G(简历优先筛选，后续流程问题欢迎联系)', 1, 'ad406016dcd37954fc5b39c39ff69997', CURRENT_TIMESTAMP
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
  'smartsheet_0188_5eb76110', '科大讯飞-常规校招', '人工智能', '27届秋招/26届可投', '["研究算法类","研发类","AI研发类","大数据类","产品类","测试类","营销类","教育类","设计类","职能类","资源类","医学类","工程类","交付类"]', '["全国多地"]',
  '研究算法类、研发类、AI研发类、大数据类、产品类、测试类、营销类、教育类、设计类、职能类、资源类、医学类、工程类、交付类', 'ESKTA1', 'https://iflytek.zhiye.com/campus/jobs?shareId=d8f85552-8f3b-4bce-a33b-38a01a1ca6fe&shareSource=2', '2026-07-23T08:00:00.000Z', '招满即止', 'active',
  '【人工智能国家队】科大讯飞2027秋招全面启动！

放宽毕业时间，25-27届皆可投递，不限专业，职等你来！

招聘岗位：研究算法类、研发类、AI研发类、大数据类、产品类、测试类、营销类、教育类、设计类、职能类、资源类、医学类、工程类、交付类

我们提供：顶尖人工智能产业平台，极具挑战的业务课题；极具竞争力的薪酬和福利；双导师带教机制；定制化、宽视野的发展路径

【工作地点】全国多地

【内推链接】
https://iflytek.zhiye.com/campus/jobs?shareId=d8f85552-8f3b-4bce-a33b-38a01a1ca6fe&shareSource=2

【内推码】ESKTA1（内推简历优先筛选，面试流程加快）', 1, '5eb76110c8dca3c2343397d7c073df62', CURRENT_TIMESTAMP
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
  'smartsheet_0189_6c4f94ec', '科大讯飞-飞凡计划', '人工智能', '27届秋招', '["产品","研发","营销"]', '["合肥"]',
  '产品、研发、营销', 'ESKTA1', 'https://iflytek.zhiye.com/5/jobs?shareId=161d2c43-c15e-4d0f-89cd-43430d1aa119&shareSource=2', '2026-07-23T08:00:00.000Z', '招满即止', 'active',
  '【人工智能国家队】科大讯飞飞凡计划招聘启动！
【项目亮点】25-27届可投，专业不限，飞凡计划免笔试，推进速度更快！
【招聘岗位】产品、研发、营销
【工作地点】合肥
【我们提供】顶尖人工智能产业平台，极具挑战的业务课题；极具竞争力的薪酬和福利；双导师带教机制；定制化、宽视野的发展路径
【内推链接】https://iflytek.zhiye.com/5/jobs?shareId=161d2c43-c15e-4d0f-89cd-43430d1aa119&shareSource=2
【内推码】ESKTA1 （内推简历优先筛选，加速流程推进！）
﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌
【特别说明】飞凡计划和其他项目不冲突，可以重复投递，但同期只可以推进一个项目下的一个岗位的面试流程', 1, '6c4f94ec1613952e6c43a86621cf6619', CURRENT_TIMESTAMP
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
  'smartsheet_0190_12401585', '科大讯飞-飞星计划', '人工智能', '27届秋招', '["AI研究算法工程师(多方向)"]', '["合肥","北京","西安","广州","上海"]',
  'AI研究算法工程师(多方向)', 'ESKTA1', 'https://iflytek.zhiye.com/4/jobs?shareId=4a0797f9-530d-40de-86d4-40bf1279fdbd&shareSource=2', '2026-07-23T08:00:00.000Z', '招满即止', 'active',
  '【人工智能国家队】科大讯飞2027届飞星计划启动！

招聘岗位：AI研究算法工程师(多方向)

工作地点：合肥/北京/西安/广州/上海

我们提供：顶尖人工智能产业平台，极具挑战的业务课题；极具竞争力的薪酬和福利；双导师带教机制；定制化、宽视野的发展路径

【内推链接】
https://iflytek.zhiye.com/4/jobs?shareId=4a0797f9-530d-40de-86d4-40bf1279fdbd&shareSource=2

内推码：ESKTA1 （内推简历优先筛选，加速流程推进！）', 1, '12401585aa418318d9ae1c215e5714d1', CURRENT_TIMESTAMP
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
  'smartsheet_0191_06d25d91', '平行线教育', '教培', '27届秋招', '["主讲教师(数学","物理","化学","英语)","数学","物理竞赛教练"]', '["北京","郑州","西安","成都","深圳"]',
  '主讲教师(数学/物理/化学/英语)、数学/物理竞赛教练', 'ESVYVK', 'https://zzpxx.zhiye.com/campus/jobs?shareId=42fbda52-06d2-47bd-9827-cc71692f4ca8&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-07-23T08:00:00.000Z', '招满即止', 'active',
  '25-27届可投！✨平行线教育 2027 校招｜给想深耕教育的你
拒绝销售内卷，回归教学本身！

💼招聘岗位
▪竞赛教练 / 清北教师：保底年薪 40‑100W
▪菁英教师（数 / 理 / 化 / 英）：综合年薪 20‑40W
▪主讲教师（数 / 理 / 化 / 英）：综合年薪 14‑30W
▪高中寒暑假助教：日薪 400‑500 元
📍北京 / 郑州 / 西安 / 成都 / 深圳等二十多城市可选

✅零招生指标，专注教学教研
✅保底薪资协议，收入有保障
✅专业线 + 管理线双通道晋升
✅六险一金、带薪假期、免费岗前培训，考研考公上岸无违约！

⏰流程：网申‑筛选‑初试‑复试‑签约入职

网申链接：https://zzpxx.zhiye.com/campus/jobs?shareId=42fbda52-06d2-47bd-9827-cc71692f4ca8&shareSource=2&qr=1&memory=%7B%7D&silence=1

【内推码】ESVYVK

面向2025‑2027 届，欢迎热爱教育的同学投递，期待与你相遇！', 1, '06d25d91523a126a7e8047866c938949', CURRENT_TIMESTAMP
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
  'smartsheet_0192_11855959', '影石Insta360', '消费电子', '27届秋招/27届实习', '["技术类","产品类","业务类","综合类","艺术类","供应链类"]', '["深圳","上海","珠海"]',
  '技术类、产品类、业务类、综合类、艺术类、供应链类', 'WEY8MJP', 'https://arashivision.jobs.feishu.cn/s/G5RgvpVWYDU', '2026-07-22T08:00:00.000Z', '招满即止', 'active',
  '独角兽【影石Insta360】2027秋季校园招聘启动！

✅全景相机全球市场占有率NO.1，影像行业龙头！产品远销全球200+国家和地区，营收规模在五年内翻10倍！

✅Work-Life Balance！边上班还能边减肥？边看海？边喝酒？边健身？在影石工作太酷啦！

【职位类别】技术类、产品类、业务类、综合类、艺术类、供应链类

【工作地点】深圳、上海、珠海

【内推链接】
https://arashivision.jobs.feishu.cn/s/G5RgvpVWYDU

【内推码】WEY8MJP（推荐方式选择大使推荐）

内推简历优先处理，6大类别，35种岗位，100+职位，职等你来！', 1, '11855959961d5b492a5edbec3b435d3f', CURRENT_TIMESTAMP
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
  'smartsheet_0193_7094e39c', '网易游戏（互娱）', '游戏', '27届秋招/27届实习', '["策划","技术","美术","用户体验","市场","运营","测试","项目管理等多类别"]', '["广州","杭州","上海"]',
  '策划 / 技术 / 美术 / 用户体验/市场/运营/测试/项目管理等多类别', 'Q5zose', 'https://campus.game.163.com/?referralCode=Q5zose', '2026-07-20T08:00:00.000Z', '招满即止', 'active',
  '网易游戏（互娱）2027届校园招聘正式启动！

在这里，热爱游戏就是最好的入场券！

✅ 面向 2027 届毕业生，广州/杭州/上海多base地可选
✅ 多元岗位，总有你心仪：策划 / 技术 / 美术 / 测试 / 用户体验 / 市场 / 运营 / PM 等多类岗位

✅《蛋仔派对》《燕云十六声》《第五人格》《漫威争锋》……超多爆款游戏出自我们~
✅业内第一梯队薪酬 · 多元风格爆款项目 · 金牌培训体系 · 重视新人想法——为你的职业起点保驾护航

【内推链接】https://campus.game.163.com/?referralCode=Q5zose

【内推码】Q5zose（立享直通笔试或简历优先筛选）', 1, '7094e39c45e62dd2e232da990fd57a66', CURRENT_TIMESTAMP
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
  'smartsheet_0194_8f731407', '普渡机器人-28届实习', '机器人', '28届实习', '["软件类","硬件类","机械结构类","项目类","测试类","设计类","产品类","销售类","解决方案&技术支持类","供应链类"]', '["深圳","成都","其他国内外城市"]',
  '软件类	、硬件类	、机械结构类	、项目类	、测试类	、设计类	、产品类	、销售类	、解决方案&技术支持类	、供应链类', 'EVVRR0', 'https://pudutech1.zhiye.com/intern/jobs?shareId=c380f828-92d3-4d09-b049-bb33dedea847&shareSource=2', '2026-07-17T08:00:00.000Z', '招满即止', 'active',
  '普渡机器人27届校招&28届实习正式启动

【关于普渡】商用服务机器人领域市占率TOP1，行业首家完成机器人3大形态布局，世界四大工业设 奖大满贯，企业专利数1842件(含申请中)，国家级专精特新重点“小巨人”企业，福布斯中国·出海 球化品牌TOP30，深圳/成都/香港 3大研发中心，自研体系成熟

【岗位类别】算法类、	软件类	、硬件类	、机械结构类	、项目类	、测试类	、设计类	、产品类	、销售类	、解决方案&技术支持类	、供应链类

【工作地点】深圳、成都、其他国内外城市

【27届校招内推链接】https://pudutech1.zhiye.com/campus/jobs?shareId=b67a4454-fd00-45d7-824d-2ada995db588&shareSource=2
【28届实习内推链接】
https://pudutech1.zhiye.com/intern/jobs?shareId=c380f828-92d3-4d09-b049-bb33dedea847&shareSource=2

【推荐码】EVVRR0（内推简历优先筛选，面试流程加速）', 1, '8f731407401bd18e58d8e659b367ed01', CURRENT_TIMESTAMP
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
  'smartsheet_0195_06be5918', '卓驭-领航者计划', '智能驾驶', '27届秋招', '["多模态大模型预训练","后训练","世界模型","端到端领航算法","训练推理优化","几何重建等算法岗"]', '["深圳","上海","北京","香港"]',
  '多模态大模型预训练/后训练、世界模型、端到端领航算法、训练推理优化、几何重建等算法岗', 'EZ38HK', 'https://we.zyt.com/5/jobs?shareId=6cadaa92-f998-4e79-a591-a4879117e00d&shareSource=2', '2026-07-16T08:00:00.000Z', '招满即止', 'active',
  '智驾独角兽-卓驭2027「领航者」顶尖人才计划启动！
 
【领航者计划亮点】
 ✅ 前沿赛道：主攻物理AI多模态大模型、世界模型闭环仿真、分布式训练推理优化
✅ 顶配资源：数万卡训练集群、海量真实路测数据、1v1行业大牛导师带教
✅ 落地场景：乘用车/商用车/通用移动机器人全场景量产定点，科研不做纸上谈兵
✅ 顶尖待遇：SP/SSP专项薪酬、股权激励、核心项目核心席位，快速成长技术骨干
 
【热招方向】多模态大模型预训练/后训练、世界模型、端到端领航算法、训练推理优化、几何重建等算法岗

【工作地点】深圳/上海/北京/香港

【内推链接】
https://we.zyt.com/5/jobs?shareId=6cadaa92-f998-4e79-a591-a4879117e00d&shareSource=2

【内推码】EZ38HK（简历优先筛选，后续流程欢迎联系）', 1, '06be591832455739d23e69c1803984c1', CURRENT_TIMESTAMP
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
  'smartsheet_0196_0a874ff7', '高途集团', '教培/互联网', '27届提前批/日常实习', '["研发类","产品类","线上主讲类","线下教师类","国际教育类","教学教研类","运营类","顾问二讲类"]', '["北京","郑州","武汉","成都","西安","上海","深圳"]',
  '研发类、产品类、线上主讲类 / 线下教师类、国际教育类、教学教研类、运营类、顾问二讲类', 'DS6yCBud', 'https://app.mokahr.com/m/campus-recruitment/bjhl/102145?recommendCode=DS6yCBud&hash=%23%2Fjobs#/jobs', '2026-06-29T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】高途教育科技集团（NYSE:GOTU）是一家兼具教育基因和科技驱动力的公司。由陈向东先生在2014年创立，2019年成功在美国纽交所上市，被誉为“全球A轮融资后直接上市的科技教育第一股”。
- 实力背书： 是中国国家跳水队、游泳队、花样游泳队的官方学习合作伙伴。
- 全球影响力： 累计服务近9000万学员，业务遍布全球138个国家和地区。
- 全龄覆盖： 教育产品覆盖儿童、青少年、大学生及成人等全年龄段，提供素质素养、全科规划、国际教育、文旅研学等多元化服务。
 
【招聘岗位】3500+ Offer，覆盖 8大核心职类，研发类、产品类、线上主讲类 / 线下教师类、国际教育类、教学教研类、运营类、顾问二讲类
 
【工作地点】北京、上海、深圳、广州、杭州、成都、武汉、西安、南京等全部24个城市
 
【高途体验】
- 舒适环境： 拥有现代化的办公大厦、共享服务中心、健身房、图书馆和活动中心，让你在工作之余享受生活。
- 双通道发展： 提供清晰的 专业通道 和 管理通道 双轨晋升路径，每年多次晋升机会，机制公开透明，以数据为导向。
- 全面培养： 从“G星球”新伙伴培养体系到“追光', 1, '0a874ff719264c4cdb979657fb18dd8c', CURRENT_TIMESTAMP
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
  'smartsheet_0197_89652752', '同花顺', '金融科技', '27届实习/日常实习', '["研发类","产品类","设计类","算法类","金融业务类","数据类"]', '["杭州"]',
  '研发类、产品类、设计类、算法类、金融业务类、数据类', 'FC2357', 'http://campus.10jqka.com.cn/job/list?recommendCode=FC2357&code=021mFBll2XVzrh4Tt7ll2bXbcm1mFBlU&state=', '2026-06-28T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】同花顺（300033），国内首家互联网金融信息服务上市公司，5000+员工规模，坐拥国家级博士后科研工作站等顶尖研发平台，旗下APP用户行业第一，覆盖95%券商、90%基金公司。深耕AI领域十余年，千卡算力集群+数万亿金融对话数据，数百个大模型落地多元业务场景，构筑硬核技术数据护城河！
 
加入我们，你将拥有：
✅行业顶级平台：证券类APP TOP1，服务近6亿投资者，七大投资赛道全金融业务实践
✅前沿技术赋能：百万并发架构+分布式计算筑牢根基，AI智能投研+大数据可视化驱动创新
✅AI多元布局：聚焦金融科技，拓展AIGC、智慧医疗等领域，万亿数据积累+海量大模型应用落地
✅专属成长通道：顶尖导师1V1带教，清晰发展路径，真实业务场景历练，高价值项目经验加持，你的成果影响亿万用户！
 
【热招岗位】研发类、产品类、设计类、算法类、金融业务类、数据类

【工作地点】杭州
 
【内推链接】http://campus.10jqka.com.cn/job/list?recommendCode=FC2357&code=021mFBll2XVzrh4Tt7ll2bXbcm1mFBlU&', 1, '89652752bb4a78629bb314c6bc379bc9', CURRENT_TIMESTAMP
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
  'smartsheet_0198_4f6f0660', '杜蕾斯 | 曼伦', '外企/快消', '27届实习', '["会计","HR（IT","内容运营","主播岗位即将开放实习机会","敬请关注）"]', '["北京","上海","广州","成都"]',
  '会计、HR（IT、内容运营、主播岗位即将开放实习机会，敬请关注）', 'DSJFmdWw', 'https://app.mokahr.com/m/campus_apply/manon/164365?recommendCode=DSJFmdWw#/jobs', '2026-06-21T08:00:00.000Z', '招满即止', 'active',
  '快消巨头-曼伦2027届暑期实习正式开启！

【公司介绍】99年成立，现为英国利洁时集团在华合资公司，总部位于上海，在广州、北京、香港、台北、新加坡设有公司或分公司。在中国和东南亚运营众多行业领先品牌，包括杜蕾斯、滴露、益节等。

📍mentor带教、含金量超高的快消certificate—有趣尽兴也能满载而归～
📍办公室地铁站旁，出门商场，工区健身房&咖啡机自由
📍正式offer：Nice薪资待遇、超长年假、六险一金、弹性打卡
🎟实习岗位：会计、HR（IT、内容运营、主播岗位即将开放实习机会，敬请关注）

欢迎使用专属内推渠道，简历直达HR，评选竞争力+++

【内推通道】https://app.mokahr.com/m/campus_apply/manon/164365?recommendCode=DSJFmdWw#/jobs

【内推码】DSJFmdWw（后续问题欢迎联系）', 1, '4f6f06607a731c62b78bab3db96e7959', CURRENT_TIMESTAMP
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
  'smartsheet_0199_7d82ebad', '云和恩墨', '科技', '27届实习', '["销售实习生"]', '["北京","天津","上海","苏州","南京","杭州","南昌","合肥"]',
  '销售实习生', 'NTAX9Wq', 'https://app.mokahr.com/m/campus-recruitment/enmotech/47098#/home', '2026-06-16T08:00:00.000Z', '招满即止', 'active',
  '业内领先数据大厂 | 云和恩墨27届销售实习生招聘启动！

关于我们：云和恩墨创立于2011年，是业界领先的“智能的数据技术提供商”公司总部位于北京，在国内外35个地区设有本地办公室并开展业务。

招聘岗位：销售实习生

薪酬福利：965不加班、竞争力薪酬（20w+）、数据大厂全面培养、多方位福利、年度晋升（每年都有晋级的机会，比例高达80%以上，远超于同行业公司晋级比例）等

工作岗位：岗位遍布全国，支持内部城市转岗。

【网申链接】
https://app.mokahr.com/m/campus-recruitment/enmotech/47098#/home

【推荐码】NTAX9Wq
通过推荐码投递，简历优先筛选（1个工作日反馈），有2次笔试机会！', 1, '7d82ebad1c9400657ed863072d70a7f9', CURRENT_TIMESTAMP
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
  'smartsheet_0200_04bf6856', '宇通集团（宇通客车）', '汽车', '27届提前批', '["人力管培生","研发管培生","生产管理管培生","供应链管培生","营销管培生","财务管培生等"]', '["郑州"]',
  '人力管培生、研发管培生、生产管理管培生、供应链管培生、营销管培生、财务管培生等', 'ppbpzc', 'https://wecruit.hotjob.cn/SU64e7157a1eb80519a8e4efcf/mc/position/campus?acotycoCode=ppbpzc&postIdsStr=248403%2C248404%2C248405%2C248406%2C248407%2C248408%2C248409%2C248410%2C235575&recruitType=1&isLimitShowPostScope=1', '2026-06-09T08:00:00.000Z', '招满即止', 'active',
  '宇通集团2027届提前批校园招聘启动！

【关于宇通】宇通是以客车、卡车为主的大型商用车集团，产品覆盖客车、卡车、工程机械、专用车和环卫设备。拥有1个工程技术中心、两家上市公司、4个整车工厂、5个零部件基地，2025年营业收入493.8亿

【招聘岗位】人力管培生、研发管培生、生产管理管培生、供应链管培生、营销管培生、财务管培生等

【工作地点】郑州（营销类含国内/海外各地）

【福利待遇】
👉竞争力薪资，为实力护航
👉神仙福利，幸福感拉满
✅生活保障：免费公寓+通勤班车+企业健身房
✅多重补贴：贴心餐补/工装补/取暖费，多重生活支持等等

【内推链接】https://wecruit.hotjob.cn/SU64e7157a1eb80519a8e4efcf/mc/position/campus?acotycoCode=ppbpzc&postIdsStr=248403%2C248404%2C248405%2C248406%2C248407%2C248408%2C248409%2C248410%2C235575&recruitType=1&isLimitShowPostScope=1', 1, '04bf685674ee1ba858a45eee157fbee6', CURRENT_TIMESTAMP
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
  'smartsheet_0201_a737fa74', '万得 Wind', '金融科技', '27届提前批/日常实习', '["管培生类","职能类","人工智能类","软件研发类","数据类"]', '["上海","南京","苏州","扬州","深圳","旧金山","硅谷"]',
  '管培生类、职能类、人工智能类、软件研发类、数据类', 'xx2027', 'https://www.wind.com.cn/mobile/JoinUS/RecruitDetail/zh.html?entry=school', '2026-06-08T08:00:00.000Z', '招满即止', 'active',
  '万得 Wind 2027届校招提前批&实习生招聘正式启动！

【关于我们】万得是中国大陆领先的金融数据、信息和软件服务企业，总部位于上海陆家嘴金融中心

【备注】参与提前批多一次机会，提前批次的结果不影响正式秋招，提前批未录取同学可再次投递

【招聘岗位】管培生类、职能类、人工智能类、软件研发类、数据类等

【工作地点】上海、南京、苏州、扬州、深圳、旧金山/硅谷

【移动端网申链接】
https://www.wind.com.cn/mobile/JoinUS/RecruitDetail/zh.html?entry=school

【推荐码】xx2027（简历优先筛选，加速推进，有流程问题欢迎联系）', 1, 'a737fa74155b9690d9a26412b878f73f', CURRENT_TIMESTAMP
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
  'smartsheet_0202_705d572e', '腾讯云智', '互联网', '27届实习/26届春招', '["技术研发类","安全技术类","技术运营类","质量管理类","产品类","解决方案与服务类","项目类","设计类"]', '["长沙","武汉","重庆","西安","厦门"]',
  '技术研发类、安全技术类、技术运营类、质量管理类、产品类、解决方案与服务类、项目类、设计类', 'NTAAinv（注意大小写，复制内推码方法见sheet1）', 'https://join.tencent-cloud.com', '2026-06-02T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】
✅腾讯子公司，聚焦云和智慧产业基础产品和行业标准产品的研发
✅公司规模超5000人，分布在西安、武汉、长沙、重庆、厦门等城市
✅支持的业务包括腾讯云、腾讯地图/出行、腾讯安全等

【8大招聘职类】
技术研发类、安全技术类、技术运营类、质量管理类、产品类、解决方案与服务类、项目类、设计类正在热招！

【工作地点】
长沙、武汉、重庆、西安、厦门

【云智生活】
💓全额工资基数缴交、富有竞争力的公积金缴交比例
💓完善的课程体系和培养机制，与鹅厂技术大咖零距离交流
💓一对一导师细致辅导，享受更自在的沟通

【网申链接】
https://join.tencent-cloud.com

【内推码】NTAAinv

✅填写内推码，简历优先筛选，面试流程加快！', 1, '705d572e71c6ffe11b010b6e176d4d6e', CURRENT_TIMESTAMP
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
  'smartsheet_0203_0b9b7003', '鸣鸣很忙集团', '零售', '26届春招', '["集团管培生"]', '["全国多地"]',
  '集团管培生', 'EV9YKR', 'https://hnlshm4.zhiye.com/campus/jobs?shareId=3c1da3f0-89b3-4fae-b93f-df347422f2bf&shareSource=2', '2026-05-29T08:00:00.000Z', '招满即止', 'active',
  '零食很忙-鸣鸣很忙集团2026校招offer派送中！（25/26届同学可投）
 
【公司简介】中国头部的休闲食品饮料连锁零售商，全国21000+门店，港股上市公司（股票代码：01768.HK），旗下现有零食很忙、赵一鸣零食两大品牌。
 
【招聘对象】2025/2026届毕业生，专业不限，跨专业优秀人才热烈欢迎！
 
【招聘岗位】集团校招生
 
【满满福利】五险一金、带薪年假、年度体检；节日福利、零食自由、生日专属礼；团建活动、差旅食宿补贴、外勤防寒降温补贴等

【内推链接】https://hnlshm4.zhiye.com/campus/jobs?shareId=3c1da3f0-89b3-4fae-b93f-df347422f2bf&shareSource=2

【内推码】ESV21B （内推投递，简历优先筛选）', 1, '0b9b7003e5349e46772480edd8b303a4', CURRENT_TIMESTAMP
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
  'smartsheet_0204_0aec056f', '传音控股（实习生）', '手机', '27届实习', '["软件开发类","硬件开发类","算法类","测试类","运维类","数据类","产品类","运营类","设计类","市场营销类","供应链类","职能类"]', '["上海","深圳","重庆","海外"]',
  '软件开发类、硬件开发类、算法类、测试类、运维类、数据类、产品类、运营类、设计类、市场营销类、供应链类、职能类', 'ESHRR2', 'https://transsion.zhiye.com/intern/jobs?shareId=27490939-2fd3-44a0-a367-10aad012469c&shareSource=2', '2026-05-27T08:00:00.000Z', '招满即止', 'active',
  '公司介绍：2019年上海科创板上市公司，新兴市场消费者最喜爱的智能终端产品和移动互联服务提供商，全球销售超过70个国家和地区。

招聘岗位：软件开发类、硬件开发类、算法类、测试类、运维类、数据类、产品类、运营类、设计类、市场营销类、供应链类、职能类

岗位城市：上海、深圳、重庆、海外

内推链接：
https://transsion.zhiye.com/campus/jobs?shareId=96f17557-25d5-4968-ab7a-69adac81281e&shareSource=2&qr=1&memory=%7B%7D&silence=1

内推码：ESHRR2（简历优先被筛选，流程问题欢迎联系）', 1, '0aec056fd3bd930f3af8bf4f3e800b3e', CURRENT_TIMESTAMP
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
  'smartsheet_0205_4e91878f', '阿里国际', '跨境/电商', '27届实习', '["技术类","运营类","数据类","产品类","设计类","客户体验类","风险管理类","物流类"]', '["杭州","广州","北京"]',
  '技术类、运营类、数据类、产品类、设计类、客户体验类、风险管理类、物流类', '通过左侧内推链接投递阿里国际的岗位，自动计入内推，无需填写内推码；通过该内推链接投递阿里其他公司的岗位不计入内推。', 'https://campus-talent.alibaba.com/campus/position?campusShareCode=hM9Bde4d_v1IOjvDuXjBbrLJ7WMhlhNWgAfexPOIdnY%3D&batchId=100000540002', '2026-05-18T08:00:00.000Z', '招满即止', 'active',
  '阿里国际2027届实习生招聘｜全球电商赛道，AI赋能未来！

【关于我们】阿里国际作为阿里巴巴集团旗下六大独立运营的业务集团之一，旗下包括阿里巴巴国际站、速卖通、Lazada等明星产品。

【招聘岗位】技术类、运营类、数据类、产品类、设计类、客户体验类、风险管理类、物流类
【工作地点】杭州、广州、北京

🔗内推链接：
https://campus-talent.alibaba.com/campus/position?campusShareCode=hM9Bde4d_v1IOjvDuXjBbrLJ7WMhlhNWgAfexPOIdnY%3D&batchId=100000540002

【内推码】2T4R184J（内推简历优先筛选！）', 1, '4e91878f466253b2f555e39fbf3c518e', CURRENT_TIMESTAMP
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
  'smartsheet_0206_aa4fb2c6', '菜鸟集团', '供应链/物流', '27届实习', '["算法类","研发类","产品类","运营类","数据类","物流类","职能类","销售类"]', '["杭州","深圳"]',
  '算法类 | 研发类 | 产品类 | 运营类 | 数据类 | 物流类 | 职能类 | 销售类', '通过左侧内推链接投递阿里云的岗位，自动计入内推，无需填写内推码；通过该内推链接投递阿里其他公司的岗位不计入内推。', 'https://campus-talent.alibaba.com/campus/position?campusShareCode=u5UrJTzDaT_J32jZPtpSpeTKIF0ta0KeRE_WdH7Bc_o%3D&batchId=100000540002', '2026-05-17T08:00:00.000Z', '招满即止', 'active',
  '🌟关于菜鸟
✅成立于2013年，是电商物流行业的全球领导者。通过不断创新，以满足高速增长的复杂电商物流需求。
✅全球第一的跨境电商物流公司，业务涵盖国际快递、国际供应链、海外本地服务。
✅中国顶尖的电商综合供应链解决方案提供商,帮助品牌和商家轻松应对全渠道的供应链复杂难题。
✅展望未来，菜鸟将努力为全球商家和消费者提供时效更快、成本更优、更绿色环保的服务。

✨【招聘对象】
海内外院校27届及以后
❤【岗位方向】
算法类 | 研发类 | 产品类 | 运营类 | 数据类 | 物流类 | 职能类 | 销售类

内推链接：https://campus-talent.alibaba.com/campus/position?campusShareCode=u5UrJTzDaT_J32jZPtpSpeTKIF0ta0KeRE_WdH7Bc_o%3D&batchId=100000540002', 1, 'aa4fb2c693c80c340b5ca7b1a8962c5c', CURRENT_TIMESTAMP
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
  'smartsheet_0207_8dc8d10f', '上海人工智能实验室', '人工智能', '27届实习/26届春招', '["算法","研发","产品","运营","解决方案","职能","支持等"]', '["上海"]',
  '算法，研发、产品、运营、解决方案、职能/支持等', '通过内推链接投递即可', 'https://jsj.top/f/jrzTJ8?x_field_1=hz', '2026-04-22T08:00:00.000Z', '招满即止', 'active',
  '上海人工智能实验室26届补录&27届留用实习招聘开启

上海人工智能实验室是我国人工智能领域的新型科研机构，开展战略性、原创性、前瞻性的科学研究与技术攻关，突破人工智能的重要基础理论和关键核心技术，打造“突破型、引领型、平台型”一体化的大型综合性研究基地，支撑我国人工智能产业实现跨越式发展，目标建成国际一流的人工智能实验室，成为享誉全球的人工智能原创理论和技术的策源地。

✅ 投递 0 限制：简历可多次投递，心仪岗位大胆冲！
✅ 职位，赛道超丰富，细分方向任你选！
✅ 顶级科研平台与资源：超大规模算力集群，PB级数据，亿级研发投入！
✅ 清晰的职业发展通道：由实验室出题，链接顶尖高校、科研机构和行业企业

【内推链接】
https://jsj.top/f/jrzTJ8?x_field_1=hz

通过内推链接投递，自动计入内推，简历直达面试官！', 1, '8dc8d10f97813ec104fe3a0f91dfdd7d', CURRENT_TIMESTAMP
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
  'smartsheet_0208_87ae3f6b', '西山居', '游戏', '26届春招/27届实习', '["应届生","训练营","实习生三大招聘项目","六大岗位类别全覆盖"]', '["珠海","成都"]',
  '应届生、训练营、实习生三大招聘项目，六大岗位类别全覆盖', 'DS8ewAtK', 'https://s.xoyo.com/rW18ml', '2026-04-10T08:00:00.000Z', '招满即止', 'active',
  '西山居2026春季校园招聘正式启动！@26-28届毕业生

【招聘亮点】
🔶超强实力≫1995年成立，中国大陆历史最悠久的游戏公司，《剑网3》为3D武侠游戏的扛鼎之作，自研3D引擎为业界尖端技术之一，荣获国家863计划支持
🔶生活关怀≫顶配公积金，一线海景办公，每月餐饮补贴，免费实习生宿舍，丰富社团活动，节日大礼包
🔶成长护航≫1V1导师制，完善的培训机制，为你职业生涯保驾护航，实习&训练营的同学均有机会提前锁定正式OFFER

【校招项目】
🈶应届生、训练营、实习生三大招聘项目，六大岗位类别全覆盖，职等你来！@26-28届同学

【工作地点】珠海

【网申链接】
https://s.xoyo.com/rW18ml

更多校招资讯请关注【西山居招聘】公众号！', 1, '87ae3f6bdc10321ebd907b8ea6995f15', CURRENT_TIMESTAMP
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
  'smartsheet_0209_6cf15aa7', '步步高实验学校', '学校/教培', '26届春招', '["初中部学科教师","小学部学科教师"]', '["东莞"]',
  '初中部学科教师、小学部学科教师', 'DS61SXbq', 'https://app.mokahr.com/m/campus-recruitment/eebbk/56074?recommendCode=DS61SXbq&hash=%23%2Fjobs#/jobs', '2026-03-31T08:00:00.000Z', '招满即止', 'active',
  '【学校简介】东莞市步步高实验学校、步步高实验幼儿园是一所K15私立学校，集幼儿园、小学、初中、高中于一体，可容纳幼儿园15个班、小学60个班、初中36个班、高中18个班，学校的教师团队来自全国各地

【热招岗位】
1、初中部学科教师：语文、数学、英语、物理、化学、历史、地理、道法、体育、音乐、信息技术
2、小学部学科教师：语文、数学、英语、音乐、舞蹈、体育、美术、科学、教育戏剧
3、幼儿园学科教师：班主任、配班、保育、音乐、科学、美术、新媒体运营

【福利待遇】
✅幼儿园班级老师根据工作表现年综合收入约16万-25万，中小学教师根据工作表现年综合收入约28万-60万。综合考虑学历、获奖情况、经历和能力等因素定薪。
✅五险一金、节日福利、假期全薪、年终绩效、定期体检、系统培训、子女学费优惠折扣、风味餐厅、教师单人公寓等

【内推链接】
https://app.mokahr.com/m/campus-recruitment/eebbk/56074?recommendCode=DS61SXbq&hash=%23%2Fjobs#/jobs

【内推码】DS61SXbq（使用内推码投递，简历优先', 1, '6cf15aa751b7af75a94b0d42fcf11d0e', CURRENT_TIMESTAMP
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
  'smartsheet_0210_f009a058', '新石器无人车', '智能驾驶', '26届春招', '["技术类"]', '["北京","上海","杭州","成都"]',
  '技术类', '通过内推链接投递即可', 'https://ea7i5czp.jsjform.com/f/Ueb0R5?x_field_1=hz', '2026-06-22T08:00:00.000Z', '招满即止', 'active',
  '自动驾驶独角兽 | 新石器无人车 2026 届技术岗专属补录 

自动驾驶 & 无人配送头部企业，大量真实道路场景加持，技术落地场景丰富！

现开放嵌入式软件工程师、AI 工程师等技术岗位，面向计算机、人工智能、自动化、电子信息等相关专业 2026 届应届生。

在这里可深度参与 L4 级自动驾驶、无人车软硬件研发、AI 应用落地等核心项目，直面行业前沿技术，技术成长拉满！
技术大佬聚集地，等你来并肩攻坚！

工作地点：北京、上海、杭州、成都

极速投递链接：
https://ea7i5czp.jsjform.com/f/Ueb0R5?x_field_1=hz
一键极速投递，简历直达HR！', 1, 'f009a0583a536cb268f06e644ef9806e', CURRENT_TIMESTAMP
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
  'smartsheet_0211_9c936f8a', '小天才', '科技', '26届春招', '["技术类","设计类","综合类"]', '["东莞"]',
  '技术类、设计类、综合类', 'DSVWvEmS', 'https://app.mokahr.com/m/campus-recruitment/eebbk/37594?recommendCode=DSVWvEmS&hash=%23%2Fjobs#/jobs', '2026-03-25T08:00:00.000Z', '招满即止', 'active',
  '【企业简介】成立于1995年，专注于打造高品质儿童智能产品，目前旗下拥有小天才、步步高两大品牌，先后推出了小天才电话手表、步步高复读机等众多经典产品， 持续深耕儿童智能穿戴和教育电子行业，中国儿童智能穿戴行业和教育电子行业的领导品牌

【招聘岗位】技术类、设计类、综合类

【工作地点】东莞市

【福利待遇】总年薪15-35万，入职即享单人公寓（研发/制造双园区配套，餐厅齐全），丰富社团活动，步步高实验学校 + 滨海湾人才房，安家&子女教育无忧

【内推投递】https://app.mokahr.com/m/campus-recruitment/eebbk/37594?recommendCode=DSVWvEmS&hash=%23%2Fjobs#/jobs

【内推码】DSVWvEmS（简历优先筛选，面试流程加快！）', 1, '9c936f8a7541003c29f12eca1798ead0', CURRENT_TIMESTAMP
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
  'smartsheet_0212_78d6c88b', '青岛外贸赋能中心', '跨境', '26届春招', '["产品研发类","业务类","职能类"]', '["青岛"]',
  '产品研发类、业务类、职能类', '微信端通过内推链接投递即可计入内推', 'https://xym.51job.com/VueData/neitui/user/#/?ehireid=8047791&prd=xyznt&ruid=161284&referrer=o0cn56gdrAVfPrKym4bQl0pOHWPw', '2026-03-19T08:00:00.000Z', '招满即止', 'active',
  '【关于我们】
青岛市外贸企业数字化转型赋能中心，2022 年由青岛发改委认定，是国内首创的外贸全流程服务商，获评青岛市重点产业数字化转型赋能中心、山东省平台经济重点企业等多项荣誉。

【管培生岗位方向】
产品研发类管培生	1.5万-2万
业务类管培生	8千-1.5万
客户运营管培生 8千-1.2万
财务类管培生	1万-1.5万

【培养计划】
3 个月轮岗 + 管理储备（领航计划）、1 年岗位学习 + 晋升路径（启航计划）等，定向孵化管理人才或业务骨干

【福利待遇】
优渥的薪资、五险一金、周末双休、节日福利、定期团建，超 5A 甲级写字楼办公等

【微信客户端内推链接】
https://xym.51job.com/VueData/neitui/user/#/?ehireid=8047791&prd=xyznt&ruid=161284&referrer=o0cn56gdrAVfPrKym4bQl0pOHWPw

使用微信通过上方内推链接投递，自动计入内推，简历优先筛选！', 1, '78d6c88badaa85349d214c274d583ae0', CURRENT_TIMESTAMP
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
  'smartsheet_0213_4571a944', '开课啦教育', '教培', '26届春招', '["辅导老师","主讲管培生","助理教练"]', '["浙江省"]',
  '辅导老师、主讲管培生、助理教练', '【内推码】2026168（务必填写内推码，简历直达面试官，1-2工作日内面试，最快一周拿offer！）', 'https://www.zhaopinoffer.com/s/uhn827', '2026-03-20T08:00:00.000Z', '招满即止', 'active',
  '开课啦教育2026春季校招正式启动，本次春招有近300人招录需求，不限专业，不卡教资，3-4月招满即止！

【公司简介】
浙江省教育厅批准成立的线上中小学学科类校外培训机构。深耕互联网教育行业十余年！

【招募岗位】
辅导老师：10w-35w
主讲管培生: 30w-50w
助理教练: 18w-30w

【福利待遇】
五险一金、带薪年假、法定节假日 、午餐补贴、晚餐补贴、通讯补贴、企业打车福利、节日礼物、团建等

【极速网申链接】
https://www.zhaopinoffer.com/s/uhn827

【内推码】2026168

务必填写内推码，简历直达面试官，1-2工作日内面试，最快一周拿offer！', 1, '4571a944718b28b731562168e724b112', CURRENT_TIMESTAMP
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
  'smartsheet_0214_0543f097', '阳和通', '制造业', '26届春招', '["销售工程师（hc多）","产品工程师","射频工程师","研发工程师","生产运营专员"]', '["深圳","上海","杭州","成都","武汉"]',
  '销售工程师（hc多）、产品工程师、射频工程师、研发工程师、生产运营专员', '左侧链接1分钟极速投递，简历直达面试官！', 'https://docs.qq.com/form/page/DRnpwcHB6UmRqSW1i', '2026-03-18T08:00:00.000Z', '招满即止', 'active',
  '公司简介：成立于2014年，是一家集电子元器件分销、天线研发设计及顶针、探针制造于一体的多元化集团公司。服务客户涵盖通信、消费、新能源、汽车电子、安防、工控等多个领域，熟悉国内电子行业布局，已服务头部、腰部、长尾客户超过4000家，拥有射频器件、功率器件、光电器件、信号链、存储等十大品类产品线，主力国产，超30%车规，布局高增长赛道。历经12余年的发展，公司营收从创立之初的0.35亿增长至如今的37亿，每年均保持30%以上的增长率。

热招岗位：销售工程师（hc多）、产品工程师、射频工程师、研发工程师、生产运营专员；岗位专业不限，理工科优先！

薪酬福利：
本科12-16万，硕士14-20万、一年至少一次调薪机会，免费住宿、员工餐厅、节日福利、六险一金、带薪假期、发展平台等等!

工作地点：深圳、上海、杭州、成都、武汉等

内推链接：
https://docs.qq.com/form/page/DRnpwcHB6UmRqSW1i
极速内推链接，一键投递，简历直达面试官！', 1, '0543f097d82ed3d8489ec8c6740156fc', CURRENT_TIMESTAMP
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
  'smartsheet_0215_4f9c89a4', '宇新股份', '化工', '26届春招', '["研发技术员","工艺技术员","设备技术员","仪表技术员","电气技术员","储运技术员","外贸业务员"]', '["广东省惠州市"]',
  '研发技术员、工艺技术员、设备技术员、仪表技术员、电气技术员、储运技术员、外贸业务员', '左侧链接1分钟极速投递，简历直达面试官！', 'https://docs.qq.com/form/page/DRlhsZFVFcFNpaHdL', '2026-03-18T08:00:00.000Z', '招满即止', 'active',
  '公司简介：宇新股份（股票代码：002986）成立于2009年，是华南碳四深加工龙头，专精特新“小巨人”，全球最大顺酐装置，技术实力雄厚！
 
招聘对象：2025届、2026届海内外毕业生
 
招聘岗位：研发技术员、工艺技术员、设备技术员、仪表技术员、电气技术员、储运技术员、外贸业务员

工作地点：广东省惠州市
 
【薪资福利】
✅薪资优厚：本科15万/年起、硕士19万/年起、博士30万/年起，特别优秀者薪资可面议；
✅福利齐全：六险一金、节日礼金、安家费、过渡宿舍，覆盖食宿与生活保障；
✅补贴加持：高温补贴、通讯补贴，另有生日礼品、团队建设费；
✅成长保障：带薪假期、免费体检、免费工作餐，还有兴趣协会与完善培训体系。
 
【极速网申链接】
https://docs.qq.com/form/page/DRlhsZFVFcFNpaHdL
1分钟极速投递，简历直达面试官！', 1, '4f9c89a41658d5cda628ef4e87ecae2d', CURRENT_TIMESTAMP
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
  'smartsheet_0216_0ebd5a9c', '佑驾创新', '人工智能', '26届春招/27届实习', '["算法","软件","测试","项目经理","多方向开放"]', '["深圳市","上海市","苏州市","北京市","成都市","武汉市"]',
  '算法 / 软件 / 测试 / 项目经理 多方向开放', 'DSm3xvgW', 'https://app.mokahr.com/campus-recruitment/minieye/118571?recommendCode=DSm3xvgW#/jobs', '2026-03-17T08:00:00.000Z', '招满即止', 'active',
  '【佑驾创新｜小竹无人车】2026春季校园招聘启动。让无人驾驶，走进真实世界。
聚焦城市末端配送，小竹无人车以全栈自研技术，推动自动驾驶规模化落地。

🚀 招聘岗位
算法 / 软件 / 测试 / 项目经理 多方向开放

📩简历投递
【内推链接】https://app.mokahr.com/campus-recruitment/minieye/118571?recommendCode=DSm3xvgW#/jobs
【内推码】DSm3xvgW
内推简历先人一步！

🌱 成长机会
全栈技术视野，参与完整自动驾驶链路
行业专家带教，直接参与核心项目
导师制培养，加速成长

🎯 我们期待你
热爱技术，敢于探索，愿意把想法变成现实
👉 期待你的加入，一起让无人驾驶更进一步', 1, '0ebd5a9cfca5d851a109b7372dbcb3bf', CURRENT_TIMESTAMP
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
  'smartsheet_0217_bac5cc1f', '容百科技', '新能源', '26届春招', '["研发类","生产制造类","营销供应链类","工程类","职能类","集团管培生等"]', '["北京","天津","宁波","武汉","遵义"]',
  '研发类、生产制造类、营销供应链类、工程类、职能类、集团管培生等', 'EVVJGJ', 'https://ronbay.zhiye.com/campus/jobs?shareId=cc0e7743-9eee-4b4f-bfa4-4a2fdc92ccd5&shareSource=2&qr=1', '2026-03-01T08:00:00.000Z', '招满即止', 'active',
  '✨容百科技是全球三元正极材料龙头企业，连续多年全球销量领先

✨招聘岗位：研发类、生产制造类、营销供应链类、工程类、职能类、集团管培生等

✨涉及专业：化学及化工材料类、电气与自动化类、动力与机械类、计算机类、电子信息类、土木建筑工程类、物理科学与技术类、外国语言文学类、经济与管理类等。

【内推链接】https://ronbay.zhiye.com/campus/jobs?shareId=cc0e7743-9eee-4b4f-bfa4-4a2fdc92ccd5&shareSource=2&qr=1
【内推码】EVVJGJ', 1, 'bac5cc1f781fb7ad8c20d2d3388f09b6', CURRENT_TIMESTAMP
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
  'smartsheet_0218_110c368a', '歌尔股份', '制造业', '26届春招/27届实习', '["研发类","工艺制造类","职能支持类"]', '["北京","东莞","成都","杭州","南京","上海","深圳","香港","海外"]',
  '研发类、工艺制造类、职能支持类', 'zxbfli', 'https://wecruit.hotjob.cn/SU63c50f8b0dcad47488052192/mc/position/campus?acotycoCode=zxbfli&projectId=105101&recruitType=1&isLimitShowPostScope=1', '2026-03-12T08:00:00.000Z', '招满即止', 'active',
  '歌尔股份26届春季校招进行中！硕士40W起

【歌尔优势】上市公司、中国企业500强、山东省科技进步一等奖

【岗位】研发、制造、智能、生产管理、供应链、市场等

【工作地点】
北京、重庆、成都、东莞、杭州、南京、青岛、上海、深圳、无锡、潍坊、威海、西安、香港

【内推链接】https://wecruit.hotjob.cn/SU63c50f8b0dcad47488052192/mc/position/campus?acotycoCode=zxbfli&recruitType=1&isLimitShowPostScope=1

【内推码】zxbfli
（可优先筛选，有问题欢迎联系）', 1, '110c368aa780bc612d71d0f94682f889', CURRENT_TIMESTAMP
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
  'smartsheet_0219_b6640b11', '汤臣倍健', '快消', '26届春招/日常实习', '["营销","研发","市场","职能","智造","人工智能类"]', '["北京","辽宁","上海","江苏","浙江","山东","湖北","湖南","广东","四川"]',
  '营销、研发、市场、职能、智造、人工智能类', 'ES3Y10', 'https://tcbj.zhiye.com/campus/jobs?shareId=61606a51-4ca5-4478-a4a0-ff843ae5ce52&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-03-12T08:00:00.000Z', '招满即止', 'active',
  '【公司介绍】中国维生素与膳食补充剂行业龙头企业，国内市场占有率第一

【岗位类型】营销、研发、市场、职能、智造、人工智能类

【工作地点】北京、辽宁、上海、江苏、浙江、山东、湖北、湖南、广东、四川

【内推链接】
https://tcbj.zhiye.com/campus/jobs?shareId=61606a51-4ca5-4478-a4a0-ff843ae5ce52&shareSource=2&qr=1&memory=%7B%7D&silence=1

【内推码】ES3Y10（用内推码跳过简历初筛，一键进测评）', 1, 'b6640b11a6a12db94533ebdb02edfc1d', CURRENT_TIMESTAMP
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
  'smartsheet_0220_d4149d07', '康龙化成', '新药', '26届春招/日常实习', '["有机合成研究员","化学分析研究员","生物学研究员","生产管培生","AI开发员等"]', '["北京","宁波","西安","南京","上海","天津","武汉全国多个城市"]',
  '有机合成研究员、化学分析研究员、生物学研究员、生产管培生、AI开发员等', 'DS5E2zw6', 'https://app.mokahr.com/m/campus_apply/pharmaron/45318?recommendCode=DS5E2zw6&hash=%23%2Fjobs#/jobs', '2026-03-10T08:00:00.000Z', '招满即止', 'active',
  '✅A+H双股上市 20年深耕行业
✅国际领先的全流程一体化医药研发平台  
✅全球20➕运营实体及分支机构
✅员工总数22000+

【招聘岗位】
有机合成研究员、化学分析研究员、生物学研究员、生产管培生、AI开发员等

【招聘专业】化学类/药学类/化工与制药类/有机材料类/生物类/计算机类/数学类等相关专业

【工作地点】北京、宁波、西安、南京、上海、天津、武汉等全国多个城市

【康龙生活】行业内极具竞争力的薪资、五险一金、带薪年假、免费体检、福利餐补、免费班车、免费过渡住房等

【内推链接】
https://app.mokahr.com/m/campus_apply/pharmaron/45318?recommendCode=DS5E2zw6&hash=%23%2Fjobs#/jobs

【内推码】DS5E2zw6

简历优先筛选，加快流程推进！', 1, 'd4149d07eb05c563379b069808f1a20d', CURRENT_TIMESTAMP
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
  'smartsheet_0221_7980cd42', '森大集团', '跨境电商', '26届春招', '["业务营销类","供应链类"]', '["非洲","南美","肯尼亚","加纳","广州"]',
  '业务营销类、供应链类', '5EUR6（需手动填写）', 'https://sunda.gllue.com/portal/portall', '2026-03-09T08:00:00.000Z', '招满即止', 'active',
  '森大集团始于2004年，深耕海外市场20年+，业务覆盖全球60+国家，28座海外工厂，2万名员工并肩前行！紧跟“一带一路”，带你走向世界舞台！

🎯热招岗位全面开放！
✅业务营销类：快消销售/五级销售（英/法/西语）
✅供应链类：计划/采购/仓储/运输（国内/英/法/西语）
✅职能类：进出口/HRBP/行政（英/法/西语）

▪️海外岗年薪24-40W，国内岗12-19W
▪️＞50%管培生第一年就有调薪晋级机会
▪️免费宿舍/食宿+生活保姆+中国厨师
▪️带薪年假、休假补贴、商业保险全配备
▪️国际化培训体系+清晰职业发展路径

网申链接：
https://sunda.gllue.com/portal/portall 

内推码：5EUR6（应聘渠道来源选择校园大使，务必记得填写内推码，简历优先筛选！）', 1, '7980cd421f38a80d736ad0c74a88a996', CURRENT_TIMESTAMP
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
  'smartsheet_0222_2cd1bbdb', '中国通服广东公司', '国企/科技', '26届春招', '["计算机类","通信类","自动化类","电子类","电力类","电气类","机电类","建筑土木类","数学类","能源动力类","市场营销类","财务类等"]', '["广东（广州","深圳)","长沙","重庆","南京","北京","武汉","西安","杭州","成都及海外地区"]',
  '计算机类、通信类、自动化类、电子类、电力类、电气类、机电类、建筑土木类、数学类、能源动力类、市场营销类、财务类等', '通过内推链接投递即即可', 'https://iter.stongyw.cn/web/schoolwx/job/index.html?RCode=260003', '2026-03-08T08:00:00.000Z', '招满即止', 'active',
  '【全方位央企福利】中国通服广东公司26届春招启动

🌟千亿级【央企】上市集团
🌟2024年中国通信百强榜第6名
🌟2021-2024年中国软件百强第4名
🌟广东省大型骨干企业
🌟2024年营业收入超300亿元

【海量岗位等你挑】计算机类、通信类、自动化类、电子类、电力类、电气类、机电类、建筑土木类、数学类、能源动力类、市场营销类、财务类等

【工作地点覆盖全国】广东（广州、深圳等)、长沙、重庆、南京、北京、武汉、西安、杭州、成都等及海外地区

【全方位央企薪酬福利】六险一金、住宿福利、餐费补贴、企业年金、带薪年假等

【内部推荐】
https://iter.stongyw.cn/web/schoolwx/job/index.html?RCode=260003

点击上方内推链接网申，自动计入内推，优先筛选简历！', 1, '2cd1bbdbea644932caed3abd2aab7c04', CURRENT_TIMESTAMP
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
  'smartsheet_0223_2de37dd3', '广电运通集团', '国企/科技', '26届春招', '["技术类","营销类","产品类","职能类"]', '["北京","郑州","广州","西安"]',
  '技术类、营销类、产品类、职能类', 'DSQN8yXC', 'https://app.mokahr.com/m/campus-recruitment/grgbanking/148986?recommendCode=DSQN8yXC&hash=%23%2Fjobs#/jobs', '2026-03-04T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】创立于1999年，是国有控股高科技上市企业（002152），行业人工智能领军企业，全球成员企业超100家，服务全球120多个国家和地区，旗下有中科江南、像素数据等多家上市/公众成员企业；连续17年全国市场占有率第一、综合实力全球前三，拥有国家新一代人工智能开放创新平台等多个国家级资质。

【四大类别60+岗位】技术类、营销类、产品类、职能类，专业不限

【福利待遇】稳定月薪（10-22K）、绩效奖励、年终奖、5天8小时工作制，免费班车、员工餐厅、安家费等等

【内推通道】
https://app.mokahr.com/m/campus-recruitment/grgbanking/148986?recommendCode=DSQN8yXC&hash=%23%2Fjobs#/jobs

【内推码】DSQN8yXC

内推简历优先筛选！', 1, '2de37dd3b9c7a84d9408f71d064cabde', CURRENT_TIMESTAMP
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
  'smartsheet_0224_1f897196', '银宝山新', '制造业', '26届春招', '["运营管理类","英语营销类","项目管理类"]', '["福州","厦门","深圳","广州","重庆","贵阳","昆明"]',
  '运营管理类 、英语营销类 、 项目管理类', '通过内推链接投递即即可', 'https://docs.qq.com/form/page/DRmhXek5uVm5DcWNL', '2026-03-01T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】银宝山新（股票代码：002786.SZ），中国模具工业协会会长单位，是一家以大型精密模具为核心技术，集成先进的全工艺制程能力，以创新工业设计赋能的高科技先进制造企业。公司聚焦发展汽车零部件、通讯及消费电子、高端装备三大核心业务，基于布局完善的全球化制造服务网络，为全球高科技企业客户提供智能制造一体化解决方案。

【急缺岗位】
①管培生（运营管理类 深圳、东莞、惠州）
②管培生（英语营销类 东莞、惠州）
③管培生（项目管理类 东莞、惠州、天津）

【岗位要求】
机械、机电、自动化、工业工程、材料、市场营销、英语类等相关专业

【福利补贴】
月薪12K起，员工食堂、江景单身公寓、一流办公环境、带薪年假、餐费补贴、外宿补贴等

【工作地点】
东莞市、惠州市、深圳市、天津市

✅【简历投递】
https://docs.qq.com/form/page/DRmhXek5uVm5DcWNL
点击链接一键丝滑投递，简历直达面试官！', 1, '1f897196336317f1d1a7352e0dc96cbc', CURRENT_TIMESTAMP
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
  'smartsheet_0225_2c2a3b7a', '乐禾食品集团', '快消/制造业', '26届春招', '["投标","客户管理","投资","采购","食安","供应链运营","人力资源","财务","法务","客户成功岗"]', '["全国各地"]',
  '投标/客户管理/投资/采购/食安/供应链运营/人力资源/财务/法务/客户成功岗', 'ESKM1A', 'https://lehe.zhiye.com/campus/jobs?shareId=a1e43c59-d434-4801-a231-f6401935e059&shareSource=2', '2026-02-24T08:00:00.000Z', '招满即止', 'active',
  '👍我们是
B2B食材供应链行业头部企业
农业产业化国家重点龙头企业
连续四年荣登“胡润全球独角兽”

【校招岗位】（本科、硕士）
投标/客户管理/投资/采购/食安/供应链运营/人力资源/财务/法务/客户成功岗


▸ 岗位：客户成功岗
▸ 发展：培养能成为分子公司总经理的核心干部

🎁 福利多多，心动不止一点点
✓ 综合年薪9-12万元/年
✓ 股权激励、利润分红、超额奖金
✓ 餐补房补、健康体检、节日福利

【内推链接】
https://lehe.zhiye.com/campus/jobs?shareId=a1e43c59-d434-4801-a231-f6401935e059&shareSource=2
【内推码】ESKM1A', 1, '2c2a3b7a1b93a91a9e1811cea7b5fea2', CURRENT_TIMESTAMP
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
  'smartsheet_0226_3f589041', '乐歌股份', '制造业/跨境', '26届春招/27届实习', '["产品研发类","市场营销类","综合职能类"]', '["宁波","美国"]',
  '产品研发类、市场营销类、综合职能类', 'DS5HqS9N', 'https://app.mokahr.com/m/campus-recruitment/loctek/43967?recommendCode=DS5HqS9N&hash=%23%2Fjobs#/jobs', '2026-01-25T08:00:00.000Z', '招满即止', 'active',
  '【关于乐歌】2002年成立，2017年在深交所上市（股票代码300729），是人体工学大健康行业及跨境电商领域IPO上市第一股。公司以线性驱动技术为核心，深耕健康办公与智能家居领域，产品全球市场占有率位居第二、国内第一。目前拥有3大生产基地、25家分子公司，600余人研发团队手握近千项专利。
 
【招聘岗位】产品研发类（嵌入式/硬件/结构工程师等）、市场营销类（跨境电商/海外营销管培生等）、综合职能类（总裁助理/财务/HR管培生），多领域岗位适配不同专业人才！
 
【福利待遇】高管1v1带教搭配多岗位轮岗，还有海外外派机会，成长路径清晰可见；全员标配人体工学桌椅，免费工作餐、健身房一应俱全，周末双休+五险一金保障齐全。

【内推链接】https://app.mokahr.com/m/campus-recruitment/loctek/43967?recommendCode=DS5HqS9N&hash=%23%2Fjobs#/jobs

【内推码】DS5HqS9N（内推简历优先筛选，面试流程加快！）', 1, '3f589041451e77a7c347c5244ea3fc32', CURRENT_TIMESTAMP
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
  'smartsheet_0227_ce28221f', '9377游戏', '游戏', '26届春招', '["游戏策划类","美术设计类","市场推广类","游戏运营类","技术开发类"]', '["广州"]',
  '游戏策划类、美术设计类、市场推广类、游戏运营类、技术开发类', 'EVVMBH', 'https://9377.zhiye.com/campus/jobs?shareId=d40d01b6-d104-45e8-88f0-37c5ca3e0a3f&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-01-20T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】9377集团成立于2011年，是集研发、发行和平台运营于一体的全球化综合型互联网游戏公司。
 
【热招岗位】 游戏策划类、美术设计类、市场推广类、游戏运营类、技术开发类
 
【丰厚福利】定制化激励方案、季/年度优秀奖励、四餐供应、全勤奖励、带薪年假、特色带薪假、年度体检、交通补贴、高温补贴、年度团建&旅游、兴趣俱乐部、节日活动、部门聚会、9377福利社、大型年会等

 【内推通道】https://9377.zhiye.com/campus/jobs?shareId=d40d01b6-d104-45e8-88f0-37c5ca3e0a3f&shareSource=2&qr=1&memory=%7B%7D&silence=1

【内推码】ESKMA8(内推简历优先筛选，面试流程加快！)', 1, 'ce28221fe888883b825040157fef6805', CURRENT_TIMESTAMP
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
  'smartsheet_0228_a1731a74', '远景能源（HC多）', '新能源', '27届秋招', '["研发","工艺","制造","产品","市场","供应链","质量管理","工程管理","综合类等140+岗位"]', '["遍布全国","海外包括东南亚","亚非","欧洲","美洲"]',
  '研发、工艺、制造、产品、市场、供应链、质量管理、工程管理、综合类等140+岗位', 'DSWw6kDD', 'https://app.mokahr.com/m/campus_apply/envisiongroup/182094?recommendCode=DSWw6kDD#/jobs', '2026-07-30T08:00:00.000Z', '招满即止', 'active',
  '远景能源2027秋招正式启动！13大类别，140+岗位职等你来！

【公司简介】
✅远景能源是全球领先的智能风电、智慧储能系统和绿氢解决方案公司；
✅《时代》周刊评选的“全球100家最具影响力企业”；
✅在全球设立超20个运营总部和研发中心、拥有超60个制造基地！

【招聘岗位】研发、工艺、制造、产品、市场、供应链、质量管理、工程管理、综合类等140+岗位职等你来！

【工作地点】遍布全国，海外包括东南亚、亚非、欧洲、美洲等

【福利】落户支持、补充公积金、商业保险、利润分享、食堂、下午茶、健身房、年假十天起超多福利等你来解锁！

【内推链接】
https://app.mokahr.com/m/campus_apply/envisiongroup/182094?recommendCode=DSWw6kDD#/jobs

【推荐码】DSWw6kDD（内推投递，简历优先筛选，面试流程加快！后续有流程问题欢迎随时联系！）', 1, 'a1731a7478f1b395fdbd6f9ac1411b29', CURRENT_TIMESTAMP
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
  'smartsheet_0229_437a50e9', 'MiniMax （hc多）', 'AI', '27届秋招/日常实习', '["研发","运营","产品","设计"]', '["北京","上海","全球remote"]',
  '研发、运营、产品、设计', 'MJMNS4C', 'https://vrfi1sk8a0.jobs.feishu.cn/s/asR1WdbhB4c', '2026-07-26T08:00:00.000Z', '招满即止', 'active',
  'MiniMax（大模型第一股）2027届招聘启动！

【公司简介】MiniMax是全球领先的通用人工智能科技公司，市值超2500亿港元，自研多模态大模型包括MiniMax M2.1、Hailuo 2.3、Speech 2.6和Music 2.0等，产品包括MiniMax Agent、海螺AI、星野等，覆盖200多个国家和地区

【招聘岗位】研发、运营、产品

【工作地点】北京、上海、深圳

【福利待遇】
✅ 行业顶尖薪资+免费三餐
✅ 近距离接触AI前沿技术
✅ 大佬带飞+快速成长通道

【内推链接】
https://vrfi1sk8a0.jobs.feishu.cn/s/asR1WdbhB4c

【内推码】MJMNS4C（推荐方式选择大使推荐，简历筛选加速，面试流程加快！）', 1, '437a50e941b7209031f1700743b800f6', CURRENT_TIMESTAMP
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
  'smartsheet_0230_522d4acf', '友塔游戏（hc多）', '游戏', '26届春招', '["技术开发类","产品策划类","发行运营类","职能支持类"]', '["上海","北京","杭州","台北","洛杉矶","东京","新加坡"]',
  '技术开发类、产品策划类、发行运营类、职能支持类', '通过内推链接投递即可', 'https://www.yottagames.com.cn/zh/internal-recommendation?token=72e67cca4782632fd61e6010a3b39517-999602-3630186243&sub=030', '2026-06-07T08:00:00.000Z', '招满即止', 'active',
  '国内TOP游戏公司，产品覆盖美洲、欧洲、日韩等多个地区2亿以上用户

【招聘岗位】技术开发类、产品策划类、发行运营类、艺术设计类等

【公司福利】有竞争力的薪资、五险一金、年度2次调薪、年度体检、年假12+、餐补、房补、团建、生日/节庆福利、无限量饮料雪糕零食、丰富水果等

【内推链接】https://www.yottagames.com.cn/zh/internal-recommendation?token=72e67cca4782632fd61e6010a3b39517-999602-3630186243&sub=030

通过内推链接投递，自动计入内推，简历优先筛选！', 1, '522d4acf06dccf22aacee8dc5e4ea401', CURRENT_TIMESTAMP
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
  'smartsheet_0231_0e831b47', '海尔新能源', '新能源', '26届春招', '["硬件研发类","市场营销类","海外市场类","设计类","职能类"]', '["青岛","杭州","合肥","欧洲","澳洲","东南亚"]',
  '硬件研发类、市场营销类、海外市场类、设计类、职能类', '使用手机通过左侧内推链接（点开后可复制）投递，自动计入内推，无需填写内推码，内推简历优先筛选，面试流程更快！', 'https://maker.haier.net/client/campusmobile/customizedptjobs/id/62.html?inviter_code=YW1VU3lUa2V5Vms9', '2026-03-26T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】海尔新能源是海尔集团旗下唯一新能源产业主体，聚焦分布式绿能、用户侧储能、智慧能源控制器三大核心产业

【岗位大类】硬件研发类、市场营销类、海外市场类、设计类、职能类

【工作地点】
国内：青岛、杭州、合肥等
海外：欧洲、澳洲、东南亚等

【移动端内推链接】
https://maker.haier.net/client/campusmobile/customizedptjobs/id/62.html?inviter_code=YW1VU3lUa2V5Vms9

使用手机通过上方内推链接投递，自动计入内推，无需填写内推码，内推简历优先筛选，面试流程更快！', 1, '0e831b4727e0760e72f82af42c5fbd11', CURRENT_TIMESTAMP
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
  'smartsheet_0232_ae978c44', 'realme', '手机', '26届秋招', '["产品类","营销类","销售类","研发类","设计类"]', '["深圳","东莞","北京","西安","杭州"]',
  '产品类、营销类、销售类、研发类、设计类', 'X8186173', 'https://careers.realme.com/university/realme/campus/post?shareId=518', '2025-08-07T08:00:00.000Z', '招满即止', 'active',
  'realme2026届秋招启动！

【我们是谁】realme 是一家国际化的科技公司，全球成长最快的智能手机品牌、BrandZ中国全球化品牌50强、行业内最快达到1亿销量、首次跃居全球第六、全球30个市场进入Top5

【校招需求】产品类、营销类、销售类、研发类、设计类等岗位

【薪酬】提供具备综合竞争力的薪酬（综合年薪23万起，研发类年薪27万起），针对综合评价优秀的同学，更有 SpecialOffer 提供

【多元福利】六险一金、法定节假日、节日礼品、海景食堂、健身房、班车、宿舍应有尽有，更有realme专属5天带薪旅游假及旅游资金，更多福利等你开启！

【内推链接】
https://careers.realme.com/university/realme/campus/post?shareId=518

【内推码】X8186173

内推投递简历优先筛选！', 1, 'ae978c44fe70940f001a4cb488cfbe30', CURRENT_TIMESTAMP
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
  'smartsheet_0233_1fb6f656', '货拉拉', '互联网/物流', '26届秋招', '["管培生"]', '["深圳","上海","广州","北京","香港","海外"]',
  '管培生', '通过内推链接投递即可', 'https://jsj.top/f/SCeAxw?x_field_1=cf', '2025-08-07T08:00:00.000Z', '招满即止', 'active',
  '🔔货拉拉2026全球拓展管培生招聘

【面向人群】
专业不限，海内外顶尖高校2026届以及工作经验在三年内的优秀毕业生

【薪资福利】
1、有竞争力的年薪36-48w
2、有机会获得绩效奖金、期权激励
3、每年1次竞聘机会，加速步入管理层
4、搬家补贴、团建经费、加班餐补等公司福利

【岗位要求】
1、学习能力强，求知欲与好奇心突出
2、沟通能力优秀，高人际敏感度及协作意识
3、目标导向，责任心强，具备团队管理意愿
4、抗压适应力强，能应对多任务及公司调配
5、英语听说读写熟练，可作工作语言

【工作城市】深圳/上海/广州/北京/香港/海外等
注：工作地将根据同学的培养规划来安排，可在面试阶段详细沟通

【内推链接】https://jsj.top/f/SCeAxw?x_field_1=cf', 1, '1fb6f656825ead6a9d8f28b18011ac47', CURRENT_TIMESTAMP
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
  'smartsheet_0234_986ebc55', 'WebEye网眼科技', '互联网', '26届秋招', '["销售类：海外广告销售","产研类：广告算法","后端开发","客户端开发（Android","iOS）","产品经理","数据分析","运营类：客户运营","商业化运营","产品运营","设计类：AIGC视频制作"]', '["南京市"]',
  '销售类：海外广告销售
产研类：广告算法、后端开发、客户端开发（Android/iOS）、产品经理、数据分析
运营类：客户运营、商业化运营、产品运营
设计类：AIGC视频制作', '通过内推链接投递即可', 'https://webeye.jobs.feishu.cn/s/FeBF8-JU4dE', '2025-08-26T08:00:00.000Z', '招满即止', 'active',
  'WebEye网眼科技26届校招启动！

【公司简介】
WebEye成立于2015年，为企业提供在线广告平台和数字化出海服务，拥有500多位员工，分布全球10个办公室。业务覆盖100多个国家和地区，服务客户超过2000家。
 
【招聘岗位】
- 销售类：海外广告销售
- 产研类：广告算法、后端开发、客户端开发（Android/iOS）、产品经理、数据分析
- 运营类：客户运营、商业化运营、产品运营
- 设计类：AIGC视频制作
 
【福利保障】
- 基础保障：补充医疗保险、重大疾病保险、意外伤害保险、海外差旅保险、住房公积金、健康体检、带薪病假
- 节日与关怀：节日礼品（女神节、程序员节等）、周年庆年会、生日会、运动会、专属周年礼、工作设备及周边礼品
- 生活休闲：下午茶、茶水间、健身房、社团活动、部门团建
- 特殊关怀：产检假、产假、陪产假、子女商业保险、婚假

【内推链接】
https://webeye.jobs.feishu.cn/s/FeBF8-JU4dE

通过上方内推链接投递，简历优先筛选，面试流程加快！', 1, '986ebc5564c402847636c4aeac09d21f', CURRENT_TIMESTAMP
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
  'smartsheet_0235_fecc1201', 'BOSS直聘', '互联网', '26届秋招', '["开发类","算法类","测试类","产品类"]', '["北京","深圳","杭州","上海"]',
  '开发类	、算法类	、测试类	、产品类', '通过内推链接投递即即可', 'https://www.zhipin.com/campus/pc/?recommendCode=XX', '2025-08-31T08:00:00.000Z', '招满即止', 'active',
  'BOSS直聘2026届秋招启动！

企业介绍：BOSS直聘是一款在全球范围内首创“互联网直聘模式”的招聘APP。按月活跃用户数计，BOSS直聘已成为中国头部招聘平台，并于2021年6月在纳斯达克上市。2022年12月，于香港联合交易所实现双重主要上市。

招聘岗位：开发类	、算法类	、测试类	、产品类	、数分类

工作城市：北京、深圳、杭州、上海

内推链接：
https://www.zhipin.com/campus/pc/?recommendCode=XX

通过内推链接投递，自动计入内推，简历优先筛选，后续有流程问题随时联系', 1, 'fecc12018fd98a06e7c489ffdd0757f0', CURRENT_TIMESTAMP
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
  'smartsheet_0236_308da45c', '杭州睿琪软件', '互联网', '26届秋招', '["杭州市"]', '["大模型算法","产品经理","用户增长","HRBP","知识产权","UX设计师","视频创意设计师"]',
  '杭州市', '通过内推链接投递即可', 'https://docs.qq.com/form/page/DRm1xS1VvS0ZodVJK', '2025-09-02T08:00:00.000Z', '招满即止', 'active',
  '薪资高于大厂 | 杭州睿琪软件26届秋招启动！

关于我们：睿琪软件成立于2009年，在计算机视觉和自然语言理解领域积累深厚，是垂直领域行业领先+国内应用出海Top10。我们拥有超2亿用户，专注于用人工智能技术把生活变得更美好。旗下拥有数款用户数上亿并快速增长的移动应用。

招聘岗位：大模型算法、产品经理、用户增长、HRBP、知识产权、UX设计师、视频创意设计师（专业不限）

我们提供：高于大厂的薪资回报（综合年薪：算法岗位80-150W，视频创意设计师 22-28w，其他岗位40W+，优秀者上不设限，实习薪资600—2000元/天）、年终奖4-8个月、全额五险一金、7-15天带薪年假、利润分享机制、应届生无试用期、住房补贴

工作地点：杭州市

专属内推链接：
https://docs.qq.com/form/page/DRm1xS1VvS0ZodVJK
通过上方内推链接投递，无需填写内推码自动计入内推，投递丝滑20秒即可完成投递，内推简历优先筛选，加速流程推进！', 1, '308da45cde38b52e51338018e3f4421c', CURRENT_TIMESTAMP
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
  'smartsheet_0237_d9f68397', '字节跳动', '互联网', '26届秋招', '["研发","运营","产品","销售","职能","支持","设计","游戏策划","市场"]', '["北京","成都","重庆","广州","杭州","上海","深圳","武汉","西安","珠海"]',
  '研发、运营、产品、销售、职能/支持、设计、游戏策划、市场', '通过内推链接投递即可', 'https://job.toutiao.com/campus/m/position?external_referral_code=D88TK21', '2025-08-03T08:00:00.000Z', '招满即止', 'active',
  '字节跳动2026校园招聘启动！
招聘利好：持续扩招、5000+Offer、越早投递机会越多！
面向对象：2026届毕业生（25年9月-26年8月毕业）
开放岗位：8大职类，5000+Offer待发，研发需求再增23%，非研发刚招1500+人
投递&流程：即日起全年开放投递，每人2次机会！
专属内推投递链接：https://job.toutiao.com/campus/m/position?external_referral_code=D88TK21

更多招聘信息欢迎阅读：https://mp.weixin.qq.com/s/fJ5vygvzBg2dP0BjEE8nNQ
更多岗位招聘信息投递、投递进度查询可进专属社群了解～', 1, 'd9f68397107af359a950eb2477e2258c', CURRENT_TIMESTAMP
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
  'smartsheet_0238_52dcee2a', '顺丰集团', '供应链', '26届秋招', '["全国多地"]', '["十大人才航向","包含管培生类","职能类","研发类","经营管理类","hc充足！"]',
  '全国多地', '【内推码】5CC6RA（招聘信息获取渠道选择校园大使）', 'https://campus.sf-express.com/m/?channel=29&referCode=5CC6RA#/newGraduatesList', '2025-08-28T08:00:00.000Z', '招满即止', 'active',
  '顺丰集团2026届秋招启动！十大人才航向职等你来！

【关于顺丰】顺丰是中国第一大、全球第四大综合供应链集团，是全球智慧供应链的领导者，2025年世界企业500强！

【招聘岗位】
十大人才航向，包含管培生类、职能类、研发类、经营管理类等，hc充足！

【工作地点】全国多地

【PC端网申链接】
https://campus.sf-express.com/#/homePage
【内推码】5CC6RA（招聘信息获取渠道选择校园大使） 

【手机端内推链接】
https://campus.sf-express.com/m/?channel=29&referCode=5CC6RA#/newGraduatesList
使用手机通过上方内推链接投递，自动计入内推，无需填写内推码，内推简历优先筛选，面试流程更快！', 1, '52dcee2a185d06538f155603bb71f0c7', CURRENT_TIMESTAMP
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
  'smartsheet_0239_88d495fb', '凌翔磁浮', '制造业', '26届秋招', '["客户经理","硬件工程师","机械工程师","软件工程师","算法工程师","电气工程师"]', '["长沙"]',
  '客户经理、硬件工程师、机械工程师、软件工程师、算法工程师、电气工程师', '通过内推链接投递即即可', 'https://docs.qq.com/form/page/DRm5TUmNDRWtpSnho', '2025-09-18T08:00:00.000Z', '招满即止', 'active',
  '独角兽-凌翔磁浮2025年秋季招聘启动！ 

【关于我们】 
✅国家高新技术企业，国家级专精特新“小巨人”企业 
✅连续入选“中国隐形独角兽500强”榜单 
✅湖南省制造业单项冠军企业 
✅我国磁浮交通核心技术研发和关键装备研制头部企业 

【招聘岗位】 客户经理、硬件工程师、机械工程师、软件工程师、算法工程师、电气工程师

【工作地址】 长沙市 

【福利待遇】 
✅六险一金，全额12%公积金，员工食堂，不定期团建 
✅7.5H工作制，周末双休，股权激励，每年至少15天带薪春节长假 
✅丰厚的薪酬激励机制，每年调薪 
✅长沙市中心7000㎡独栋办公环境 

【极速网申链接】 
https://docs.qq.com/form/page/DRm5TUmNDRWtpSnho
丝滑投递，20秒完成网申，简历直达面试官！

【200+秋招内推合集+真题题库+面试经验+求职干货】
26届秋招内推合集（每日更新-欢迎收藏分享）', 1, '88d495fbb27807382fbde1e4e8e51dc3', CURRENT_TIMESTAMP
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
  'smartsheet_0240_330dcb44', '英威腾', '制造业', '26届秋招', '["研发类","市场类","供应链类","职能类","产品类"]', '["深圳","苏州","长沙","中山","上海"]',
  '研发类	、市场类	、供应链类	、职能类	、产品类', 'ESKWKG', 'https://invt.zhiye.com/campus/jobs?shareId=3d52f956-fc22-48fd-a1cc-a97b2986e924&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2025-08-17T08:00:00.000Z', '招满即止', 'active',
  '英威腾2026届校园招聘正式启动！

【公司简介】英威腾(证券代码:002334)成立于2002年，是专注于工业自动化和能源电力两大领域，集产品研发、制造与销售为一体的高新技术企业。业务范围覆盖工业自动化、网络能源、新能源汽车及光伏储能。目前拥有14家控股子公司，4个人大型产研基地，员工超过5000人，在全球范围内设立了50多家分支机构和上百家联保中心。

【招聘岗位】研发类	、市场类	、供应链类	、职能类	、产品类

【工作地点】深圳、	苏州	、长沙	、中山、	上海

【福利待遇】六险一金、五天八小时工作制、国家法定假期、带薪假、校招生专属培养体系、健康体检/旅游团建、结婚/生育礼金等

【内推链接】https://invt.zhiye.com/campus/jobs?shareId=3d52f956-fc22-48fd-a1cc-a97b2986e924&shareSource=2&qr=1&memory=%7B%7D&silence=1

【内推码】ESKWKG

内推简历优先筛选，后续有问题欢迎联系！', 1, '330dcb447c64c03265d36d34bca41dba', CURRENT_TIMESTAMP
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
  'smartsheet_0241_a1eb9e26', '科锐国际', '互联网', '26届春招', '["开放软件开发","软件测试工程师"]', '["上海","东莞","西安","南京","北京","深圳","杭州","成都","武汉","苏州","长沙","济南"]',
  '开放软件开发 / 软件测试工程师', '通过内推链接投递即可', 'https://docs.qq.com/form/page/DWnFxVUFGaE1RcUpt', '2026-05-15T08:00:00.000Z', '招满即止', 'active',
  '【往届可投】科锐国际 2026 校园招聘（计算机 & 电子信息类专场）
【企业简介】
科锐国际是中国首家 A 股上市人力资源服务企业，与通信、半导体等领域头部企业开展项目合作，面向毕业生开放技术岗位，助力接触顶尖项目、实现技术快速成长。
【招聘岗位】
开放软件开发 / 软件测试工程师两大岗位，覆盖 8 大业务方向可意向选择：
半导体 / 芯片器件、终端技术、数字能源、云计算、ICT 通信、集团财经技术、企业服务
技术栈覆盖 C/C++/Java/Python/Go/JS/Rust，可按专业方向匹配。
【岗位要求】
2026 届本科及以上为主，往届生亦可投递；计算机/软件/电子信息/自动化/数学/网络等理工科相关专业；
【招聘城市】
上海、东莞、西安、南京、北京、深圳、杭州、成都、武汉、苏州、长沙、济南等12 城可选，可协调意向工作地点。
【岗位亮点】
六险一金、周末双休、福利年假、大厂项目环境、1v1 导师带教、完整能力成长体系、发展空间充足
【薪资说明】
固定底薪（11000-33000 / 月，按职级）+ 月度奖金（2000-7000 / 月）+ 年终奖（2-4 个月），最终薪酬以', 1, 'a1eb9e264deeaf29a6f0fb226383cf2c', CURRENT_TIMESTAMP
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
  'smartsheet_0242_4c3c7cf5', '三一重能', '制造业', '26届秋招', '["研发","生产","质量","市场","职能等"]', '["北京","长沙","海外"]',
  '研发、生产、质量、市场、职能等', 'SYZN2026003投递简历时，在个人信息处填写内推码，简历优先筛选，Offer 快人一步！', 'https://bsurl.cn/v2/dg1WxbJu', '2025-08-21T08:00:00.000Z', '招满即止', 'active',
  '三一重能2026届秋招正式批启动！

三一重能是三一集团旗下重要业务板块。成立于2008年，致力于成为全球清洁能源装备及服务的领航者。22年6月在上交所科创板成功上市，股票代码：688349。是全球综合排名前十、中国陆上前五的风电整机商。

【招聘岗位】
研发、生产、质量、市场、职能等

【薪资】
本科	：年薪 10-20W	
硕士	：年薪 25-40W(研发)	
博士	：年薪 45W起 上不封顶

【福利】五险一金、带薪年假、温馨员工餐厅、专属员工小区、节日关怀物资、定制工作服装、年度体检、专属三一节假期等

【工作地点】北京、长沙、海外等

【秋招专属网申链接】
https://bsurl.cn/v2/dg1WxbJu

【内推码】SYZN2026003

投递简历时，在个人信息处填写内推码，简历优先筛选，Offer 快人一步！', 1, '4c3c7cf58d429a75675f6f71359e43f3', CURRENT_TIMESTAMP
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
  'smartsheet_0243_cbf6a68d', '震坤行', '制造业', '26届春招', '["客户经理","BD","产品经理","技术支持","客户服务"]', '["北京","上海","江苏","山东","湖北","广东","甘肃"]',
  '客户经理、BD、产品经理、技术支持、客户服务', 'EV36GR', 'http://zhaopin.zkh.com/campus/jobs?shareId=2dfafd16-055d-4dd3-b07a-92427cda2453&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-03-05T08:00:00.000Z', '招满即止', 'active',
  '✅震坤行是国内头部的工业用品服务平台，美股上市企业，团队规模超3000人，平均年龄32岁，氛围平等开放，发展空间广阔。从简历到offer最快2周⚡！
🎓 招聘对象：2025、2026届毕业生
🏆 就业竞争力：细分赛道头部企业、广阔的发展空间、相对有竞争力的薪酬、完善的福利体系、平等开放的氛围
💰 薪资范围：本科15-25w+，硕士20-30w+
👔 招聘岗位：客户经理、BD、产品经理、技术支持、客户服务
📍 工作地点：全国30+城市
内推链接：http://zhaopin.zkh.com/campus/jobs?shareId=2dfafd16-055d-4dd3-b07a-92427cda2453&shareSource=2&qr=1&memory=%7B%7D&silence=1
🚀 内推码快人一步：EV36GR', 1, 'cbf6a68d58ae375a72388080ef43c932', CURRENT_TIMESTAMP
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
  'smartsheet_0244_aebf8b04', '三一重装', '制造业', '26届春招', '["机械工程师","电气工程师","材料工程师","系统集成工程师","液压工程师","EMC工程师","研发项目管理工程师","嵌入式工程师","算法工程师"]', '["沈阳","西安","北京"]',
  '机械工程师、电气工程师、 材料工程师、系统集成工程师、液压工程师、EMC工程师 、研发项目管理工程师、嵌入式工程师、算法工程师', '2318（投递简历时，在个人信息处填写内推码2318）', 'https://sany.zhiye.com/jobs?activityGuid=0a295613-03fb-4a07-a0a8-4b4c9c3995da&memory=%7B%7D&silence=1', '2026-03-06T08:00:00.000Z', '招满即止', 'active',
  '公司简介：三一重型装备有限公司创立于2004年，是一家专业从事矿山机械、煤炭掘、采、运成套设备研发、制造及销售的大型装备制造企业，是全球装备制造领先企业。作为一家全球化公司，葡盖全球的主机、零配件供应网络，并在“一带一路”沿线积极开展市场布局，产品远销20余个国家和地区。

【招聘岗位】机械工程师、电气工程师、 材料工程师、系统集成工程师、液压工程师、EMC工程师 、研发项目管理工程师、嵌入式工程师、算法工程师

【工作地点】沈阳、西安、北京

【薪酬福利】年收入20w以上，五险一金、带薪年假、节日物资、服装福利、员工寝室、员工食堂、三一节假日、海外岗位享受海外津补贴

【网申链接】
https://sany.zhiye.com/jobs?activityGuid=0a295613-03fb-4a07-a0a8-4b4c9c3995da&memory=%7B%7D&silence=1

【内推码】2318
投递简历时，在个人信息处填写内推码2318，简历优先筛选，Offer 快人一步！', 1, 'aebf8b042f2554b789e1360d2cc741a3', CURRENT_TIMESTAMP
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
  'smartsheet_0245_3194a35a', '桃李未来', '教培', '27届秋招', '["班课教师岗（应聘不限专业","面试不卡教资）"]', '["深圳市"]',
  '班课教师岗（应聘不限专业，面试不卡教资）', 'EVVM0T', 'https://taoliweilai.zhiye.com/campus/jobs?shareId=708810bd-ed12-442e-a7dd-29be8f4dea2d&shareSource=1', '2025-08-12T08:00:00.000Z', '招满即止', 'active',
  '桃李未来27届校招启动！

岗位:班课教师岗（应聘不限专业，面试不卡教资）

工作地点：深圳市

福利待遇：20-25w/年 
、 五险一金、2-6次调薪机会/年、无义务课时、节日福利、团建活动、年度旅游、30-50万无息住房贷款

【内推链接】https://taoliweilai.zhiye.com/campus/jobs?shareId=708810bd-ed12-442e-a7dd-29be8f4dea2d&shareSource=1

【推荐码】EVVM0T（简历优先筛选）', 1, '3194a35a9b605942cdb9a41162efd2a2', CURRENT_TIMESTAMP
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
  'smartsheet_0246_1e0a7ac8', '海四达', '制造业', '26届秋招', '["技术研发类","品质管理类","市场营销类","供应链管理类","生产制造类","职能管理类"]', '["江苏"]',
  '技术研发类、品质管理类、市场营销类、供应链管理类、生产制造类、职能管理类', 'ESKMA0', 'https://highstar.zhiye.com/campus/jobs?shareId=4d209178-b649-4e5b-b6e3-051c2373863e&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2025-08-04T08:00:00.000Z', '招满即止', 'active',
  '🔥海四达2026届全球秋季校园招聘正式启动！

【公司简介】
✅成立于1994年，总部位于江苏，是中国首批专业从事二次化学电源研发、生产和销售的国家级重点高新技术企业
✅全球生产基地（4大国内基地+4大海外基地），全球电芯出货量45+亿支

【招聘对象】
2026届海内外高校毕业生

【招聘岗位类别】
技术研发类、品质管理类、市场营销类、供应链管理类、生产制造类、职能管理类

【福利待遇】
具有竞争力的薪酬、股权激励、工作餐、年度体检、带薪年假、节日福利、免费班车，生活津贴，购房补贴等

【内推链接】https://highstar.zhiye.com/campus/jobs?shareId=4d209178-b649-4e5b-b6e3-051c2373863e&shareSource=2&qr=1&memory=%7B%7D&silence=1

【内推码】ESKMA0

内推投递，简历优先筛选！', 1, '1e0a7ac8365b71dc5d4c519acdf40fe4', CURRENT_TIMESTAMP
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
  'smartsheet_0247_fbb81956', '三一重能', '制造业', '27届秋招', '["机械仿真类","电气控制类","工艺材料类","数字化智能化类","研发管理类"]', '["长沙","北京"]',
  '机械仿真类、电气控制类、工艺材料类、数字化智能化类、研发管理类', 'SYZN2026003', 'https://sany.zhiye.com/jobs?activityGuid=f3c7701a-aa74-4cb6-afb7-d0856cd13962', '2025-08-17T08:00:00.000Z', '招满即止', 'active',
  '三一重能2026届校招提前批启动！

三一重能是三一集团旗下重要业务板块。成立于2008年，致力于成为全球清洁能源装备及服务的领航者。22年6月在上交所科创板成功上市，股票代码：688349。是全球综合排名前十、中国陆上前五的风电整机商。

【招聘岗位】
机械仿真类、电气控制类、工艺材料类、数字化智能化类、研发管理类

【薪资待遇】
硕士年薪25-40万；博士年薪45万起，上不封顶
年终奖金：2-6个月
其他奖金：利润分享、项目奖金、股权激励等

【福利待遇】五险一金、带薪年假、温馨员工餐厅、专属员工小区、节日关怀物资、定制工作服装、年度体检、专属三一节假期等

【工作地点】北京、长沙

【网申链接】
https://sany.zhiye.com/jobs?activityGuid=f3c7701a-aa74-4cb6-afb7-d0856cd13962

【内推码】SYZN2026003

投递简历时，在个人信息处填写内推码，简历优先筛选，Offer 快人一步！', 1, 'fbb81956708425fba1144427c26950cd', CURRENT_TIMESTAMP
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
  'smartsheet_0248_9714f1ef', '领益智造', '制造业', '26届秋招', '["研发工程类","供应链管理类","生产制造类","质量类","商务类","职能类"]', '["国内：华东","华南","华西","华中","海外：美国","印度","越南","新加坡"]',
  '研发工程类、供应链管理类、生产制造类、质量类、商务类、职能类', 'ajamzc', 'https://wecruit.hotjob.cn/SU600fcd2b5d83dc11e4a581b3/mc/position/campus?acotycoCode=ajamzc&recruitType=1&isLimitShowPostScope=1', '2025-09-04T08:00:00.000Z', '招满即止', 'active',
  '领益智造 2026 届秋招启动！

【我们是谁？】
▶消费电子精密功能件全球龙头、中国 500 强、世界机器人运动会大赛冠军
▶聚焦“人、眼、折、服”领域高速发展，未来5 年营收翻5倍
▶大胆重用年轻人，1200 + 岗位等你来投

【我们给什么？】
▶导师 1v1 带教，与顶尖人才同行
▶每年2次晋升调薪机会，设立3年专属成长期，优秀者可获期权激励
▶本科 14- 24W/年，硕士 17- 35W +/年，博士 35W +/年，优秀者薪酬可议

【在哪里工作？】
▶国内：华东/华南/华西/华中
▶海外：美国/印度/越南/新加坡

内推链接：
https://wecruit.hotjob.cn/SU600fcd2b5d83dc11e4a581b3/mc/position/campus?acotycoCode=ajamzc&recruitType=1&isLimitShowPostScope=1
【内推码】ajamzc

内推简历优先筛选，考研考公上岸无违约金，放心投！', 1, '9714f1efcfab53bcb1da94108c337362', CURRENT_TIMESTAMP
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
  'smartsheet_0249_f9aa01e7', 'vivo-蓝极星计划', '手机', '27届秋招', '["营销类","设计类","研发类","供应链类","公共类","产品运营类","市场类"]', '["上海","北京","东莞"]',
  '营销类、设计类、研发类、供应链类、公共类、产品运营类、市场类', 'ESHE09', 'https://hr-campus.vivo.com/campus/jobs?shareId=ab46c196-525f-49b2-b27c-6eff6bbca5e4&shareSource=2', '2026-07-08T08:00:00.000Z', '招满即止', 'active',
  'vivo蓝极星计划27届校园招聘启动

我们将提供：
🌌校招顶尖offer
🌌长赛道核心岗位
🌌5亿+用户场景及全球资源
🌌稳健的职业发展平台

招聘对象：毕业时间在2026年1月-2027年12月的博士毕业生

招聘方向：影像与计算机视觉、人工智能与大模型、具身智能、系统软件与嵌入式、运动健康与核心器件等

【内推链接】
https://hr-campus.vivo.com/campus/jobs?shareId=ab46c196-525f-49b2-b27c-6eff6bbca5e4&shareSource=2

【内推码】ESHE09（内推简历优先筛选）', 1, 'f9aa01e77d185ad6b8484531f1e3b3a7', CURRENT_TIMESTAMP
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
  'smartsheet_0250_d62d7e10', '格力电器', '制造业', '26届秋招', '["博士生","技术研发","信息技术","技术支持","经营销售"]', '["珠海总部"]',
  '博士生、技术研发、信息技术、技术支持、经营销售', 'EGLQZ18675（选择“校园大使”推荐）', 'https://m-zhaopin.greeyun.com/#/main', '2025-08-24T08:00:00.000Z', '招满即止', 'active',
  '【格力电器2026届秋招启动】

【校招岗位】
5大类：博士生、技术研发、信息技术、技术支持、经营销售
19个岗位：结构、制冷、电气、电控、电力电子、噪振、软件、知识产权、空调工程技术、销售、主播等，更多详见网申职位

【工作地点】珠海总部

网申链接：https://m-zhaopin.greeyun.com/#/main
大使推荐码：EGLQZ18675（选择“校园大使”推荐）
（此链接为内推通道，请按提示填写，提交后会收到邮件/短信邀请，按指示完成简历更新即可）', 1, 'd62d7e10f2f7a711ff604f7e9e95eaf6', CURRENT_TIMESTAMP
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
  'smartsheet_0251_39466771', '惠州市德赛电池', '制造业', '26届秋招', '["运营类","品质类","技术类","研发类","销售","职能管理类"]', '["惠州市"]',
  '运营类、品质类、技术类、研发类、销售、职能管理类', '通过内推链接投递即即可', 'https://docs.qq.com/form/page/DRnFOaEVnR1F1RXdt', '2025-09-08T08:00:00.000Z', '招满即止', 'active',
  '📣惠州德赛电池2026届秋季校园招聘正式启动！

【关于德赛电池】
✅惠州市德赛电池有限公司，成立于2002年，是一家国有发展背景的上市企业（股票代码：000049）
✅公司致力于锂电池相关产品的研发、制造与销售，公司产品广泛应用于消费电子、智能出行、智能家居等领域
✅现拥有惠州仲恺、惠州惠南、惠州龙门、长沙望城、越南北宁等多个工业园区，已形成配套设施齐全、装备先进、管理精益的现代化制造体系

【热招岗位】
运营类、品质类、技术类、研发类、销售、职能管理类

【福利待遇】
❣五险一金➕13薪➕年终奖
🈶带薪年假、免费食宿、员工体检、专业培训、导师带教、社团活动、团建旅游、健身房…等你来解锁

【人才培养】
✅培养目标：1年成为独立带项目的工程师/主管
✅3-4年成为公司核心骨干后备，5~6年成为公司核心骨干人才

【简历投递】
1⃣邮箱投递：
yangyuqin_dc@desay.com
yangpeishan_dc@desay.com
（邮件命名：姓名+学校+意向岗位）

2⃣网申链接：
https://docs.qq.com/form/page/DRnFOaEVnR1F1RXd', 1, '39466771f160c03ec37c02734af6e2b5', CURRENT_TIMESTAMP
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
  'smartsheet_0252_9b77158c', '锂威新能源', '制造业', '26届秋招', '["研发类","智能制造类","供应链管理类","品质管理类","数字化管理类","综合管理类"]', '["广东惠州","广东东莞","浙江兰溪"]',
  '研发类、智能制造类、供应链管理类、品质管理类、数字化管理类、综合管理类', 'EZVCRG', 'https://liwinon.zhiye.com/campus/jobs?shareId=30d645e0-c0f8-4195-b07b-4d1360bba61f&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2025-09-04T08:00:00.000Z', '招满即止', 'active',
  '#锂威新能源2026届校园招聘
🏠锂威简介：专业从事 3C 消费类聚合物电芯的研发、制造、销售服务，公司总人数10000+，公司总人数10000+
✨行业地位：国内领先的锂离子电池解决方案及产品供应商
✨校招薪资：
本科：年薪10万-15万；
硕士：年薪15万-27万；
博士：面议（一人一薪）
🎓热招岗位：研发类、智能制造类、供应链管理类、品质管理类、数字化管理类、综合管理类
📰工作地点：广东惠州、广东东莞、浙江兰溪
🏄招聘专业：材料、化学、机电、机械、外贸、管理、计算机、英语、越南语、韩语等专业
💫面向群体：2025年12月-2026年7月期间毕业的应届生
🌟内推链接：https://liwinon.zhiye.com/campus/jobs?shareId=30d645e0-c0f8-4195-b07b-4d1360bba61f&shareSource=2&qr=1&memory=%7B%7D&silence=1
✅【内推码：EZVCRG 】

📣简历第一时间送到HR面前，快来投递吧~
~锂威校招QQ群~：1009083886', 1, '9b77158c2efce1808c7f4d6276fa5918', CURRENT_TIMESTAMP
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
  'smartsheet_0253_9a970054', '国光电器', '制造业', '26届秋招', '["电声","电子","结构","嵌入式软件","产品","CMF","包装","销售","项目管理","测试开发","电控","质量岗","系统开发","资源开发Sourcing","生产计划员PC等"]', '["广州","萍乡","越南"]',
  '电声、电子、结构、嵌入式软件、产品、CMF、包装、销售、项目管理、测试开发、电控、质量岗、系统开发、资源开发Sourcing、生产计划员PC等', 'xgzfas', 'https://wecruit.hotjob.cn/SU66c8012c1eb80543256bf330/mc/position/campus?acotycoCode=xgzfas&recruitType=1&isLimitShowPostScope=1', '2025-08-31T08:00:00.000Z', '招满即止', 'active',
  '国光电器26届校招正式启动！
 
- 企业概况：1951年成立，前身为国企（已股改），上市股份公司；专注电声领域研发，集研产销一体。
- 核心业务：生产音响、耳机、喇叭等声学产品，含全球代工与自主品牌。
- 公司规模：18000+人，总部广州，国内外多处分设子公司；本次岗位主工作地为广州。
- 适配专业：声学类、机械类、电子类、语言类、设计类、计算机类、市场类等。
 
热招岗位：
电声、电子、结构、嵌入式软件、产品、CMF、包装、销售、项目管理、测试开发、电控、质量岗、系统开发、资源开发Sourcing、生产计划员PC等
 
福利待遇
周末双休、五险一金、人才公寓、员工食堂、免费班车、带薪年假，另设健身房、篮球场、KTV、舞蹈室等
 
内推链接：
https://wecruit.hotjob.cn/SU66c8012c1eb80543256bf330/mc/position/campus?acotycoCode=xgzfas&recruitType=1&isLimitShowPostScope=1

内推码：xgzfas

内推简历优先筛选，面试流程加快！', 1, '9a97005460e03a8db9aa6fd4ee9f0e74', CURRENT_TIMESTAMP
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
  'smartsheet_0254_3abbe5b5', '洲明科技', '制造业', '26届春招', '["职能类","营销类","研发类"]', '["深圳","惠州","南昌"]',
  '职能类、营销类、研发类', 'EVVMAK', 'https://unilumin.zhiye.com/campus/jobs?shareId=d57783f0-42a2-4fce-b2e8-09f22b4634a4&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-04-03T08:00:00.000Z', '招满即止', 'active',
  '【公司简介】
🌟我们是全球领军的LED显示与照明产品及光显解决方案提供商，连续多年LED显示屏销售额世界第一、XR虚拟拍摄领域市占率全球第一
✨参与5届央视春晚、6届奥运会、8年奥斯卡颁奖典礼等世界级盛事；客户有华为、苹果、微软、联想等知名500强

🌟招聘方向
✅职能类：财经、运营、总裁办、人资
✅营销类：国内营销、国际营销、方案工程师
✅研发类：电子、材料、机械、计算机、软件等

💰福利待遇
本科:年薪17-23W
硕士:年薪21-30W
1、工作地点:深圳、惠州、南昌
2、食宿安排:提供免费宿舍/低价人才房、有食堂
3、保障措施:年度体检、五险一金、法定外额外增加带薪年假天数
4、工作时间:双休，工作生活平衡

【内推链接】https://unilumin.zhiye.com/campus/jobs?shareId=d57783f0-42a2-4fce-b2e8-09f22b4634a4&shareSource=2&qr=1&memory=%7B%7D&silence=1
【内推码】EVVMAK(内推简历优先筛选)', 1, '3abbe5b5f97796134201065f7e9ef94d', CURRENT_TIMESTAMP
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
  'smartsheet_0255_bcc1b343', '北方华创', '制造业', '26届秋招', '["秋招岗位主要都是研发类","北京的","外地只有工艺岗位（深圳","武汉","合肥","上海这几个地方）"]', '["北京市大兴区亦庄经济开发区"]',
  '秋招岗位主要都是研发类、北京的，外地只有工艺岗位（深圳、武汉、合肥、上海这几个地方）', 'ISV98K', 'https://career.naura.com/', '2025-08-07T08:00:00.000Z', '招满即止', 'active',
  '北方华创微电子装备有限公司秋招

一、公司简介
高端工艺装备先进企业&国有上市企业 
北京北方华创微电子装备有限公司，成立于 2001 年。经过二十余年的发展，北方华创已成为中国半导体 装备制造与服务商的先行者。 2023 年北方华创荣登 Gartner 全球集成电路装备企业排名中国排名第 1 位，全球第6位。

二、职位介绍
秋招岗位：秋招岗位主要都是研发类、北京的，外地只有工艺岗位（深圳、武汉、合肥、上海这几个地方）
工作地点：北京市大兴区亦庄经济开发区
任职资格：硕、博，理工类专业（材料、化工、物理、机械、电气等）。

 三、福利待遇 
薪酬：月度基本工资 + 绩效工资 + 补贴 + 加班费等（优秀者还有签字费）。 
社保：六险二金（五险一金全额缴纳 + 补充医疗 + 企业年金）。 
福利：北京落户、员工食堂、员工宿舍、免费体检、生日福利、带薪年假、1V1 导师辅导（不需要倒班）。 
休闲设施：健身房、瑜伽室、足球场、篮球场等。
投递地址：career.naura.com
内推码：ISV98K(推荐投递半导体工艺工程师哦，研究方向不契合也没关系的)', 1, 'bcc1b343bdc9ce4c0723977b4df837d4', CURRENT_TIMESTAMP
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
  'smartsheet_0256_5f13ef55', '新凯来', '制造业', '26届秋招', '["真空与环控工程师","多物理场仿真工程师","机械设计工程师","先进材料开发工程师","热设计工程师"]', '["深圳","上海","北京","武汉","杭州","东莞","西安"]',
  '真空与环控工程师，多物理场仿真工程师，机械设计工程师，先进材料开发工程师，热设计工程师', 'W5MN', 'https://career.sicarrier.com/#/campus', '2025-08-05T08:00:00.000Z', '招满即止', 'active',
  '新凯来校招内推～26届应届本硕博，base深圳
待遇可参考offershow，14-16薪
简历投递链接：https://career.sicarrier.com/#/campus
内推码：W5MN
需求专业：半导体，力学，物理，化学，材料，流体，传热，颗粒，机械，真空，仿真等相关背景
岗位：真空与环控工程师，多物理场仿真工程师，机械设计工程师，先进材料开发工程师，热设计工程师', 1, '5f13ef55f5680bbc062ee02c36f59bb7', CURRENT_TIMESTAMP
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
  'smartsheet_0257_c576f73c', '金发科技', '制造业', '26届秋招', '["营销类","研发类","技术支持类","销售支持类","制造品质类","供应链类","IT类","财务类","建筑工程类。其他职能类"]', '["上海","广州","武汉","天津","珠海","成都","宁波","海外城市"]',
  '营销类、研发类、技术支持类、销售支持类、制造品质类、供应链类、IT类、财务类、建筑工程类。其他职能类', 'IZB8H3', 'https://kingfa.zhiye.com/campus?sessionid=-444724194', '2025-08-24T08:00:00.000Z', '招满即止', 'active',
  '🌟金发科技2026全球校招｜机会来了！
4大领域×10类岗位×80+方向
超800个offer，等你加入！
🔹国际化平台｜导师带练｜活力团队
🔹成长体系完善｜资源丰富｜前景广阔

投递通道已开，一起开启你的科技职业之路！
内推码：IZB8H3', 1, 'c576f73c5e099d294012a1e40d19aa66', CURRENT_TIMESTAMP
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
  'smartsheet_0258_093d7d6e', '浙江黎明智造股份有限公司', '制造业', '26届秋招', '["研发","项目","生产","质量","计划物流","财务","采购","人事行政","流程体系","软件开发"]', '["浙江舟山","上海","重庆"]',
  '研发、项目、生产、质量、计划物流、财务、采购、人事行政、流程体系、软件开发', 'ZJLM0018', 'https://dwz.cn/7mCTSccx', '2025-08-26T08:00:00.000Z', '招满即止', 'active',
  '🔈【上市企业】【浙江黎明智造股份有限公司】2026届校园招聘 重磅来袭！！

👔【公司介绍】：
浙江黎明智造股份有限公司是目前国内领先的汽车精密零部件生产企业，现有员工1300余人，工程师人数130+，生产零部件650多种；先后荣获“国家高新技术企业，行业隐形冠军，专精特新小巨人”等企业称号👏

🚉【招聘专业】：
机械类、材料类、计算机类、能源动力类、电气自动化类、供应链类、工业设计、管理类、文职类、财务类，岗位多样，专业覆盖全面🎉

🧚🏻‍♂️【招聘岗位】：
研发、项目、生产、质量、计划物流、财务、采购、人事行政、流程体系、软件开发

🗺️【工作地点】：
浙江舟山、上海、重庆

👩🏻‍💼【招聘对象】
✨2025/1/1—2026/12/31毕业的国内外高校毕业生
⭐不限经验和背景，只看你的潜力！！！

🛏️【福利待遇】：
🔸正式校招生：
本科年薪12-15万，管培生14万起，硕士研究生14-18万
🔸提供2人间宽敞宿舍；2年免费入住公寓；2年800-1000元/月的就业补贴；五险一金；班车；带薪假期；多重补贴工作日提供免费午餐。

🔝【工作收获】：
💪', 1, '093d7d6e67b3bd36069fbff6382b4300', CURRENT_TIMESTAMP
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
  'smartsheet_0259_305c4987', '盈峰环境', '制造业', '26届秋招', '["研发技术类","互联网IT类","技术支持类","项目运营类","营销服务类","综合管理类"]', '["长沙","顺德","绍兴","海外"]',
  '研发技术类、互联网IT类、技术支持类、项目运营类、营销服务类、综合管理类', 'EVVM8S', 'https://infore.zhiye.com/campus/jobs?shareId=7b51674d-68cd-4692-b6a0-ce36fb6cf840&shareSource=2', '2025-08-24T08:00:00.000Z', '招满即止', 'active',
  '盈峰环境2026届校招启动❗
欢迎各位26届小伙伴投递📮
一键直达心仪岗位😉
内推链接：https://infore.zhiye.com/campus/jobs?shareId=7b51674d-68cd-4692-b6a0-ce36fb6cf840&shareSource=2
内推码：EVVM8S
盈峰环境，梦想启航的地方！等你来，一起“盈”造不凡
研发技术类：研究生：19.6-30W/年，本科生15.4-25.5W/年；
技术支持类：研究生：15.4-24W/年，本科生11.2-19.5W/年；
其他类：研究生：13-16.9W/年，本科生：11.7-14.3W/年；
营销服务类岗位年收入不设上限！（营销管培生底薪1w/月起+提成，海外岗位补贴另计）', 1, '305c498732fef24fae51e171ff0ff63a', CURRENT_TIMESTAMP
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
  'smartsheet_0260_8ebac33a', '冠宇集团', '制造业', '26届秋招', '["化材&物理类","机械&电气类","电子&计算机类","综合类"]', '["珠海","重庆","嘉兴","广州","马来西亚"]',
  '化材&物理类、机械&电气类、电子&计算机类、综合类', 'EVV0AA', 'https://cosmx.zhiye.com/campus/jobs', '2025-08-26T08:00:00.000Z', '招满即止', 'active',
  '#招聘·冠宇集团 ✨
🌈BUFF加满 
我们是新能源行业！科创板上市公司！全球笔电NO1，平板NO2！储能&动力电池新势力！
👍待遇优渥 ：
本科：综合年薪15W—20W
硕士：综合年薪20W—30W
博士：综合年薪40W—60W
🎊岗位多多 :
化材&物理类、机械&电气类、电子&计算机类、综合类
5大工作城市：珠海、重庆、嘉兴、广州、马来西亚
💥网申链接：https://cosmx.zhiye.com/campus/jobs
宣讲时间：暂定9月10日 14：00
宣讲场地：待定
专属内推码：EVV0AA

欢迎更多新生力量加入冠宇，让我们一起为绿色未来助力!
了解更多招聘信息，欢迎大家进群，更有机会在宣讲会现场获得精美礼品哟🎊
(小米磁吸支架充电宝、小爱音箱Play、米家迷你保温杯等）', 1, '8ebac33ae882a5df2ef8edf91e8aab29', CURRENT_TIMESTAMP
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
  'smartsheet_0261_a98e4e75', '元戎启行', '智能驾驶', '26届秋招', '["算法类","工程类","测试与质量类"]', '["深圳","北京","上海"]',
  '算法类、工程类、测试与质量类', 'NTA46B6', 'https://app.mokahr.com/m/campus-recruitment/deeproute/145894#/home', '2025-07-03T08:00:00.000Z', '招满即止', 'active',
  '元戎启行招聘啦 
✨内推码：NTA46B6
投递链接:https://app.mokahr.com/m/campus-recruitment/deeproute/145894#/home

🔍微信公众号➡️ 元戎启行招聘，填写内推码投递就可以啦

📍工作地点：深圳、北京、上海

- 日常福利   
- 升降桌，超大工位，每日餐补，加班有夜宵
- 弹性上班时间，六险一金
- 年度体检
- 每周兴趣协会活动（公司承担费用）    
- 每月生日会、季度团建、公益活动、各大节日、入职周年纪念活动及周边礼包  
- 每年2次晋升通道，明确的职业发展路径', 1, 'a98e4e751bd574014807c54bc29ddfff', CURRENT_TIMESTAMP
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
  'smartsheet_0262_75250801', '诗悦网络', '游戏', '26届秋招', '["美术设计","技术开发","游戏策划","产品运营"]', '["广州"]',
  '美术设计、技术开发、游戏策划、产品运营', 'DSzQMRxc', 'https://app.mokahr.com/m/campus_apply/shiyuehr/72055?recommendCode=DSzQMRxc&hash=%23%2Fjobs#/jobs', '2025-08-27T08:00:00.000Z', '招满即止', 'active',
  '诗悦网络 2026 届秋招启动！
【公司简介】
✅成立于2014年，专注于精品手游研发和全球化发行，团队规模超千人
✅2024年中国互联网综合实力前百家企业
✅8款过亿精品游戏，产品布局多元化，涵盖二次元都市开放世界、塔防、回合制、MMOARPG、卡牌等类型🎮

【岗位类型】
 涵盖美术设计、技术开发、游戏策划、产品运营四大类，超多岗位任你 pick

【工作地点】广州市天河区

【超多福利】
 每月千元餐补、超棒食堂、水果下午茶、带薪假期、节日活动&礼品、年度旅游、健身房、年度体检...

【内推链接】
https://app.mokahr.com/m/campus_apply/shiyuehr/72055?recommendCode=DSzQMRxc&hash=%23%2Fjobs#/jobs

【内推码】DSzQMRxc

【腾讯文档】准诗悦er必读：5分钟了解诗悦  准诗悦er必读：5分钟了解诗悦', 1, '7525080109cc5a6937ef1c8f51617651', CURRENT_TIMESTAMP
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
  'smartsheet_0263_b616dfcf', '飞鱼科技', '游戏', '26届秋招', '["策划类","设计类","开发类","测试类","发行类","实习类"]', '["厦门","北京","新加坡"]',
  '策划类、设计类、开发类、测试类、发行类、实习类', 'DStZyYGz', 'https://app.mokahr.com/campus_apply/feiyu/142123?recommendCode=DStZyYGz#/jobs', '2025-08-17T08:00:00.000Z', '招满即止', 'active',
  '🔥《保卫萝卜》研发商飞鱼科技2026届秋招正式启动

• 2008年成立的上市游戏公司
• 研运一体发展战略

• 60+上线产品，累计用户数超过10亿
📢【多种岗位】
策划类、设计类、开发类、测试类、发行类、实习类

📍【工作城市】
厦门、北京、新加坡

💼【投递方式】
【内推通道】https://app.mokahr.com/campus_apply/feiyu/142123?recommendCode=DStZyYGz#/jobs
【内推码】DStZyYGz', 1, 'b616dfcf08989d92079273523c063c31', CURRENT_TIMESTAMP
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
  'smartsheet_0264_3963f537', '游酷盛世', '游戏', '26届秋招', '["研发类","产品类","市场类","设计类","职能类"]', '["北京市","广州市"]',
  '研发类、产品类、市场类、设计类、职能类', 'DAUE1V6', 'https://jobs.66y.com/s/Lw41PYuEshM', '2025-08-24T08:00:00.000Z', '招满即止', 'active',
  '游酷盛世2026届校园招聘启动！

【关于游酷】
成立于2014年，是一家集研发和运营于一身的休闲游戏公司，中国区App Store iphone游戏开发商收入TOP15，旗下产品累计注册用户3亿+

【岗位类别】
研发类、产品类、市场类、设计类、职能类

【工作地点】北京市，广州市

【福利待遇】行业Top级校招薪酬，有竞争力的薪酬和晋升体系，有北京户口机会

【内推链接】
https://jobs.66y.com/s/Lw41PYuEshM

【内推码】DAUE1V6（内推简历优先筛选，如有疑问/流程问题欢迎联系）

【投递Tips】大家记得在简历上体现游戏经历，不必是开发策划经历，游玩心得也可以，更容易通过简历筛选！', 1, '3963f537ba69fbf9a477d77e4a1827ba', CURRENT_TIMESTAMP
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
  'smartsheet_0265_fae1e7ed', '麦吉太文', '游戏', '26届秋招', '["休闲游戏策划","关卡策划","系统策划"]', '["北京市"]',
  '休闲游戏策划、关卡策划、系统策划', '通过内推链接投递即可', 'https://jsj.top/f/RuhMgF?x_field_1=cf', '2025-08-31T08:00:00.000Z', '招满即止', 'active',
  '🔔麦吉太文校园招聘——游戏策划

【公司介绍】麦吉太文2013年成立，一直专注在出海休闲赛道，上线的三款游戏都是三消+品类
【岗位需求】休闲游戏策划、关卡策划、系统策划
【岗位要求】本科及以上学历，专业不限，有游戏公司实习经验者优先
【投递链接】https://jsj.top/f/RuhMgF?x_field_1=cf', 1, 'fae1e7ed31f4bc3d06a8d7626a3c2728', CURRENT_TIMESTAMP
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
  'smartsheet_0266_018c1af5', '叠纸游戏', '游戏', '26届秋招', '["美术","技术","策划","运营等"]', '["上海"]',
  '美术、技术、策划、运营等', '通过内推链接投递即可', 'https://lilithgames.jobs.feishu.cn/s/6SECMp5lvKU', '2025-07-31T08:00:00.000Z', '招满即止', 'active',
  '【叠纸游戏2026秋季校招热力全开！】 
美术/技术/策划/运营...多个高能岗位任你选！
手速要快！秋招黄金期，内推码已备好→
阿叠的秋招亮点：
优先筛选buff！专属内推渠道

叠纸游戏成立于2013年8月，是一家专注于内容创作的游戏公司。
成功打造出《奇迹暖暖》《恋与制作人》《闪耀暖暖》《恋与深空》《无限暖暖》
全系列游戏产品目前已实现全球发行，累计注册用户数近4亿
在这里，你的创意将变成上亿玩家的心动回忆！

内推链接：https://lilithgames.jobs.feishu.cn/s/6SECMp5lvKU
内推免筛选，加速进度流程！', 1, '018c1af57b801f5b04fd9c8063b8eb2d', CURRENT_TIMESTAMP
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
  'smartsheet_0267_cc8e47ae', '腾讯IEG', '游戏', '26届秋招', '["产品类","技术研发","技术研究","美术＆设计类","市场＆职能类"]', '["深圳总部","上海","成都","广州","杭州及海外"]',
  '产品类、技术研发、技术研究、美术＆设计类、市场＆职能类', '通过内推链接投递即可', 'https://join.qq.com/resume.html?k=mAaUUVmnZ3UKy3_ZwnW_lw', '2025-08-10T08:00:00.000Z', '招满即止', 'active',
  '🎮【腾讯IEG 2026校园招聘正式启动】 
✨各位未来的游戏人，欢迎投递IEG！

🙋🏻‍♂【面向人群】
毕业时间在2025.1-2026.12
热爱游戏、心怀梦想的在校大学生

📣【开放岗位】
【产品类、技术研发、技术研究、美术＆设计类、市场＆职能类】五大类岗位待你挑选

🔗【内推链接】
https://join.qq.com/resume.html?k=mAaUUVmnZ3UKy3_ZwnW_lw
🔥这一局，由你主导！Start your play！

感兴趣的同学可扫码加入【腾讯游戏类岗位招聘群】群内更有校招资讯、HR答疑哦！👇👇', 1, 'cc8e47ae0b206608f00dba35410415c1', CURRENT_TIMESTAMP
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
  'smartsheet_0268_78707495', '湖南至名集团', '电商', '26届春招', '["电商运营","产品开发","新媒体运营","后期制作","采购专员"]', '["长沙市"]',
  '电商运营、产品开发、新媒体运营、 后期制作、采购专员', 'DSUhrmyv', 'https://app.mokahr.com/m/campus_apply/zm-team/126187?recommendCode=DSUhrmyv&hash=%23%2Fjobs#/jobs', '2026-02-09T08:00:00.000Z', '招满即止', 'active',
  '公司简介：创立于2015年，以电子商务为核心渠道，市场化运营与品牌众创为业务驱动，集供应链管理、电商运营、互联网医药、新媒体全赋能于一体。拥有30000+平方米物流仓储面积、18000+平方米自有办公面积、1300+专业人才、300+产品供应链

福利待遇：弹性工作制、一年多次调薪机会、免费工作餐、补充医疗、五险一金、星级公寓、带薪团建等员工福利，还有内购福利、节日礼品、花样社团等关怀。

招聘岗位：电商运营、产品开发、新媒体运营、 后期制作、采购专员

工作地点：长沙市

内推链接：https://app.mokahr.com/m/campus_apply/zm-team/126187?recommendCode=DSUhrmyv&hash=%23%2Fjobs#/jobs

内推码：DSUhrmyv

内推简历优先筛选！', 1, '7870749521b531c4e4bfc1578ca585b2', CURRENT_TIMESTAMP
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
  'smartsheet_0269_827280e2', 'ROOT 路特', '快消', '26届春招', '["技术","运营","营销","产品","职能","设计六大类热岗任你挑！"]', '["深圳","香港","海外美国","英国","马来西亚多地"]',
  '技术、运营、营销、产品、职能、设计六大类热岗任你挑！', 'DSpx3f6y', 'https://app.mokahr.com/m/campus-recruitment/rootglobal/44850?recommendCode=DSpx3f6y&hash=%23%2Fjobs#/jobs', '2026-02-23T08:00:00.000Z', '招满即止', 'active',
  '全球母婴科技领军者 ROOT 路特 2026 届春季校招启动！

⭐简介：全球母婴科技“全能选手”，Momcozy 吸奶器全球 TOP1、1000+ 专利、60+ 国业务

💼岗位：技术、运营、营销、产品、职能、设计六大类热岗任你挑！

📍工作地点：国内深圳、香港，海外美国、英国、马来西亚等多地可选～

🎁福利：有竞争力薪资 + 五险一金、各类补贴，还有定制化培养、双通道晋升等成长福利，更有落户支持、丰富团建活动暖心相伴～

📮内推链接：
https://app.mokahr.com/m/campus-recruitment/rootglobal/44850?recommendCode=DSpx3f6y&hash=%23%2Fjobs#/jobs

内推码：DSpx3f6y

内推简历，优先筛选！', 1, '827280e25b7126ff57db2ea8af1c15f3', CURRENT_TIMESTAMP
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
  'smartsheet_0270_bbcb9500', '徐福记', '快消', '26届秋招', '["财务管培生","供应链管培生","销售管培生","品牌管培生","采购管培生","技术管培生","研发及应用管培生"]', '["东莞"]',
  '财务管培生、供应链管培生、销售管培生、品牌管培生、采购管培生、技术管培生、研发及应用管培生', 'DSpeHmgz', 'https://app.mokahr.com/m/campus_apply/hfc-foods/102201?recommendCode=DSpeHmgz&hash=%23%2Fjobs#/jobs', '2025-10-16T08:00:00.000Z', '招满即止', 'active',
  '30年国民零食品牌-徐福记2026届校招今日启动！

公司简介：1992年于广东东莞创立。2025年雀巢全资收购徐福记。主要生产基地坐落于东莞，总占地面积超过50万平方米，拥有39个大型现代化车间，129条高品质自动化生产线。在全国拥有8大分部，200万售点。销售网络覆盖全国并出口至美国、加拿大、韩国、日本、澳洲、欧洲、非洲等60+国家和地区，远销海外

招聘对象：2025届&2026届毕业生

招聘岗位：财务管培生、供应链管培生、销售管培生、品牌管培生、采购管培生、技术管培生、研发及应用管培生

工作地点：东莞

内推链接：https://app.mokahr.com/m/campus_apply/hfc-foods/102201?recommendCode=DSg7XhJ7&hash=%23%2Fjobs#/jobs

内推码：DSg7XhJ7

通过内推投递，即可获得简历优先筛选福利！', 1, 'bbcb950035c485bea47133ddb6564c0e', CURRENT_TIMESTAMP
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
  'smartsheet_0271_56a3579f', '认养一头牛', '快消', '26届秋招', '["运营类","管培生类","销售类"]', '["杭州","部分岗位全国"]',
  '运营类、管培生类、销售类', 'ESVWGS', 'https://ryytn.zhiye.com/campus/jobs?shareId=169526f9-e786-48bf-b10d-dd4c129b7b34&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2025-09-07T08:00:00.000Z', '招满即止', 'active',
  '📣认养一头牛2025秋招来啦

【招聘岗位】运营类、管培生类、销售类

【工作地点】杭州、部分岗位全国

【投递链接】https://ryytn.zhiye.com/campus/jobs?shareId=169526f9-e786-48bf-b10d-dd4c129b7b34&shareSource=2&qr=1&memory=%7B%7D&silence=1
【内推码】ESVWGS 

通过内推链接/内推码投递，简历第一时间送到HR面前，快来投递吧~', 1, '56a3579fe746226ae5e7ef4b4475727f', CURRENT_TIMESTAMP
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
  'smartsheet_0272_46bd4798', '高露洁', '快消', '26届秋招', '["客户发展部培训生","电商培训生","市场部培训生","消费者创新中心培训生","计划与物流培训生","财务培训生","产品供应链培训生","全球技术研发中心培训生","商务培训生（香港）","人力资源培训生"]', '["香港","上海","广州","全国"]',
  '客户发展部培训生、电商培训生、市场部培训生、消费者创新中心培训生、计划与物流培训生、财务培训生、产品供应链培训生、全球技术研发中心培训生、商务培训生（香港）、人力资源培训生', 'DSxWT4Ba', 'https://app.mokahr.com/m/campus_apply/colpal/92762?recommendCode=DSxWT4Ba&hash=%23%2Fjobs', '2025-09-14T08:00:00.000Z', '招满即止', 'active',
  '📣快消巨头-高露洁2026届校园招聘正式启动
⚠️24-26届可投！

【公司介绍】
高露洁-棕榄是一家全球领先的日用消费品公司，拥有200多年历史，产品销往世界上200多个国家和地区。我们在口腔护理、个人护理、家庭护理、宠物营养等方面为大众提供高品质的消费品，在全球牙膏市场保持领先地位。

【招聘岗位】
🈶客户发展部培训生、电商培训生、市场部培训生、消费者创新中心培训生、计划与物流培训生、财务培训生、产品供应链培训生、全球技术研发中心培训生、商务培训生（香港）、人力资源培训生

【工作地点】
🉑香港/上海/广州/全国

【网申链接】
https://app.mokahr.com/m/campus_apply/colpal/92762?recommendCode=DSxWT4Ba&hash=%23%2Fjobs

【内推码】
DSxWT4Ba

使用内推链接/内推码投递，简历优先筛选，快人一步拿offer', 1, '46bd47981b21561352c6776efb3ced74', CURRENT_TIMESTAMP
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
  'smartsheet_0273_49168c2e', '兴业银行 - TouchCIB 数字兴业科技挑战赛', '银行', '27届实习/28届实习', '["研发赛道","AI赛道"]', '["线上"]',
  '研发赛道 / AI赛道', 'XYLZD', 'https://f.wps.cn/g/pcsiDheT/', '2026-07-21T08:00:00.000Z', '招满即止', 'active',
  '🏦 兴业银行 · TouchCIB 数字兴业科技挑战赛（7月30日截止报名）

【主办方】兴业银行股份有限公司（全球银行1000强前20强、世界500强）

【面向对象】在校学生，不限专业，热爱编程即可

【赛程】
报名：即日起 — 7月30日
初赛：8月上旬（线上全国统考）
技术交流：8月中旬（线上多对一）
决赛：8月下旬（线下训练营，ACM个人赛 + 团队编程马拉松/AI大模型编程团队赛）

【你将获得】
🎯 应届生：秋招直通终面资格；非应届生：实习机会
💰 包食宿路费 + 丰厚赛事奖励
🧠 科技大咖亲授前沿知识，零距离接触金融科技
🏆 赛事证书加持，与全国技术大牛同台竞技

【赛道方向】研发赛道 / AI赛道

【极速报名链接】
https://f.wps.cn/g/pcsiDheT/

【推荐码】XYLZD(简历优先筛选)', 1, '49168c2ed914c0ed5041d0114d9368ec', CURRENT_TIMESTAMP
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
  'smartsheet_0274_9c9a17e1', 'SGS', '检测', '26届秋招', '["检测服务销售工程师","纺织品实验室测试工程师","电子电器测试工程师","化学测试工程师","材料测试工程师等"]', '["上海","广州","深圳","宁波","青岛","南京","天津","常州","杭州","苏州","厦门","重庆","大连","郑州","顺德"]',
  '检测服务销售工程师、纺织品实验室测试工程师、电子电器测试工程师、化学测试工程师、材料测试工程师等', 'DS45raVM', 'https://app.mokahr.com/m/campus-recruitment/sgs/74104?recommendCode=DS45raVM&hash=%23%2Fjobs#/jobs', '2025-09-04T08:00:00.000Z', '招满即止', 'active',
  'SGS 2026校园招聘正式启动！

关于SGS:总部位于瑞士的SGS集团创建于1878年，是国际公认的测试、检验和认证机构。我们拥有99,500多名专业员工，分布在115个国家及地区的2,500多个分支机构和实验室，构建起全球化服务网络。

关于质优生项目：SGS质优生是SGS特有的质量检测专才新人培养项目，六年来，质优生项目培养的成员均已成为SGS坚实的中坚力量。

我们提供：有竞争力的薪资+1年快速成长计划+大平台高起点+多元发展方向+全面交流与反馈

工作地点：上海、广州、深圳、宁波、青岛、南京、天津、常州、杭州、苏州、厦门、重庆、大连、郑州、顺德

内推链接：https://app.mokahr.com/m/campus-recruitment/sgs/74104?recommendCode=DS45raVM&hash=%23%2Fjobs#/jobs

内推码：DS45raVM（内推简历优先筛选，有问题欢迎联系）

【招聘推文】
https://mp.weixin.qq.com/s/M8vPwIU6aCh1NSM8g50qgQ
了解更多招聘详情！', 1, '9c9a17e111f4394ec9a7ea20507add66', CURRENT_TIMESTAMP
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
  'smartsheet_0275_92733a61', '龙湖集团（智创生活）', '房地产', '26届秋招', '["工程管理","社区运营","品控管理","市场发展"]', '["济南","青岛"]',
  '工程管理、社区运营、品控管理、市场发展', '通过内推链接投递即即可', 'https://docs.qq.com/form/page/DRmZscHVnZEVNcFp5', '2025-09-05T08:00:00.000Z', '招满即止', 'active',
  '龙湖集团2026届仕官生热招中！（专业不限）

【龙湖集团简介】
✅成立于1993年，业务遍布全国100余城市
✅涵盖地产开发、商业投资、空间服务等多航道服务
✅连续2年入选《财富》世界500强

【龙湖智创生活集团简介】
✅中国领先的以先进科技全面赋能物业管理及商业运营的生活服务提供商
✅进驻城市100+，运营管理60+购物中心，物业管理合约面积4.4亿㎡
✅13大业态领域，为商业空间、居住空间、城市空间提供运营管理及服务

【仕官生】
仕官生项目诞生于2004年，秉持精英招聘理念，从国内外高校吸纳优秀毕业生、储备未来发展需要的中高层管理人才！

【急缺岗位】
工程管理、社区运营、品控管理、市场发展

【工作地点】济南/青岛

【心动福利】
13个月基本工资+绩效奖金、五险一金、商业补充保险、员工EAP、优惠购房、年度健康体检及各类补贴等

【极速内推通道】
https://docs.qq.com/form/page/DRmZscHVnZEVNcFp5

✅通过专属内推通道网申，简历直达面试官！', 1, '92733a617778488dc7d2e4b1bd367ffc', CURRENT_TIMESTAMP
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
  'smartsheet_0276_46558465', '若态集团', '文创', '26届秋招/日常实习', '["研发类：产品专员","CMF设计","产品设计","IP设计","软胶与硬胶建模","视觉类：摄影师","平面设计","插画师","3D渲染"]', '["苏州"]',
  '研发类：产品专员、CMF设计、产品设计、IP设计、软胶与硬胶建模
视觉类：摄影师、平面设计、插画师、3D渲染', 'EVVM13', 'https://robotime.zhiye.com/campus/jobs?shareId=1e1f1e80-38d7-41f8-acce-034d54626542&shareSource=2', '2025-08-06T08:00:00.000Z', '招满即止', 'active',
  '若态集团2026校招&2027实习生招募

【关于我们】Robotime若态，中国文化创意领军者，聚焦IP潮玩、IP衍生品开发及授权、DIY文化、机械传动模型等领域，产品畅销15000多个国内外渠道，美誉全球

【招聘岗位】研发类：产品专员、CMF设计、产品设计、IP设计、软胶与硬胶建模
视觉类：摄影师、平面设计、插画师、3D渲染

【工作地点】苏州

【内推链接】
https://robotime.zhiye.com/campus/jobs?shareId=1e1f1e80-38d7-41f8-acce-034d54626542&shareSource=2

【内推码】EVVM13

内推简历优先筛选！', 1, '46558465ed223c9db9853b3f549d3324', CURRENT_TIMESTAMP
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
  'smartsheet_0277_ae823196', '国泰汉帛', '服装', '26届秋招', '["管培生","运营","财务","单证","人事","信息技术","设计等"]', '["江苏省张家港市"]',
  '管培生、运营、财务、单证、人事、信息技术、设计等', '通过内推链接投递即可', 'https://jvvyvrptdzz.jobs.feishu.cn/972701/m/position?external_referral_code=UJ8VYAJ', '2025-08-27T08:00:00.000Z', '招满即止', 'active',
  '纺织服装头部国企 | 国泰汉帛26届校招启动！
 
- 成立时间：1992年
- 企业背景：江苏国泰国际集团股份有限公司的核心子公司
- 核心业务：以纺织服装为主业，提供从研发设计到生产技术的全供应链一站式服务
- 行业地位：连续数年位列中国毛织纱线出口企业第一名、中国纱线出口企业前三位、中国对日服装出口企业前十位

工作地点：江苏省张家港市

1、有竞争力的薪酬：基础月薪+绩效考核奖金，逐年按业绩考核提升，年薪15w+（具体以面试岗位为准）
2、完备的福利保障：双休、六险一金、食堂餐厅（每月400餐补）、大学生公寓/租房补贴、张家港市
3、人才安居租房补贴、话费补助、年节福利（转正后全年节日费7500-8000元）、带薪休假、年度体检、团建旅游；
4、充足的员工关怀：健身房、咖啡厅、婚假礼金、生育红包、大病补助、购房优惠、兴趣俱乐部；
5、特色的激励体系：股权激励、专项激励、发展基金。

招聘岗位:
管培生、运营、财务、单证、人事、信息技术、设计等

内推链接：https://jvvyvrptdzz.jobs.feishu.cn/972701/m/position?external_', 1, 'ae823196fe776a66bb5ee54454f282f6', CURRENT_TIMESTAMP
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
  'smartsheet_0278_7de50f96', '数禾科技', '金融科技', '26届秋招', '["技术开发类","数据分析及策略类","算法模型类","商务类"]', '["上海市"]',
  '技术开发类、数据分析及策略类、算法模型类、商务类', 'ESKJJJ', 'https://shuhegroup1.zhiye.com/campus/jobs?shareId=6cc5fd9b-63f5-4ed6-ae2a-e232abacd422&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2025-08-24T08:00:00.000Z', '招满即止', 'active',
  '数禾科技26届秋招启动（年薪20-46W）

【关于我们】
🏅分众传媒、新浪、红杉资本等联合投资的金融科技企业，完成B+轮融资
🏅大数据和技术为驱动的互联网金融科技公司
🏅旗下产品累计用户数超一亿

【招聘岗位】
🈶技术开发类、数据分析及策略类、算法模型类、商务类

【心动福利】
💓本科生20-42W/年，研究生22-46W/年
💓五险一金，补充公积金、商业医疗保险
💓带薪年假、下午茶、年度体检、运动俱乐部...超多福利等你来解锁！

⬇【内推链接】
https://shuhegroup1.zhiye.com/campus/jobs?shareId=6cc5fd9b-63f5-4ed6-ae2a-e232abacd422&shareSource=2&qr=1&memory=%7B%7D&silence=1

【内推码】ESKJJJ

🌟内推投递，简历优先处理，offer快人一步！', 1, '7de50f966a52266303ae161a00ebe7f3', CURRENT_TIMESTAMP
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
  'smartsheet_0279_9f206f6b', '新国都集团', '金融科技', '26届秋招', '["渠道助理","产品经理","JAVA开发工程师","网络安全工程师","区块链开发工程师","通信嵌入式工程师"]', '["深圳市"]',
  '渠道助理、产品经理、JAVA开发工程师、网络安全工程师、区块链开发工程师、通信嵌入式工程师', 'DSfzuxWp', 'https://app.mokahr.com/m/campus_apply/xgd/7850?recommendCode=DSfzuxWp&hash=%23%2Fjobs#/jobs', '2025-08-14T08:00:00.000Z', '招满即止', 'active',
  '数字支付领头羊-新国都集团26届校园招聘启动！

【关于我们】
✅2001年成立，A股上市15年，人员规模1500+
✅业务布局：硬件制造、支付服务、跨境出海、人工智能，业务遍布5大洲，产品远销90多个国家和地区
✅国家高新技术企业，深圳500强企业

【招聘岗位】
🈶渠道助理、产品经理、JAVA开发工程师、网络安全工程师、区块链开发工程师、通信嵌入式工程师

【工作地点】深圳市

【薪酬福利】
1️⃣极具竞争力的薪酬体系，年薪可高达15W-30W+
2️⃣五险一金+年终奖+期权激励+各项津贴/补贴
3️⃣年度体检+员工食堂+年度旅游+文体俱乐部

【内推链接】
https://app.mokahr.com/m/campus_apply/xgd/7850?recommendCode=DSfzuxWp&hash=%23%2Fjobs#/jobs

【内推码】DSfzuxWp

🫡选定心动岗位，内推投递帮你快人一步拿offer！', 1, '9f206f6b30ca705bb8fc06badc473535', CURRENT_TIMESTAMP
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
  'smartsheet_0280_48f55407', '越疆机器人', '机器人', '26届秋招', '["研发类","技术类","销售类","职能类"]', '["深圳","杭州","日照","部分岗位全国","全球多地设岗"]',
  '研发类、技术类、销售类、职能类', 'EVKMB9', 'https://dobot.zhiye.com/campus/jobs?shareId=87a45a3d-94ae-4cd2-87b0-26ff92db44c7&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2025-08-18T08:00:00.000Z', '招满即止', 'active',
  '越疆机器人26届校园招聘启动！

【企业简介】中国协作机器人第一股，全球领先的智能机器人研发制造商，连续六年协作机器人出口量第1，产品销往100多个国家，深入布局全球网络。

【招聘岗位】
	研发类、技术类、销售类、职能类

【工作地点】深圳、杭州、日照、部分岗位全国/全球多地设岗

【薪酬福利】
算法类30W-80W、研发类15-35W、非研发类15-25W，未来股权激励、周末双休、六险一金、大牛导师、年终奖、年度体检、员工俱乐部与健身房、各类补贴等

【内推链接】https://dobot.zhiye.com/campus/jobs?shareId=87a45a3d-94ae-4cd2-87b0-26ff92db44c7&shareSource=2&qr=1&memory=%7B%7D&silence=1

【内推码】EVKMB9

（简历优先筛选，流程跟进）', 1, '48f554075582ed0521e4c2e677b2daed', CURRENT_TIMESTAMP
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
  'smartsheet_0281_56cf4bc6', '原力灵机', '机器人', '26届秋招', '["研发技术类","算法类"]', '["北京","成都"]',
  '研发技术类、算法类', 'DSEWKnWR', 'https://app.mokahr.com/m/campus-recruitment/megviihr/150777?recommendCode=DSEWKnWR&hash=%23%2Fjobs#/jobs', '2025-07-27T08:00:00.000Z', '招满即止', 'active',
  '原力灵机2026届秋季校园招聘启动

企业介绍：Dexmal原力灵机致力于通用具身机器人的研发与制造，拥有完整的机器人软硬件设计、大模型算法训练经验与基础设施，是业内少有的能够实现大模型技术与机器人场景深度融合的具身智能公司，创业团队兼具顶尖学术背景，以及超过10年的AI原生产品规模落地经验

招聘岗位：具身智能大模型算法，具身智能强化学习算法，机器人系统算法，具身智能传感器工程师，机器人结构工程师，嵌入式硬件工程师，具身智能算法研究员等

福利待遇：充满诚意的薪酬方案+可观的长期激励（已完成多轮融资），顶尖学术背景，1v1大牛导师带教，充满活力的工作氛围…

工作地点：北京，成都

内推链接：https://app.mokahr.com/m/campus-recruitment/megviihr/150777?recommendCode=DSEWKnWR&hash=%23%2Fjobs#/jobs

内推码：DSEWKnWR（内推简历优先筛选，如有疑问/流程问题欢迎联系）', 1, '56cf4bc66900d7356822595edfc8b9d8', CURRENT_TIMESTAMP
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
  'smartsheet_0282_e1fa69b5', '锐天投资', '量化投资', '26届秋招/日常实习', '["大模型-模型训练实习生","C++实习生","量化研究员（实习","应届）"]', '["上海","北京"]',
  '大模型-模型训练实习生、C++实习生
量化研究员（实习/应届）', '通过内推链接投递即可', 'https://www.wjx.cn/vm/PKqQPmW.aspx#', '2025-08-21T08:00:00.000Z', '招满即止', 'active',
  '锐天投资26届校园招聘启动！
🏢 关于锐天
成立于2013年11月26日，具备大资金运作能力，历经市场考验，基金净值持续表现优良。2024年，公司正式成立【大模型研究中心】，聚焦金融领域AI Agent开发，致力于打造具备自主决策能力的智能投资体系。团队已在多模态数据处理、强化学习策略优化等方向取得突破性进展。

📌 招聘岗位
大模型-模型训练实习生
C++实习生
量化研究员（实习/应届）

🎁 员工福利
五险一金，自助餐，不打卡，商业医疗保险，竞争力薪资

💰 薪资待遇
💼 实习生：500-1200/天
全职：根据个人情况面议

【内推链接，简历直达hr】
https://www.wjx.cn/vm/PKqQPmW.aspx#', 1, 'e1fa69b54d447f7202a7e3178dba5663', CURRENT_TIMESTAMP
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
  'smartsheet_0283_b2e342cb', '润洲私募基金', '金融', '26届秋招', '["大宗商品研究员"]', '["杭州"]',
  '大宗商品研究员', '通过推链接投递即可', 'https://docs.qq.com/form/page/DRm51TENDRmJPY2V5', '2026-02-04T08:00:00.000Z', '招满即止', 'active',
  '润洲私募基金2026秋招校园招聘启动！

公司简介：润洲私募基金成立于2014年，是一家以产业研究为基础，综合运用期货、期权、股票等金融工具进行大类资产配置的专业机构。目前管理规模约50亿元，现有套利对冲、多资产复合等策略的私募基金产品约40支，多次荣获行业奖项

招聘岗位：大宗商品研究员
黑色组、有色组、农产品组

工作地点：杭州市

薪资福利：第1年23-25万、第2年24万（起)+丰厚的激励奖金、每年调薪机会、带薪年假、节日红包、生日福利、团队旅行、员工食堂、健身房；资深的带教老师，一对一带教、扁平化管理，简单纯粹的研究氛围、明晰的发展路径

网申链接：
https://docs.qq.com/form/page/DRm51TENDRmJPY2V5

极速网申链接，一键投递，简历直达面试官！', 1, 'b2e342cb5cb7427ddc4e86e83b10291a', CURRENT_TIMESTAMP
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
  'smartsheet_0284_1795b3f4', '美的', '消费电子', '26届秋招', '["信息技术","研发技术","财务金融","管理等"]', '["佛山","合肥","上海","广州","深圳40+海内外城市"]',
  '信息技术、研发技术、财务金融、管理等', 'M38R73
（内部推荐→选择博乐（mvp）推荐→填写：M38R73', 'https://careers.midea.com/recruit-school-wechat/job?mvp_code=M1609R', '2025-08-17T08:00:00.000Z', '招满即止', 'active',
  '🔥连续十年世界五百强【美的集团】秋招开启

🎉【企业介绍】集智能家居、楼宇科技、工业技术、机器人与自动化和创新型业务五大业务板块为一体的全球化科技集团，世界五百强企业

✨【招聘岗位】涵盖信息技术、研发技术、财务金融、管理等八大职业群，海量岗位任您选择 

🎊【工作地点】佛山、合肥、上海、广州、深圳等40+海内外城市 

🎈【投递链接】https://careers.midea.com/recruit-school-wechat/job?mvp_code=M38R73

【专属内推】M38R73
（内部推荐→选择博乐（mvp）推荐→填写：M38R73', 1, '1795b3f40ada06d2dda655fd87190d41', CURRENT_TIMESTAMP
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
  'smartsheet_0285_68b78990', '立行教育集团', '教培', '26届秋招', '["小初高各科老师","高中竞赛教练","职能管理岗","新媒体运营","管培生","市场推广岗"]', '["济南","广州"]',
  '小初高各科老师、高中竞赛教练、职能管理岗、新媒体运营、管培生、市场推广岗', 'LX0005ZN', 'https://www.wjx.cn/vm/YDtjiXA.aspx', '2025-07-27T08:00:00.000Z', '招满即止', 'active',
  '立行教育集团2026届校园招聘进行中
🎯【公司简介】集团总部位于山东济南，现拥有济南怀瑾校区、济南长清校区、济南逸家校区、济南万达校区、北京校区、广州白云校区、广州海珠校区等多个教育基地，提供小初高全阶段教育、复读、艺考生文化课、港澳台联考等服务，每年培养学生数万人。
🎯【在招岗位】小初高各科老师、高中竞赛教练、职能管理岗、新媒体运营、管培生、市场推广岗。
🎯【招聘要求】26届本硕博应届毕业生，专业不限。
🎯【公司福利】
-极具竞争力的薪资、六险一金、节日福利、娱乐活动等。
-丰富的职业发展机会和系统化的企业培训。
🎯【内推链接】https://www.wjx.cn/vm/YDtjiXA.aspx
🎯【内推码】LX0005ZN（简历优先筛选，加速流程推进）', 1, '68b78990b4d9f8e8647e964e7ff7e176', CURRENT_TIMESTAMP
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
  'smartsheet_0286_b255299e', '少年志教育', '教培', '26届春招', '["小学教师","初中教师","高中教师"]', '["武汉","长沙","南昌"]',
  '小学教师、初中教师、高中教师', '【内部推荐人姓名】Alan(从哪里看到我们选择内部推荐，推荐人姓名填写“Alan”，内推简历优先筛选！)', 'https://jsj.top/f/BFaSYY', '2026-03-03T08:00:00.000Z', '招满即止', 'active',
  '【薪资福利】专职老师年薪12w+，全职老师年薪15w+，六险一金、带薪年假、节假日福利、教师专属福利、年度体检，每年两次出游团建，免费带你吃喝玩乐~

【极速网申链接】https://jsj.top/f/BFaSYY

【内部推荐人姓名】Alan(从哪里看到我们选择内部推荐，推荐人姓名填写“Alan”，内推简历优先筛选！)', 1, 'b255299ec5e2ac2c7c9b0458822809f3', CURRENT_TIMESTAMP
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
  'smartsheet_0287_cab02a12', '极感科技', '人工智能', '26届秋招', '["研发技术类","算法类"]', '["北京","上海","成都"]',
  '研发技术类、算法类', 'DSHH4YyF', 'https://app.mokahr.com/m/campus-recruitment/megviihr/146855?recommendCode=DSHH4YyF&hash=%23%2Fjobs#/jobs', '2025-07-29T08:00:00.000Z', '招满即止', 'active',
  '极感科技 2026 秋季校园招聘全面开启！

我们的优势[鼓掌]
① 十年影像算法深耕，超强算法实力
② 解决方案100%全覆盖中国Top 10 手机厂商
③ “多平台”“多地域”“强服务”立体化生态
助力手机厂商，让每一位终端用户都能更好地感受和记录美好生活！

我们在招聘[嘿哈]
① 图像算法工程师-画质方向（北京/上海/成都）
② 图像算法工程师-人像感知方向（北京/成都）
③ 高性能计算工程师（北京/成都）

内推链接：https://app.mokahr.com/m/campus-recruitment/megviihr/146855?recommendCode=DSHH4YyF&hash=%23%2Fjobs#/jobs

内推码：DSHH4YyF

内推简历优先推进！', 1, 'cab02a12623c09c642e5e9096df5a9fc', CURRENT_TIMESTAMP
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
  'smartsheet_0288_f5704799', '超参数科技', '人工智能', '26届秋招', '["强化学习研究员","机器学习研究员","算法工程师","后台开发工程师"]', '["深圳市"]',
  '强化学习研究员、机器学习研究员、算法工程师、后台开发工程师', 'DSMsnWek', 'https://app.mokahr.com/m/campus_apply/chaocanshu/45562?recommendCode=DSMsnWek&hash=%23%2Fjobs#/jobs', '2025-08-31T08:00:00.000Z', '招满即止', 'active',
  '超参数科技2026校园招聘正式批启动啦！

✅超参数科技成立于2019年，是一家将A1和游戏深度融合的创新型科技公司
✅公司连续获得红杉中国、高瓴资本、五源资本、高榕资本等的多轮投资。在2022年跻身全球科技独角兽

❣️招聘岗位
强化学习研究员、机器学习研究员、算法工程师、后台开发工程师

❣️招聘对象
2026届应届毕业生

❣️内推链接：
https://app.mokahr.com/m/campus_apply/chaocanshu/45562?recommendCode=DSMsnWek&hash=%23%2Fjobs#/jobs

内推码：DSMsnWek

内推简历优先筛选，面试流程加快！', 1, 'f5704799b686f39ee02729847694be22', CURRENT_TIMESTAMP
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
  'smartsheet_0289_d4a11708', '三诺生物', '医药', '26届秋招', '["研发类","智能制造和供应链管理类","营销类","运营类","职能类"]', '["总部长沙","销售base全国多地"]',
  '研发类、智能制造和供应链管理类、营销类、运营类、职能类', 'yvjrxf', 'https://wecruit.hotjob.cn/SU61f128d3bef57c632bf1a77b/mc/position/campus?acotycoCode=yvjrxf&recruitType=1&isLimitShowPostScope=1', '2025-09-07T08:00:00.000Z', '招满即止', 'active',
  'Sinocare三诺生物26届秋季校园招聘启动

关于三诺：三诺生物传感股份有限公司是一家致力于利用生物传感技术及以数智化建立糖尿病等慢病全病程管理的高新技术上市公司，中国血糖检测零售市场NO.1、中国生物传感行业第一股

招聘岗位：研发类、智能制造和供应链管理类、营销类、运营类、职能类

工作地点：总部长沙，销售base全国多地

福利待遇：享Special offer媲美一线城市薪酬+优秀人才成长基金+长沙首套房首付无息贷款+超全生活福利和员工关怀

移动端内推链接：
https://wecruit.hotjob.cn/SU61f128d3bef57c632bf1a77b/mc/position/campus?acotycoCode=yvjrxf&recruitType=1&isLimitShowPostScope=1

内推码：yvjrxf（简历优先筛选，后续有问题随时联系）', 1, 'd4a1170869f4618d0eb37ae7d1bf1a43', CURRENT_TIMESTAMP
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
  'smartsheet_0290_a58077a8', '赛乐医疗', '医疗', '26届秋招', '["研发类：机械","电子","软件","算法","营销类：国内销售","海外销售","市场","其他：产品专员","项目助理","管培类：管培生"]', '["常州市"]',
  '研发类：机械/电子/软件/算法
营销类：国内销售/海外销售/市场
其他：产品专员/项目助理
管培类：管培生', 'EVKM8T', 'https://sifary.zhiye.com/campus/jobs?shareId=eedc312d-ab57-4c10-80c5-ef2e7dfd5492&shareSource=2', '2025-08-03T08:00:00.000Z', '招满即止', 'active',
  '【赛乐医疗2026届校招正式启动！】

🌟【公司介绍】
赛乐(常州)医疗科技股份有限公司，为国家专精特新小巨人企业、国家高新技术企业，国内口腔医疗器械及耗材领域龙头企业，业务布局全球约160个国家和地区，产品覆盖超百万牙医用户。公司迄今已完成A轮、A+轮、B轮融资，获得包括红杉资本、广发信德、毅达资本等多家知名机构数亿元人民币投资。

🌟【校招职位】
研发类：机械/电子/软件/算法
营销类：国内销售/海外销售/市场
其他：产品专员/项目助理
管培类：管培生

🌟【薪资福利】
✓业内高薪 | 年度调薪
✓周末双休 | 带薪年假
✓年度体检 | 团建聚餐
✓免费餐厅 | 人才公寓

🌟【校招交流Q群】
QQ群：1011593606

🌟【内推链接】
https://sifary.zhiye.com/campus/jobs?shareId=eedc312d-ab57-4c10-80c5-ef2e7dfd5492&shareSource=2

🌟【内推码】EVKM8T 

💓简历第一时间送到HR面前，快来投递吧～', 1, 'a58077a8212237dcdfba7955e817619f', CURRENT_TIMESTAMP
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
  'smartsheet_0291_196cc49c', '麦科田医疗', '医疗', '26届秋招', '["研发类","营销类","职能类","供应链及供应链类","招聘人数100+"]', '["北京","成都","深圳","济南","南京","常州","杭州","海外"]',
  '研发类/营销类/职能类/供应链及供应链类，招聘人数100+', 'ESKPK8', 'https://medcaptain.zhiye.com/campus/jobs?shareId=e0a1bcb3-cd48-4c63-9d8a-6b16626216b5&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2025-09-09T08:00:00.000Z', '招满即止', 'active',
  '独角兽-麦科田医疗2026届校招启动！
     
【公司简介】成立于2011年，是国家专精特新重点“小巨人”企业、胡润2024全球独角兽榜单企业，业务涉及生命支持、微创介入、体外诊断领域。拥有全球5个研发中心、6个制造基地，设立10个海外办事处，业务覆盖全球140+国家和地区

【薪资福利】薪酬水平有竞争力、公寓式宿舍、自助餐食堂、双导师培养制度、各类社团俱乐部等

【招聘岗位】
研发类/营销类/职能类/供应链及供应链类，招聘人数100+

【工作地点】北京、成都、深圳、济南、南京、常州、杭州、海外

【内推链接】https://medcaptain.zhiye.com/campus/jobs?shareId=e0a1bcb3-cd48-4c63-9d8a-6b16626216b5&shareSource=2&qr=1&memory=%7B%7D&silence=1

【内推码】ESKPK8

内推投递，简历优先筛选！', 1, '196cc49c43efa9f110461ef7834b38a7', CURRENT_TIMESTAMP
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
  'smartsheet_0292_266165c1', '迈瑞医疗', '医疗', '26届秋招', '["营销类","研发类","技术支持类","质量类","供应链类"]', '["北京","上海","天津","重庆","深圳","武汉全国多地"]',
  '营销类、研发类、技术支持类、质量类、供应链类', 'MRC001', 'https://mindray.zhiye.com', '2025-09-01T08:00:00.000Z', '招满即止', 'active',
  '#迈瑞医疗 #2026届 #秋招启动啦 #迈瑞长沙站
【生命科技 因你亲近】
迈瑞医疗2026届校园招聘正式开启！
我们在迈瑞等你！
网申入口：mindray.zhiye.com
迈瑞长沙站内推码:MRC001
长沙站QQ群：239049064
后续线下宣讲会等信息会及时在长沙站QQ群中告知', 1, '266165c12a27327fbf34fdd09770d950', CURRENT_TIMESTAMP
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
  'smartsheet_0293_5781dacd', '省广集团', '国企/科技', '26届秋招', '["市场营销类","策划运营类","数字媒介类","创意设计类","创意文案类","大数据类"]', '["广州","北京","武汉"]',
  '市场营销类、策划运营类、数字媒介类、创意设计类、创意文案类、大数据类', 'vsnbxc', 'https://www.hotjob.cn/wt/GIMC/mobweb/v8/position/list?openid=o0VXKwuSzIq7GLVk5Das5FUp9zTE&recruitType=1&channelId=&brandCode=1&request_locale=zh_CN', '2026-09-19T08:00:00.000Z', '招满即止', 'active',
  '秋招刚启动 | 省广集团26届秋招需求多多！

企业简介：1979年成立，广东省属国资控股企业，《财富》中国500强企业，“中国广告第一股”，国家广告产业园区，年度营收超 200 亿+，服务全球知名企业300+家

招聘岗位：市场营销类、策划运营类、数字媒介类、创意设计类、创意文案类、大数据类

工作地点：广州、北京、武汉

薪酬福利：具有竞争力的薪酬体系，五险二金，总部办公、地铁直达、无敌江景、美味饭堂，餐费补贴，交通补贴，年度体检，生日/婚育慰问，团建活动，多元广阔的晋升通道、护苗行动，职场关爱计划，活水计划，双通道培养

【PC端网申链接】
http://www.gimc.cn/

【内推码】vsnbxc
⚠️务必记得填写内推码，内推简历优先筛选，加速流程推进！', 1, '5781dacd92b017c5fea500d9211d87fb', CURRENT_TIMESTAMP
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
  'smartsheet_0294_8a1ce0e2', '华测导航', '科技', '26届秋招', '["营销岗位","研发岗位","供应链岗位","职能岗位"]', '["北京","上海","江苏","浙江","湖北","海外"]',
  '营销岗位、研发岗位、供应链岗位 、职能岗位', '通过内推链接投递即可', 'https://huace.zhiye.com/campus/jobs?shareId=d41c4cd2-068d-4cd3-b673-24ca73645800&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2025-08-24T08:00:00.000Z', '招满即止', 'active',
  '华测导航2026届校园招聘启动！
 
【公司简介】2003年成立至今，已是中国高精度时空信息产业领军者，股票代码：300627。凭借定位导航、感知测量、智能控制三大核心技术，为全球140多个国家和地区构建智能世界赋能。国内29个省级行政区设有本地化营销与服务机构，欧洲、美国、日本等12个国家/地区布局分支机构；上海、北京、武汉、南京、英国五大研发中心保驾护航，研发人员占比约50%，研发投入连续4年达17%，斩获1项国家技术发明奖、4项国家科技进步奖，手握900多项自主知识产权。

【工作地点】
北京、上海、江苏、浙江、湖北、海外
 
【薪资福利】
 有竞争力的薪资、五险一金、商业保险、节日福利、餐食补贴、健康体检、 免费运动场馆、丰富兴趣社团、多元主题活动，平衡工作与生活、奖金激励、股权激励等

【校招岗位】
 营销岗位、研发岗位、供应链岗位 、职能岗位

【内推链接】
https://huace.zhiye.com/campus/jobs?shareId=7a9bfaa5-cc3c-4696-b528-7098a7d66524&shareSource=1&qr=1&memory=%7', 1, '8a1ce0e23e052522e6312b52968d414d', CURRENT_TIMESTAMP
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
  'smartsheet_0295_fe84c98d', '朗国科技', '科技', '26届秋招', '["①研发技术类【年薪14-60w】","BSP助理工程师","安卓系统助理工程师","安卓应用助理工程师","电源系统软","硬件设计助理工程师","电子设计助理工程师","算法工程师","自动化测试开发工程师","软","硬件产品工程师等","②经营管理类【年薪12-25w】","销售工程师","项目管理培训生","人力资源管培生","供应链管培生等"]', '["广州","长沙"]',
  '①研发技术类【年薪14-60w】
BSP助理工程师、安卓系统助理工程师、安卓应用助理工程师、电源系统软/硬件设计助理工程师、电子设计助理工程师、算法工程师、自动化测试开发工程师、软/硬件产品工程师等
②经营管理类【年薪12-25w】
销售工程师、项目管理培训生、人力资源管培生、供应链管培生等', 'DStVdNec', 'https://app.mokahr.com/m/campus-recruitment/lango-tech/25020?recommendCode=DStVdNec&hash=%23%2Fjobs#/jobs', '2025-09-14T08:00:00.000Z', '招满即止', 'active',
  '全球领先AIoT核心设备软硬件方案提供商 | 朗国科技2026届校招进行中

公司简介：朗国科技是一家专注于人工智能物联网生态建设及产品设计开发的技术型公司，是国家级专精特新重点“小巨人”企业；与国内外 150 多家企业建立了全方位的战略合作伙伴关系，产品覆盖美洲、欧洲、日韩、澳洲、东南亚等国家和地区。

招聘岗位：
①研发技术类【年薪14-60w】
BSP助理工程师、安卓系统助理工程师、安卓应用助理工程师、电源系统软/硬件设计助理工程师、电子设计助理工程师、算法工程师、自动化测试开发工程师、软/硬件产品工程师等
②经营管理类【年薪12-25w】
销售工程师、项目管理培训生、人力资源管培生、供应链管培生等

工作地点：广州、长沙

内推链接：
https://app.mokahr.com/m/campus-recruitment/lango-tech/25020?recommendCode=DStVdNec&hash=%23%2Fjobs#/jobs

内推码：DStVdNec

内推简历优先筛选，面试流程加快！

招聘推文：
https://mp.weixin.qq.com/s/Eh', 1, 'fe84c98d172bd3bfd1a33cc2ac9939ed', CURRENT_TIMESTAMP
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
  'smartsheet_0296_8ca46628', '明源云', '科技', '26届秋招', '["顾问类：项目顾问（专业不限）","研发类：前端开发","后端开发","测试","职能类：人力资源岗"]', '["北京","上海","广州","深圳","武汉城市"]',
  '顾问类：项目顾问（专业不限）
研发类：前端开发、后端开发、测试
职能类：人力资源岗', 'DSRUrBpP', 'https://app.mokahr.com/campus_apply/mingyuan/116135?recommendCode=DSRUrBpP#/jobs', '2025-08-31T08:00:00.000Z', '招满即止', 'active',
  '明源云2026届校招开启！

【明源云】香港上市公司、AI SaaS软件公司、不动产行业企业管理数字化的开拓公司

【岗位需求】
顾问类：项目顾问（专业不限）
研发类：前端开发、后端开发、测试
职能类：人力资源岗


【工作地点】北京、上海、广州、深圳、武汉等城市

【内推投递】https://app.mokahr.com/campus_apply/mingyuan/116135?recommendCode=DSRUrBpP#/jobs
【内推码】DSRUrBpP

✨ 共乘AI，只等你投！', 1, '8ca4662853f88fe17b27259dc3b2f816', CURRENT_TIMESTAMP
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
  'smartsheet_0297_60b0fa54', '麦风科技', '科技', '26届春招', '["研发类","产品类","营销类","职能类"]', '["深圳"]',
  '研发类、产品类、营销类、职能类', '通过内推链接投递即可', 'https://www.imyfone.cn/campus/?phone=14789858008&nick_name=%E8%B0%A2%E7%92%87', '2026-03-02T08:00:00.000Z', '招满即止', 'active',
  '麦风科技2026届校园招聘启动！

【关于我们】麦风科技是一家面向全球、专注于消费工具软件的高新技术企业，集产品、研发、营销于一体。已荣获国家级专精特新“小巨人”企业、国家高新技术企业等资质。

【招聘岗位】研发类、产品类、营销类、职能类

【工作地点】深圳

【麦风福利】具有竞争力的薪酬、租房补贴、晚餐补贴、交通补贴、季度抽奖、文体协会、免费健身房、员工旅游、股权激励等

【内推链接】https://www.imyfone.cn/campus/?phone=14789858008&nick_name=%E8%B0%A2%E7%92%87

通过上方内推链接投递，自动计入内推，简历优先筛选！', 1, '60b0fa54ce4d5b301866015378f58998', CURRENT_TIMESTAMP
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
  'smartsheet_0298_10d45a0a', '德赛西威', '制造业', '27届实习', '["管培生","职能类","产品经理类","项目经理类","供应链类","生产制造类","算法类","软件类","硬件类","测试类","质量类"]', '["惠州","深圳","成都","南京","上海"]',
  '管培生、职能类、产品经理类、项目经理类、供应链类、生产制造类、算法类、软件类、硬件类、测试类、质量类', 'PGBYZ73', 'https://yesv-desaysv.jobs.feishu.cn/s/SkDvCpnS3nI', '2026-06-15T08:00:00.000Z', '招满即止', 'active',
  '汽车电子龙头企业-德赛西威27届暑期实习生招聘启动！

【关于我们】
✅1986年成立，深耕汽车电子领域38年，是汽车电子龙头企业，聚焦智能座舱、智能驾驶、网联服务三大领域的整合，致力于为全球客户提供智慧出行解决方案。
✅全球10个研发中心，研发投入占营收10%
✅智能座舱域控、液晶仪表、中控屏多项产品市场占有率第一！

热招岗位：管培生、职能类、产品经理类、项目经理类、供应链类、生产制造类、算法类、软件类、硬件类、测试类、质量类等

工作地点：惠州、深圳、成都、南京、上海

我们提供：有竞争力的薪资+超长带薪假期+弹性工作时间+免费宿舍+免费工作餐+免费体育设施

内推链接：
https://yesv-desaysv.jobs.feishu.cn/s/SkDvCpnS3nI

内推码：PGBYZ73（推荐方式选择大使推荐，简历优先被筛选，面试流程加快！）', 1, '10d45a0ab848b214255836439a634943', CURRENT_TIMESTAMP
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
  'smartsheet_0299_5f7185c8', '信锐技术', '科技', '26届秋招', '["市场体系","研发体系"]', '["中国大中城市分配","深圳"]',
  '市场体系、研发体系', 'NTABbEl', 'https://app.mokahr.com/campus-recruitment/sangfor/37521#/', '2025-08-14T08:00:00.000Z', '招满即止', 'active',
  '信锐技术2026届校园招聘正式启动 200+offer，工作地点遍布全国大中城市
关于信锐技术
深圳市信锐网科技术有限公司(下称“信锐”)成立于2014年,致力于为各行各业用户的数字化转型提供面向未来的网络联接产品及解决方案。自创立以来持续高增长,获评德勤中国高科技高成长企业20强,研发实力获得国际最高CMMI5等级认证。
当前信锐销售与服务网络已覆盖海内外，在全球设有40余个分支机构，员工规模近千人,在20余个国家和地区拥有服务网点，累计为10万+企业级用户提供专业的产品和服务,如:北京大学、招商银行、万象城、京东方、张家界景区、中国南方电网等。
登陆链接：https://app.mokahr.com/su/dpuhdn
填写内推码NTABbEl  邀你同行，一起联接新未来', 1, '5f7185c80cb35c31b19343a1eb18b26a', CURRENT_TIMESTAMP
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
  'smartsheet_0300_c0b9ec6f', '佰维存储', '芯片半导体', '26届秋招', '["软件类","硬件结构类","市场类","产品测试类","项目管理","产品类","技术支持类","介质研究类","质量类","职能类","封装类","销售类"]', '["深圳","成都","武汉","杭州","惠州"]',
  '软件类、硬件结构类、市场类、产品测试类、项目管理/产品类、技术支持类、介质研究类、质量类、职能类、封装类、销售类', 'ESKJJR', 'https://biwin1.zhiye.com/campus/jobs?shareId=1fef8b81-8ff3-44be-b709-38126460a75b&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2025-08-19T08:00:00.000Z', '招满即止', 'active',
  '佰维存储2026届校招启动！

【我们是】存储芯片及封测设备研发科创板上市、十大最佳国产芯片厂商

【年薪】本科15-25w；硕士：20-30w

【岗位】软件类、硬件结构类、市场类、产品测试类、项目管理/产品类、技术支持类、介质研究类、质量类、职能类、封装类、销售类

【地点】 深圳、成都、武汉、杭州、惠州

【内推链接】
https://biwin1.zhiye.com/campus/jobs?shareId=1fef8b81-8ff3-44be-b709-38126460a75b&shareSource=2&qr=1&memory=%7B%7D&silence=1

【内推码】ESKJJR
（内推简历优先筛选）', 1, 'c0b9ec6f5ef9f8c514944240a8216ab3', CURRENT_TIMESTAMP
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
  'smartsheet_0301_45e3e512', '鹏芯微', '芯片半导体', '26届秋招', '["生产运营类","研发类"]', '["深圳"]',
  '生产运营类、研发类', 'EVVYSV', 'https://career.pxwsemi.com/campus/jobs?shareId=2f08d220-baee-48b6-b85e-01d7f62a58f5&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2025-08-19T08:00:00.000Z', '招满即止', 'active',
  '🔔鹏芯微2026届秋季校园招聘启动！

【关于我们】
✅总部位于中国深圳，是深圳市重大产业投资集团有限公司旗下一家具有深圳国资背景的高新技术企业
✅致力于满足”粤港澳大湾区”汽车电子、新能源、图像传感等市场日益增长的芯片产能需求，为客户提供高附加值的产品开发支持及晶圆代工服务

【“芯”动岗位】
1⃣生产运营类
半导体设备工程师、半导体工艺工程师、生产管理工程师、生产系统开发工程师
2⃣研发类
工艺研发工程师、工艺整合研发工程师

【“芯”动福利】
🈶五险一金、带薪年休假、入职大礼包、入职车费报销、体检费报销、免费班车、员工补充商业险、年度体检、健身房、团建活动等

【内推链接】
https://career.pxwsemi.com/campus/jobs?shareId=2f08d220-baee-48b6-b85e-01d7f62a58f5&shareSource=2&qr=1&memory=%7B%7D&silence=1

【推荐码】EVVYSV 

💓使用推荐码投递，简历筛选快人一步，秋招早日拿offer！', 1, '45e3e512f8784d2a678bf40f13233ef9', CURRENT_TIMESTAMP
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
  'smartsheet_0302_8ddcba89', '国科微电子', '芯片半导体', '26届秋招', '["芯片类","算法类","软硬件类","模拟","测试","工艺","销售","职能等"]', '["长沙","深圳","成都","杭州","上海","济南"]',
  '芯片类、算法类、软硬件类、模拟、测试、工艺、销售、职能等', 'EV3MJA', 'https://goke1.zhiye.com/campus/jobs?shareId=3c03f7a5-17fb-4a64-8a51-598d9f43abfc&shareSource=1', '2025-07-29T08:00:00.000Z', '招满即止', 'active',
  '国科微电子2026届秋招启动！
 
🌟国科微电子是集成电路行业的“潜力股”，2008年在长沙诞生，已经上市，如今在智慧超高清、AI、车载电子等领域都玩得超溜。自主研发的4K/8K超高清芯片、AI视觉处理芯片等，技术实力杠杠的，还搞出了神经网络处理器（NPU），让AI在各种场景落地~
 
🎯9大类岗位全开，总有一个是你的菜！
芯片类、算法类、软硬件类、模拟、测试、工艺、销售、职能等岗位
 
📍工作地点超贴心，长沙、深圳、成都、杭州、上海、济南6大城市任你挑。
 
💡福利满满，助你职场无忧：
💰薪资有竞争力，六险一金保障你的生活；
🎂生日、节日福利超暖心，还有团建活动，工作生活两不误；
🏥年度体检，带薪年假，让你工作轻松无压力；
👨‍🏫一对一导师带教，完善培养体系，专业+管理双轨晋升，职场小白也能光速成长！
 
内推链接：https://goke1.zhiye.com/campus/jobs?shareId=3c03f7a5-17fb-4a64-8a51-598d9f43abfc&shareSource=1

内推码：EV3MJA
 
内推投递，简历优先筛选！', 1, '8ddcba89942d66111171e6e5ab95c995', CURRENT_TIMESTAMP
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
  'smartsheet_0303_41bde715', '晶合集成', '芯片半导体', '26届秋招', '["研发技术类","量产技术类","生产运营类","职能支持类","信息技术类"]', '["合肥市"]',
  '研发技术类、量产技术类、生产运营类、 职能支持类、 信息技术类', 'ESVMB9', 'https://nexchip.zhiye.com/campus/jobs?shareId=09c4e255-5208-46b8-a616-efa1034decf4&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2025-08-25T08:00:00.000Z', '招满即止', 'active',
  '晶合集成2026届校招：在芯片赛道，和我们一起“晶”彩出道！
 
关于我们：
✅ 安徽首家12英寸晶圆代工企业，2015年成立，2023年科创板上市，妥妥行业“潜力股”
✅ 专注半导体晶圆代工，覆盖150-40纳米制程，为国产芯片制造添砖加瓦，技术“硬实力”拉满
✅ 从研发到生产全链条发力，助力实现集成电路自主可控，肩负行业使命，格局“超靠谱”
 
💎 福利够实在：五险一金+补充医疗、带薪病假，年终/激励奖金+年度调薪，还有租房/子女教育补贴，生活“无压力”
💎 生活超丰富：社团活动、休闲设施、工会福利，免费工作餐+员工宿舍，打工也能“乐开花”
💎 成长有门道：研发/量产/运营等多赛道岗位开放，从技术到职能全面覆盖，还有外出培训+导师带教，职场“加速度”
 
招募对象：2026届应届生看过来！
 
招聘岗位：
  研发技术类、量产技术类
生产运营类、 职能支持类、 信息技术类
 
📌 内推链接：
https://nexchip.zhiye.com/campus/jobs?shareId=09c4e255-5208-46b8-a616-efa1034decf4&shareSour', 1, '41bde715032588d29270aa4e4ab8a3a7', CURRENT_TIMESTAMP
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
  'smartsheet_0304_0d271d20', '寒武纪', '芯片半导体', '26届秋招', '["芯片类","软件类","职能与研发支持类"]', '["北京","上海","深圳","合肥","西安","昆山"]',
  '芯片类、软件类、职能与研发支持类', 'NTAXwDZ', 'https://app.mokahr.com/campus-recruitment/cambricon/44201?locale=zh-CN&sessionid=#/jobs?project=100104136', '2025-07-31T08:00:00.000Z', '招满即止', 'active',
  '寒武纪26届秋招启动！
 
- 企业简介：寒武纪（688256.SH），2016年成立，上交所科创板上市企业，市值超2000亿元，是AI芯片领域全球知名新兴公司、中国AI芯片领域先行者 。
- 招聘对象：2025年9月 - 2026年8月毕业的海内外高校应届毕业生 。
- 招聘方向：芯片类、软件类、职能与研发支持类 。
- 岗位城市：北京、上海、深圳、合肥、西安、昆山 。
- 招聘流程：简历投递→笔试评估（部分岗位）→面试评估→人才测评→OFFER沟通 。
- 投递方式：PC端（寒武纪官网www.cambricon.com - 加入我们 - 校园招聘 ）、移动端（扫码关注【寒武纪招聘】公众号 - 应聘点选 - 校园招聘 ）、内部推荐（找寒武纪员工内推 ） 。
- 内推码：NTAXwDZ', 1, '0d271d2004dcb174ca049100131a179a', CURRENT_TIMESTAMP
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
  'smartsheet_0305_798c2960', '芯恩（青岛）', '芯片半导体', '26届秋招', '["机械工程","电气工程","控制科学与工程","电子科学与技术","智能制造工程","材料工程","工业工程与管理","物理学","化学","计算机科学与技术","软件工程等"]', '["山东省青岛市"]',
  '机械工程、电气工程、控制科学与工程、电子科学与技术、智能制造工程、材料工程、工业工程与管理、物理学、化学、计算机科学与技术、软件工程等', 'saprcb', 'https://siencampus.hotjob.cn/', '2025-08-05T08:00:00.000Z', '招满即止', 'active',
  '芯恩（青岛）集成电路有限公司2026届校园招聘正式启动！
【公司简介】芯恩（青岛）集成电路有限公司，坐落于山东省青岛市，属于国有企业，青岛市国资委独资。具备雄厚的8英寸、12英寸晶圆集成电路产品的研发和生产能力，以及一站式服务能力。公司以集成电路和分立器件产品生产为核心，满足客户多元化需求的同时，不断拓展面向消费电子、工业控制、物联网等不同应用领域的服务。
【工作地点】山东省青岛市
【招聘岗位】系统应用技术工程师、智能制造工程师、IT开发工程师、产品工程师、工艺工程师、化学分析工程师等！
【招聘专业】机械工程、电气工程、控制科学与工程、电子科学与技术、智能制造工程、材料工程、工业工程与管理、物理学、化学、计算机科学与技术、软件工程等。
【福利待遇】：硕士年薪25W+，政府一次性安家费10万元，各类补贴每年2万+。
【投递方式】专属内推码：saprcb

投递简历时填写此内推码即可获得简历优先推荐，简历直达HR！登录官网进行投递，欢迎大家积极投递！（可联系我查进度~）', 1, '798c29600019ad71c103c36758b2f2e1', CURRENT_TIMESTAMP
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
  'smartsheet_0306_0085ef01', '上海华虹集团', '芯片半导体', '26届秋招', '["工程技术类","产品品质类","研发设计类","计划信息类","智能制造类","综合职能类等"]', '["上海","无锡","成都"]',
  '工程技术类、产品品质类、研发设计类、计划信息类、智能制造类、综合职能类等', 'DSEvsab6', 'https://app.mokahr.com/m/campus_apply/huahong/78009?recommendCode=DSEvsab6&hash=%23%2Fjobs#/jobs', '2025-08-13T08:00:00.000Z', '招满即止', 'active',
  '青春如虹 向芯而行 | 上海华虹集团2026届校园招聘正式启动

> 中国芯片产业的崛起之路，期待你的加入

华虹集团是中国拥有先进芯片制造主流工艺技术的国有8+12英寸集成电路制造产业集团。作为中国集成电路产业的领军企业，现面向2026届毕业生开展大规模校园招聘，期待有志于半导体事业的优秀学子加入。
工作地点：上海，无锡，成都', 1, '0085ef01f8f81f3f96f05c1da41167d9', CURRENT_TIMESTAMP
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
  'smartsheet_0307_d48cfaeb', '联咏科技', '芯片半导体', '26届秋招', '["软件开发工程师（西安）","AI平台工程师（西安）","AI图像视频处理工程师（西安）"]', '["西安"]',
  '软件开发工程师（西安）
AI平台工程师（西安）
AI图像视频处理工程师（西安）', 'DS9psZHy', 'https://app.mokahr.com/campus-recruitment/novatek/140960?locale=zh-CN', '2025-08-18T08:00:00.000Z', '招满即止', 'active',
  '🚀【联咏科技2026届校招启动】🚀

 我们向所有同学强调：
📣5天8小时制，不提倡无意义加班，假期无工作打扰
📣年终奖金+绩效奖金+六险一金+高额旅游补助
📣 1v1新人辅导、女性友好

联咏是:
🚩 1997年成立，主要从事芯片软硬件设计、研发及销售。
·产品内容包含电视主控芯片、显示器驱动芯片、视频控制芯片及其他商用控制芯片。
🚩 2024年营收位列全球无晶圆芯片设计公司第8⃣️位;
🚩显示器驱动芯片、电视主控芯片市占全球前3⃣;
🚩三星的主要芯片供应商，供应其超过6⃣0⃣%的电视主控芯片。

【校招职位】
软件开发工程师（西安）
AI平台工程师（西安）
AI图像视频处理工程师（西安）

【简历投递】https://app.mokahr.com/campus-recruitment/novatek/140960?locale=zh-CN

⭐️【专属内推码】DS9psZHy

加入我们，一同创造美好未来！', 1, 'd48cfaeb26add9a9c3c0a1f8e5c459cd', CURRENT_TIMESTAMP
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
  'smartsheet_0308_5777afac', '阿维塔', '汽车', '26届秋招', '["三电及软件研发","整车开发","品牌创意等五大类岗位"]', '["重庆","上海"]',
  '三电及软件研发、整车开发、品牌创意等五大类岗位', '通过内推链接投递即可', 'https://xcn5vbnquq58.jobs.feishu.cn/s/ztNaGg9U4V0', '2025-08-31T08:00:00.000Z', '招满即止', 'active',
  '阿维塔2026届校招启动！邀你共赴智能出行新程
 
背靠长安智造、宁德时代电池、华为智慧出行三大巨头，阿维塔以“情感智能”打造高端电车标杆，首款车稳居30万级纯电SUV第一梯队，C轮融资超110亿元，发展势头强劲！
 
现面向2025年9月-2026年8月海内外应届生，开放三电及软件研发、整车开发、品牌创意等五大类岗位，工作地可选重庆/上海。
 
福利拉满：六险一金、餐补体检、生日礼金等，更有1V1导师带教+校招专项培养。

内推链接：https://xcn5vbnquq58.jobs.feishu.cn/s/ztNaGg9U4V0

通过内推链接投递，自动计入内推，面试更高效！', 1, '5777afacb288cb9f4753b094a78b6fbc', CURRENT_TIMESTAMP
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
  'smartsheet_0309_40d07bcd', '特斯拉中国', '汽车', '26届秋招', '["工程师（工程技术类","动力&能源类","硬件类","软件类","材料类","物流与设施运营类","销售交付类","服务类","项目管理类等）"]', '["上海","北京及全国各地"]',
  '工程师（工程技术类、动力&能源类、硬件类、软件类、材料类、物流与设施运营类、销售交付类、服务类、项目管理类等）', 'DSxPQqVP', 'https://app.mokahr.com/campus-recruitment/tesla/41460#/page/T-STAR', '2025-08-19T08:00:00.000Z', '招满即止', 'active',
  '在不设限的地方，找到真正的自己——【特斯拉中国】T-STAR-2026届校招来啦

⭐【企业简介】：特斯拉汽车设计并制造先进的电动汽车与电动动力系统。我们不懈追求创新、改进汽车性能和设计。我们同时也严格聘用并培养世界优秀的人才。
📌【招聘岗位】：工程师（工程技术类、动力&能源类、硬件类、软件类、材料类、物流与设施运营类、销售交付类、服务类、项目管理类等）
📌【工作地点】：上海、北京及全国各地
投递链接：
https://app.mokahr.com/campus-recruitment/tesla/41460#/page/T-STAR
内推码：DSxPQqVP', 1, '40d07bcdc74609e00f3c630201004461', CURRENT_TIMESTAMP
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
  'smartsheet_0310_5bf46522', '理想汽车', '汽车', '26届秋招', '["整车研发","算法与软件","芯片研发","产品","供应链与智能制造","销售与售后服务","项目管理","设计","职能与综合管理"]', '["北京","上海","常州","杭州","香港","慕尼黑；销售与售后服务类岗位覆盖全国各大城市"]',
  '整车研发、算法与软件、芯片研发、产品、供应链与智能制造、销售与售后服务、项目管理、设计、职能与综合管理', '通过内推链接投递即可', 'https://li.jobs.feishu.cn/s/dJrX8Do5WcQ', '2025-08-20T08:00:00.000Z', '招满即止', 'active',
  '理想汽车2026校园招聘：共赴未来出行新征程
 
想重塑汽车、定义未来出行？理想汽车2026校园招聘来袭，邀你同行！
 
一、关于理想
 
2015年成立，以“创造移动的家，创造幸福的家”为使命，为家庭用户造智能电动车。2024年历时58个月达成百万辆交付，创中国豪华车最快纪录，坚信汽车应实现“人工智能的汽车化”，用AI拓展出行可能。
 
二、选择理想的理由
 
1. 站在变革前沿：不做追随者，做未来出行定义者，从智能座舱到空间机器人，触摸创新脉搏。
2. 多元成长路径：覆盖整车研发、算法软件等9大岗位类别，工作地含北京、上海等国内外城市，销售售后扎根全国，适配不同人才发展。
3. 简单高效氛围：“同学文化” 打破层级，协作创新。
 
三、招聘详情
 
1. 面向人群：2025年9月 - 2026年8月毕业的海内外应届生（中国大陆以毕业证、境外以学位证为准 ）。
2. 岗位类别：整车研发、算法与软件、芯片研发等9类 。
3. 流程速览：即日起网申/内推；9月初起部分岗位笔试、面试 + 测评；10月中下旬起发offer（以岗位通知为准 ）。
4. 投递通道：理想汽车校园招聘官网；公众号「', 1, '5bf46522e856e32845ca21220d4b9868', CURRENT_TIMESTAMP
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
  'smartsheet_0311_fd1195e5', '小鹏汽车', '汽车', '26届秋招', '["自动驾驶板块","芯片板块","智能机器人板块","智能座舱板块","汽车研发板块","质量与安全板块","营销服板块","数据智能板块","制造与工艺板块","测试板块","动力三电板块","造型板块","职能板块","国际营销服板块","新零售板块"]', '["广州","深圳","上海","北京","肇庆","武汉；美国","荷兰","德国","挪威","丹麦"]',
  '自动驾驶板块、芯片板块、智能机器人板块、智能座舱板块、汽车研发板块、质量与安全板块、营销服板块、数据智能板块、制造与工艺板块、 测试板块、动力三电板块、造型板块、职能板块、国际营销服板块、新零售板块', 'NNQQ99Y', 'https://xiaopeng.jobs.feishu.cn/campus/m', '2025-06-23T08:00:00.000Z', '招满即止', 'active',
  '小鹏汽车2026届「探索者计划」全球校园招聘正式启动，诚邀每一位敢于探索的你，用敢探破局未来出行！
 
关于小鹏汽车：
- 企业定位：诞生于2014年，是一家专注未来出行的AI科技公司，也是美国纽约、中国香港两地双重主要上市的造车新势力。
- 核心优势：全球化布局，在全球多地拥有研发中心和生产基地；坚持全栈自研智能辅助驾驶软件和开发核心硬件；人才汇聚，全球超24000+名人才，研发人员占比40%+。
 
面向对象：
2025年9月-2026年8月期间毕业的国内外应届生（中国大陆院校学生以毕业证为准，非中国大陆院校学生以学位证为准）。
 
招聘岗位：
涵盖15大岗位类别、300+投递方向，具体如下：
- 自动驾驶板块、芯片板块、智能机器人板块
- 智能座舱板块、汽车研发板块、质量与安全板块
- 营销服板块、数据智能板块、制造与工艺板块
- 测试板块、动力三电板块、造型板块、职能板块
- 国际营销服板块、新零售板块
 
工作地点：
- 国内：广州、深圳、上海、北京、肇庆、武汉（新零售、交付、新媒体、售后岗位base全国）
- 国外：美国、荷兰、德国、挪威、丹麦
 
校招流程：
网申/内推', 1, 'fd1195e58f81188c1f30d7db5bcfb7ff', CURRENT_TIMESTAMP
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
  'smartsheet_0312_f03e8434', '北京大学长沙计算与数字经济研究院先进计算研究中心', '研发机构', '日常实习/27届实习', '["产品实习生","CAE研发实习生"]', '["长沙市"]',
  '产品实习生、CAE研发实习生', '通过邮箱投递即可', 'https://mailto:hr@icode.pku.edu.cn', '2025-08-28T08:00:00.000Z', '招满即止', 'active',
  '【北京大学长沙计算与数字经济研究院先进计算研究中心实习生招聘】
1⃣️方向一：产品实习生
2⃣️方向二：CAE研发实习生
【投递说明】
1.邮箱投递
邮箱：hr@icode.pku.edu.cn
邮件主题: 投递岗位-姓名-学校-最高学历', 1, 'f03e8434cd539f96b69e9f11f09f093d', CURRENT_TIMESTAMP
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
