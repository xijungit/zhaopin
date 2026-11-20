-- 0022_merge_all_smartsheet_subtabs.sql
-- 自动增量融合多维表格新数据与内推热更新

-- 0. 内推码与投递链接热更新
UPDATE job_referrals SET referral_code = 'qubooa', apply_url = 'https://wecruit.hotjob.cn/SU63c50f8b0dcad47488052192/mc/position/campus?acotycoCode=qubooa&orgId=0&projectId=106001%2C106201&recruitType=1&isLimitShowPostScope=1' WHERE id = 'smartsheet_0218_fbdf225c';
UPDATE job_referrals SET referral_code = '通过左侧内推链接投递即可', apply_url = 'https://www.yottagames.com.cn/zh/internal-recommendation?token=72e67cca4782632fd61e6010a3b39517-999602-3630186243&sub=030' WHERE id = 'smartsheet_0067_c0084310';
UPDATE job_referrals SET referral_code = 'EZKRB9', apply_url = 'https://join.tplinkglobal.com:443/share/jobs?share_id=2123704073190477827&share_type=ck' WHERE id = 'ref_764a1c26489cc94f';
UPDATE job_referrals SET referral_code = '2027XZLMXX【内推入口】在“联想校招官网”投递校招职位，创建简历时在我的简历-其他中“从哪儿获知招聘信息”选择“联想员工推荐”并且输入推荐人itCode：2027XZLMXX
内推简历优先筛选，面试流程加快！', apply_url = 'https://talent.lenovo.com.cn/home' WHERE id = 'ref_ac1d56129c1435a3';
UPDATE job_referrals SET referral_code = 'WSZHM62（务必填写内推码，通过链接极速投递，简历直达面试官，不需要再去阿里巴巴官网网申！offer快人一步！
）', apply_url = 'https://alidocs.dingtalk.com/notable/share/form/v01eYVOL5ozy48eAlpz_dv19yqvsgs3oebp3pcjys_1qX0QQ0?utm_source=qrcode_form&source=qrcode' WHERE id = 'smartsheet_0167_7d5d7fbd';
UPDATE job_referrals SET referral_code = 'M38R73
（内部推荐→选择博乐（mvp）推荐→填写：M38R73', apply_url = 'https://careers.midea.com/recruit-school-wechat/job?mvp_code=M1609R' WHERE id = 'smartsheet_0284_4db3012b';
UPDATE job_referrals SET referral_code = '通过内推链接投递即可', apply_url = 'https://www.yottagames.com.cn/zh/internal-recommendation?token=72e67cca4782632fd61e6010a3b39517-999602-3630186243&sub=030' WHERE id = 'smartsheet_0067_c0084310';
UPDATE job_referrals SET referral_code = 'XDHW045
（简历命名格式：内推码+应聘岗位-姓名-学校-学历）', apply_url = 'http://career.i-tek.cn/' WHERE id = 'smartsheet_0130_1743bff5';

-- 3. 新增官方内推 (referral)
INSERT OR IGNORE INTO job_referrals (id, company_name, industry, recruitment_type, job_categories, cities, job_title, referral_code, apply_url, publish_time, deadline, status, highlights, is_official_sync, dedup_hash, channel_type, soe_type) VALUES
('ref_9d77dbae19c20946', '宇通集团（急缺岗位同步）', '汽车,制造业', '27届秋招', '["【急招岗位】管培生：海外营销类管培生", "校招生：销售业务类", "售后服务类", "（注：部分岗位不限专业", "欢迎大家踊跃投递。）"]', '["郑州等"]', '宇通集团（急缺岗位同步）27届秋招官方内推', 'DSP3jNnm', 'https://app.mokahr.com/m/campus-recruitment/yutong/172567?recommendCode=DSP3jNnm#/jobs', '2026-11-20T18:54:19Z', '尽早投递', 'active', '宇通集团27届校招启动！
【公司简介】宇通是以客车、卡车为主的大型商用车集团，产品覆盖客车、卡车、工程机械、专用车和环卫设备。拥有1	个工程技术中心、	2家	上市公司（宇通客车SH.600066、宇通重工SH.600817），4个整车工厂	5	个零部件基地	；2025年营业收入493.8亿，坚定向着全球领先的新能源商用车集团目标全速前进!

【管培生计划】研发类管培生、营销类管培生、运营类管培生、生产类管培生、职能类管培生等
【校招生计划】研发技术类、生产管理储备类、销售业务类/售后服务类、财务类、法务类、人力资源类等

【福利政策】免费员工公寓、拎包入住、自营员工食堂、三餐全覆盖、健身房、探亲假、带薪事假等

【内推链接】https://app.mokahr.com/m/campus-recruitment/yutong/172567?recommendCode=DSP3jNnm#/jobs

【内推码】DSP3jNnm（优先筛选，流程加速）', 1, '9d77dbae19c20946', 'referral', ''),
('ref_aa4df52c03dbfa54', '高途集团', '教培,互联网', '27届秋招,往届可投', '["主讲老师", "HR实习生"]', '["郑州"]', '高途集团27届秋招,往届可投官方内推', 'G500 (务必填写内推码，内推投递后HR24小时内主动联系）', 'https://jsj.top/f/PRljmf', '2026-11-20T18:54:19Z', '尽早投递', 'active', '🔥高途教育科技集团秋招启动！📢26/27届应届生可投，全岗位同步开放
💼【校招岗位】主讲老师、HR实习生（需尽快入职，有转正HC）

【薪资待遇-专属福利】
基础保障：六险一金、双休，每月10号准时发薪
常规福利：带薪年假、年度体检、企业打车、企业内购、团建旅游、部门激励；入职即配置价值万元大礼包

【工作城市】郑州

【内推链接】
https://jsj.top/f/PRljmf

【内推码】G500 (务必填写内推码，内推投递后HR24小时内主动联系，面试流程加速）', 1, 'aa4df52c03dbfa54', 'referral', '');
