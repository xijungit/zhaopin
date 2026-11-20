-- 0019_merge_all_smartsheet_subtabs.sql
-- 自动增量融合多维表格新数据与内推热更新

-- 0. 内推码与投递链接热更新
UPDATE job_referrals SET referral_code = '通过左侧内推链接投递即可', apply_url = 'https://www.yottagames.com.cn/zh/internal-recommendation?token=72e67cca4782632fd61e6010a3b39517-999602-3630186243&sub=030' WHERE id = 'smartsheet_0067_c0084310';
UPDATE job_referrals SET referral_code = 'M38R73
（内部推荐→选择博乐（mvp）推荐→填写：M38R73', apply_url = 'https://careers.midea.com/recruit-school-wechat/job?mvp_code=M1609R' WHERE id = 'smartsheet_0284_4db3012b';
UPDATE job_referrals SET referral_code = 'XDHW045
（简历命名格式：内推码+应聘岗位-姓名-学校-学历）', apply_url = 'http://career.i-tek.cn/' WHERE id = 'smartsheet_0130_1743bff5';
UPDATE job_referrals SET referral_code = 'EVVMA9', apply_url = 'https://xingbang1.zhiye.com/campus/jobs?shareId=abce0454-9cb8-4769-ac06-a6cdcfa0f6b3&shareSource=2' WHERE id = 'smartsheet_0035_fa04db96';
UPDATE job_referrals SET referral_code = '2027XZLMXX【内推入口】在“联想校招官网”投递校招职位，创建简历时在我的简历-其他中“从哪儿获知招聘信息”选择“联想员工推荐”并且输入推荐人itCode：2027XZLMXX
内推简历优先筛选，面试流程加快！', apply_url = 'https://talent.lenovo.com.cn/home' WHERE id = 'smartsheet_0172_59169311';
UPDATE job_referrals SET referral_code = 'ES36SJ', apply_url = 'https://woanhome.zhiye.com/campus/jobs?shareId=7a834926-7dc9-4f8f-bdc6-e8d6f945ddf4&shareSource=2' WHERE id = 'smartsheet_0139_814583af';
UPDATE job_referrals SET referral_code = 'WSZHM62（务必填写内推码，通过链接极速投递，简历直达面试官，不需要再去阿里巴巴官网网申！offer快人一步！
）', apply_url = 'https://alidocs.dingtalk.com/notable/share/form/v01eYVOL5ozy48eAlpz_dv19yqvsgs3oebp3pcjys_1qX0QQ0?utm_source=qrcode_form&source=qrcode' WHERE id = 'smartsheet_0167_7d5d7fbd';
UPDATE job_referrals SET referral_code = '通过内推链接投递即可', apply_url = 'https://www.yottagames.com.cn/zh/internal-recommendation?token=72e67cca4782632fd61e6010a3b39517-999602-3630186243&sub=030' WHERE id = 'smartsheet_0067_c0084310';

-- 3. 新增官方内推 (referral)
INSERT OR IGNORE INTO job_referrals (id, company_name, industry, recruitment_type, job_categories, cities, job_title, referral_code, apply_url, publish_time, deadline, status, highlights, is_official_sync, dedup_hash, channel_type, soe_type) VALUES
('ref_842569dcdb4b87dd', '致德新能源', '新能源', '27届秋招', '["材料研发", "工艺技术", "设备管理", "质量管理", "人力资源", "采购管理"]', '["杭州", "金华", "宜宾", "自贡"]', '致德新能源27届秋招官方内推', '通过内推链接投递即可', 'https://docs.qq.com/form/page/DRnF3SEVhanRVR1RX', '2026-10-27T12:55:21Z', '尽早投递', 'active', '致德新能源2027届校招启动！
🔥公司简介：致德新能源是国家专精特新“小巨人”企业，专注锂电及固态电池硅基负极材料研发、生产与销售。公司具备一体化核心设备自主研发能力，实现关键技术自主可控，硅碳负极产品性能对标行业主流高端水准，广泛应用于新能源汽车、消费电子、无人机等领域，已完成多轮知名机构股权投资
        
📝校招岗位：材料研发、工艺技术、设备管理、质量管理、人力资源、采购管理、财务管理等

🎓招聘对象：2027届全球高校应届毕业生

⛳工作地点：杭州、金华、宜宾、自贡

[哇]薪酬福利：
1、本科生9-15万、硕士13-22万、博士一人一议
2、免费食宿、通勤班车、节日礼品、带薪年假、免费体检

👉极速网申通道：
https://docs.qq.com/form/page/DRnF3SEVhanRVR1RX
一分钟丝滑投递，简历直达面试官！', 1, '842569dcdb4b87dd', 'referral', ''),
('ref_ab80b50c6c3bedc4', '吉客印', '跨境电商', '27届秋招', '["管培生", "采购", "运营", "营销"]', '["郑州"]', '吉客印27届秋招官方内推', 'DSDt6hMW', 'https://app.mokahr.com/m/campus_apply/giikin/94708?recommendCode=DSDt6hMW#/jobs', '2026-10-27T12:55:21Z', '尽早投递', 'active', '跨境电商龙头-吉客印（吉宏电商）2027校园招聘启动！
公司简介：吉客印是A+H双上市企业吉宏股份全资控股跨境B2C电商，2017年成立，团队2300+，业务覆盖全球50+国家，年GMV突破50亿，依托AI深耕跨境赛道。
 
招聘岗位：管培生、采购、运营、营销、开发等
 
工作地点：郑州市

【内推链接】https://app.mokahr.com/m/campus_apply/giikin/94708?recommendCode=DSDt6hMW#/jobs

【内推码】DSDt6hMW（简历优先筛选，加速进入面试流程）', 1, 'ab80b50c6c3bedc4', 'referral', ''),
('ref_268b320d3cb44d9d', '固德威（10月31日截止）', '能源电力', '27届秋招', '["研发类", "职能类", "营销类", "技术服务类", "制造技术类"]', '["苏州", "武汉", "深圳", "安徽广德", "佛山顺德"]', '固德威（10月31日截止）27届秋招官方内推', 'ymezfz', 'https://wecruit.hotjob.cn/SU630a3a1f2f9d2406b4f6c5f7/mc/position/campus?acotycoCode=ymezfz&projectId=200701&recruitType=1&isLimitShowPostScope=1', '2026-10-27T12:55:21Z', '尽早有投递', 'active', '固德威27届秋季校招启动！ 
公司简介：固德威(股票代码:688390)，是全球逆变器Top10 & 连续9年大苏州最佳雇主，产品与服务覆盖全球100多个国家和地区，在全球设有12个海外子公司和30个销售与服务中心；全球拥有8000+名员工，并在苏州、南京、武汉、深圳、顺德设立5大研发中心。

岗位类别：研发类、职能类、营销类、技术服务类、制造技术类

工作地点：苏州/武汉/深圳/安徽广德/佛山顺德

内推链接：
https://wecruit.hotjob.cn/SU630a3a1f2f9d2406b4f6c5f7/mc/position/campus?acotycoCode=ymezfz&projectId=200701&recruitType=1&isLimitShowPostScope=1

内推码：ymezfz（简历优先筛选，流程加速）', 1, '268b320d3cb44d9d', 'referral', ''),
('ref_87e1de2cae32f2c0', '惠州德赛电池', '制造业', '27届秋招', '["运营类", "品质类", "技术类", "研发类", "销售", "职能管理类"]', '["惠州"]', '惠州德赛电池27届秋招官方内推', '通过内推链接投递即即可', 'https://docs.qq.com/form/page/DRnFOaEVnR1F1RXdt', '2026-10-27T12:55:21Z', '尽早投递', 'active', '📣惠州德赛电池2026届秋季校园招聘正式启动！

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
https://docs.qq.com/form/page/DRnFOaEVnR1F1RXdt

🌟Join us！点亮未来！ 
🤝惠州德赛电池诚邀你的加入！', 1, '87e1de2cae32f2c0', 'referral', '');
