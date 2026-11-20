-- 0018_merge_all_smartsheet_subtabs.sql
-- 自动增量融合多维表格新数据与内推热更新

-- 0. 内推码与投递链接热更新
UPDATE job_referrals SET referral_code = '通过左侧内推链接投递即即可', apply_url = 'https://docs.qq.com/form/page/DRnJZT2tnY25JYnpv' WHERE id = 'smartsheet_0239_dec39be2';
UPDATE job_referrals SET referral_code = '通过左侧内推链接投递即可', apply_url = 'https://www.yottagames.com.cn/zh/internal-recommendation?token=72e67cca4782632fd61e6010a3b39517-999602-3630186243&sub=030' WHERE id = 'smartsheet_0067_c0084310';
UPDATE job_referrals SET referral_code = 'DSP3jNnm', apply_url = 'https://app.mokahr.com/m/campus-recruitment/yutong/172567?recommendCode=DSP3jNnm#/jobs' WHERE id = 'smartsheet_0200_3c6d0356';
UPDATE job_referrals SET referral_code = '通过左侧内推链接直接投递即即可', apply_url = 'https://docs.qq.com/form/page/DRkhTb01jSnBpWnVz' WHERE id = 'smartsheet_0224_75166876';
UPDATE job_referrals SET referral_code = '2027XZLMXX【内推入口】在“联想校招官网”投递校招职位，创建简历时在我的简历-其他中“从哪儿获知招聘信息”选择“联想员工推荐”并且输入推荐人itCode：2027XZLMXX
内推简历优先筛选，面试流程加快！', apply_url = 'https://talent.lenovo.com.cn/home' WHERE id = 'smartsheet_0172_59169311';
UPDATE job_referrals SET referral_code = 'EVKMBG', apply_url = 'https://unilumin.zhiye.com/campus/jobs?shareId=39443e86-03aa-4492-96c3-fda6ca4ffce7&shareSource=2' WHERE id = 'smartsheet_0254_868d8582';
UPDATE job_referrals SET referral_code = 'EV3M11', apply_url = 'https://vanchen1.zhiye.com/campus/jobs?shareId=1522417d-e735-4266-ab15-bbe6695d1694&shareSource=2' WHERE id = 'smartsheet_0069_3d6f1895';
UPDATE job_referrals SET referral_code = 'DSfcJ8KP', apply_url = 'https://app.mokahr.com/m/campus-recruitment/pharmaron/45318?recommendCode=DSfcJ8KP#/jobs' WHERE id = 'smartsheet_0220_13bb0d2e';
UPDATE job_referrals SET referral_code = '通过左侧内推链接投递即即可', apply_url = 'https://docs.qq.com/form/page/DRmxsZWdHREJueXFq' WHERE id = 'smartsheet_0215_dc5339fa';
UPDATE job_referrals SET referral_code = 'XDHW045
（简历命名格式：内推码+应聘岗位-姓名-学校-学历）', apply_url = 'http://career.i-tek.cn/' WHERE id = 'smartsheet_0130_1743bff5';
UPDATE job_referrals SET referral_code = '通过左侧链接直接投递即即可', apply_url = 'https://hr.huya.com/home' WHERE id = 'smartsheet_0026_0762285a';
UPDATE job_referrals SET referral_code = 'WSZHM62（务必填写内推码，通过链接极速投递，简历直达面试官，不需要再去阿里巴巴官网网申！offer快人一步！
）', apply_url = 'https://alidocs.dingtalk.com/notable/share/form/v01eYVOL5ozy48eAlpz_dv19yqvsgs3oebp3pcjys_1qX0QQ0?utm_source=qrcode_form&source=qrcode' WHERE id = 'smartsheet_0167_7d5d7fbd';
UPDATE job_referrals SET referral_code = 'M38R73
（内部推荐→选择博乐（mvp）推荐→填写：M38R73', apply_url = 'https://careers.midea.com/recruit-school-wechat/job?mvp_code=M1609R' WHERE id = 'smartsheet_0284_4db3012b';
UPDATE job_referrals SET referral_code = '通过内推链接投递即可', apply_url = 'https://www.yottagames.com.cn/zh/internal-recommendation?token=72e67cca4782632fd61e6010a3b39517-999602-3630186243&sub=030' WHERE id = 'smartsheet_0067_c0084310';

-- 3. 新增官方内推 (referral)
INSERT OR IGNORE INTO job_referrals (id, company_name, industry, recruitment_type, job_categories, cities, job_title, referral_code, apply_url, publish_time, deadline, status, highlights, is_official_sync, dedup_hash, channel_type, soe_type) VALUES
('ref_ef133cf0e4432e1a', '牧原集团', '农业', '27届秋招', '["物流管理类", "生产类", "采购类", "食品研发类", "融资类", "安全工程类"]', '["全国多地"]', '牧原集团27届秋招官方内推', 'DS3unhd5', 'https://app.mokahr.com/m/campus-recruitment/muyuan/94624?recommendCode=DS3unhd5#/jobs', '2026-10-16T13:22:16Z', '尽早投递', 'active', '牧原集团2027届秋招启动！
【公司简介】牧原集团始创于1992年，中国500强上市企业，2025年营收1441亿！业务布局至全国25省区，108市，现有员工人数13万+！

【急缺岗位】肉食生产储备干部、生鲜客户经理；
专业不限，综合薪资15-40k

【招聘岗位】物流管理类、生产类、采购类、食品研发类、融资类	、安全工程类、销售类、品控管理岗、工程类

【工作地点】全国多地

【内推链接】https://app.mokahr.com/m/campus-recruitment/muyuan/94624?recommendCode=DS3unhd5#/jobs

【内推码】DS3unhd5（简历优先筛选，流程加速）', 1, 'ef133cf0e4432e1a', 'referral', ''),
('ref_9a097724599d88c9', '顺丰集团（hc多）', '供应链', '27届秋招', '["全国多地"]', '["十大人才航向", "包含管培生类", "职能类", "研发类", "经营管理类等", "hc充足！"]', '顺丰集团（hc多）27届秋招官方内推', '【内推码】0S97ZD（招聘信息获取渠道选择校园大使）', 'https://campus.sf-express.com/#/homePage', '2026-10-16T13:22:16Z', '尽早投递', 'active', '顺丰集团2027届秋招启动！十大人才航向3000+offer职等你来！
【关于顺丰】顺丰是亚洲最大综合物流服务提供商，世界500强企业榜单中位列372位

【招聘岗位】
十大人才航向，包含管培生类、职能类、研发类、经营管理类等，hc充足！

【工作地点】全国多地

【PC端网申链接】
https://campus.sf-express.com/#/homePage
【内推码】0S97ZD（招聘信息获取渠道选择校园大使） 

【手机端网申链接】
https://campus.sf-express.com/m/?channel=29&referCode=0S97ZD#/newGraduatesList
招聘信息获取渠道务必选择【校园大使】，简历优先筛选，后续流程问题欢迎联系！', 1, '9a097724599d88c9', 'referral', ''),
('ref_e0a39cb1c4ff668e', '远景能源（hc多）', '新能源', '27届秋招', '["研发", "工艺", "制造", "产品", "市场", "供应链"]', '["遍布全国", "海外包括东南亚", "亚非", "欧洲", "美洲等"]', '远景能源（hc多）27届秋招官方内推', 'DSWw6kDD', 'https://app.mokahr.com/m/campus_apply/envisiongroup/182094?recommendCode=DSWw6kDD#/jobs', '2026-10-16T13:22:16Z', '尽早投递', 'active', '远景能源2027秋招正式启动！13大类别，140+岗位职等你来！

【公司简介】
✅远景能源是全球领先的智能风电、智慧储能系统和绿氢解决方案公司；
✅《时代》周刊评选的“全球100家最具影响力企业”；
✅在全球设立超20个运营总部和研发中心、拥有超60个制造基地！

【招聘岗位】研发、工艺、制造、产品、市场、供应链、质量管理、工程管理、综合类等140+岗位职等你来！

【工作地点】遍布全国，海外包括东南亚、亚非、欧洲、美洲等

【福利】落户支持、补充公积金、商业保险、利润分享、食堂、下午茶、健身房、年假十天起超多福利等你来解锁！

【内推链接】
https://app.mokahr.com/m/campus_apply/envisiongroup/182094?recommendCode=DSWw6kDD#/jobs

【推荐码】DSWw6kDD（内推投递，简历优先筛选，面试流程加快！后续有流程问题欢迎随时联系！）', 1, 'e0a39cb1c4ff668e', 'referral', '');
