-- 0021_merge_all_smartsheet_subtabs.sql
-- 自动增量融合多维表格新数据与内推热更新

-- 0. 内推码与投递链接热更新
UPDATE job_referrals SET referral_code = '2027XZLMXX【内推入口】在“联想校招官网”投递校招职位，创建简历时在我的简历-其他中“从哪儿获知招聘信息”选择“联想员工推荐”并且输入推荐人itCode：2027XZLMXX
内推简历优先筛选，面试流程加快！', apply_url = 'https://talent.lenovo.com.cn/home' WHERE id = 'ref_ac1d56129c1435a3';
UPDATE job_referrals SET referral_code = '通过左侧内推链接投递即可', apply_url = 'https://www.yottagames.com.cn/zh/internal-recommendation?token=72e67cca4782632fd61e6010a3b39517-999602-3630186243&sub=030' WHERE id = 'smartsheet_0067_c0084310';
UPDATE job_referrals SET referral_code = 'M38R73
（内部推荐→选择博乐（mvp）推荐→填写：M38R73', apply_url = 'https://careers.midea.com/recruit-school-wechat/job?mvp_code=M1609R' WHERE id = 'smartsheet_0284_4db3012b';
UPDATE job_referrals SET referral_code = 'XDHW045
（简历命名格式：内推码+应聘岗位-姓名-学校-学历）', apply_url = 'http://career.i-tek.cn/' WHERE id = 'smartsheet_0130_1743bff5';
UPDATE job_referrals SET referral_code = 'WSZHM62（务必填写内推码，通过链接极速投递，简历直达面试官，不需要再去阿里巴巴官网网申！offer快人一步！
）', apply_url = 'https://alidocs.dingtalk.com/notable/share/form/v01eYVOL5ozy48eAlpz_dv19yqvsgs3oebp3pcjys_1qX0QQ0?utm_source=qrcode_form&source=qrcode' WHERE id = 'smartsheet_0167_7d5d7fbd';
UPDATE job_referrals SET referral_code = '通过内推链接投递即可', apply_url = 'https://www.yottagames.com.cn/zh/internal-recommendation?token=72e67cca4782632fd61e6010a3b39517-999602-3630186243&sub=030' WHERE id = 'smartsheet_0067_c0084310';
