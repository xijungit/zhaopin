-- 0020_merge_all_smartsheet_subtabs.sql
-- 自动增量融合多维表格新数据与内推热更新

-- 0. 内推码与投递链接热更新
UPDATE job_referrals SET referral_code = '通过内推链接投递即可', apply_url = 'https://docs.qq.com/form/page/DRnFOaEVnR1F1RXdt' WHERE id = 'ref_87e1de2cae32f2c0';
UPDATE job_referrals SET referral_code = '通过左侧内推链接投递即可', apply_url = 'https://www.yottagames.com.cn/zh/internal-recommendation?token=72e67cca4782632fd61e6010a3b39517-999602-3630186243&sub=030' WHERE id = 'smartsheet_0067_c0084310';
UPDATE job_referrals SET referral_code = 'M38R73
（内部推荐→选择博乐（mvp）推荐→填写：M38R73', apply_url = 'https://careers.midea.com/recruit-school-wechat/job?mvp_code=M1609R' WHERE id = 'smartsheet_0284_4db3012b';
UPDATE job_referrals SET referral_code = 'XDHW045
（简历命名格式：内推码+应聘岗位-姓名-学校-学历）', apply_url = 'http://career.i-tek.cn/' WHERE id = 'smartsheet_0130_1743bff5';
UPDATE job_referrals SET referral_code = 'WSZHM62（务必填写内推码，通过链接极速投递，简历直达面试官，不需要再去阿里巴巴官网网申！offer快人一步！
）', apply_url = 'https://alidocs.dingtalk.com/notable/share/form/v01eYVOL5ozy48eAlpz_dv19yqvsgs3oebp3pcjys_1qX0QQ0?utm_source=qrcode_form&source=qrcode' WHERE id = 'smartsheet_0167_7d5d7fbd';
UPDATE job_referrals SET referral_code = '通过内推链接投递即可', apply_url = 'https://www.yottagames.com.cn/zh/internal-recommendation?token=72e67cca4782632fd61e6010a3b39517-999602-3630186243&sub=030' WHERE id = 'smartsheet_0067_c0084310';

-- 3. 新增官方内推 (referral)
INSERT OR IGNORE INTO job_referrals (id, company_name, industry, recruitment_type, job_categories, cities, job_title, referral_code, apply_url, publish_time, deadline, status, highlights, is_official_sync, dedup_hash, channel_type, soe_type) VALUES
('ref_1d28a9620cd40f53', '远景能源（急缺岗位同步）', '新能源', '27届秋招', '["【急招岗位】产品开发工艺质量管理工程师", "产品解决方案工程师", "质量工程师", "产品风险与质量管理工程师", "电气设计工程师", "整机工艺工程师"]', '["遍布全国", "海外包括东南亚", "亚非", "欧洲", "美洲等"]', '远景能源（急缺岗位同步）27届秋招官方内推', 'DSWw6kDD', 'https://app.mokahr.com/m/campus_apply/envisiongroup/182094?recommendCode=DSWw6kDD#/jobs', '2026-11-10T11:40:08Z', '尽早投递', 'active', '远景能源2027秋招正式启动！13大类别，140+岗位职等你来！

【公司简介】
✅远景能源是全球领先的智能风电、智慧储能系统和绿氢解决方案公司；
✅《时代》周刊评选的“全球100家最具影响力企业”；
✅在全球设立超20个运营总部和研发中心、拥有超60个制造基地！

【招聘岗位】研发、工艺、制造、产品、市场、供应链、质量管理、工程管理、综合类等140+岗位职等你来！

【工作地点】遍布全国，海外包括东南亚、亚非、欧洲、美洲等

【福利】落户支持、补充公积金、商业保险、利润分享、食堂、下午茶、健身房、年假十天起超多福利等你来解锁！

【内推链接】
https://app.mokahr.com/m/campus_apply/envisiongroup/182094?recommendCode=DSWw6kDD#/jobs

【推荐码】DSWw6kDD（内推投递，简历优先筛选，面试流程加快！后续有流程问题欢迎随时联系！）', 1, '1d28a9620cd40f53', 'referral', ''),
('ref_d109c44cb7d9a24d', '亿联', '科技', '27届秋招', '["研发类", "产品类", "营销类"]', '["福建", "北京", "上海", "广州", "深圳等"]', '亿联27届秋招官方内推', 'EVKG9G', 'https://yealink.zhiye.com/campus/jobs?shareId=3c661137-d080-477a-b7fd-7fb6f8e2e307&shareSource=2&qr=1&memory=%7B%7D&silence=1', '2026-11-10T11:40:08Z', '尽早投递', 'active', '亿联2027届秋秋招启动！
【关于亿联】亿联 (300628)是全球领先的沟通与协作解决方案提供商，是全球TOP1 IP Phone厂商、全球TOP2微软MTR供应商、全球TOP3音视频会议出货厂商、厦门A股上市企业市值位居前列， 业绩年复合增长率连续多年超30% ，拥有3个海外子公司、5大全球体验中心

【招聘岗位】研发类、产品类、营销类、职能类

【福利待遇】顶额五险一金、丰厚年终奖、一年2次调薪机会，3年免费员工宿舍、通勤班车、租房补贴、超优惠购买厦门人才房、最高百万无息购房贷款，定期健康体检、七大运动俱乐部、部门团建基金...

【内推链接】https://yealink.zhiye.com/campus/jobs?shareId=3c661137-d080-477a-b7fd-7fb6f8e2e307&shareSource=2&qr=1&memory=%7B%7D&silence=1

【内推码】EVKG9G（简历优先筛选，面试流程更快）', 1, 'd109c44cb7d9a24d', 'referral', ''),
('ref_ac1d56129c1435a3', '联想集团（hc多/11余月13日截止网申）', '消费电子', '27届秋招', '["产品与项目", "技术", "市场与销售", "职能", "供应链", "设计"]', '["北京", "上海", "深圳", "天津", "武汉", "成都", "广州", "杭州等"]', '联想集团（hc多/11余月13日截止网申）27届秋招官方内推', '2027XZLMXX【内推入口】在“联想校招官网”投递校招职位，创建简历时在我的简历-其他中“从哪儿获知招聘信息”选择“联想员工推荐”并且输入推荐人itCode：2027XZLMXX
内推简历优先筛选，面试流程加快！', 'https://talent.lenovo.com.cn/home', '2026-11-10T11:40:08Z', '尽早投递', 'active', '联想集团2027届秋招启动！
联想是一家成立于中国、年收入超过4100亿人民币、业务遍及180个市场的全球化科技公司。

【招聘岗位】产品与项目、技术、市场与销售、职能、供应链、设计等六大方向，总有适合你的！

【20+工作地点】北京、上海、深圳、天津、武汉、成都、广州、杭州、南京、厦门、长沙、郑州、济南、沈阳、哈尔滨、昆山、南宁等

【网申链接】
https://talent.lenovo.com.cn/home

【内推码】2027XZLMXX
之前在联想校招官网已创建过简历的需要重新创建简历才能填写内推码进入内推！

【内推入口】在“联想校招官网”投递校招职位，创建简历时在我的简历-其他中“从哪儿获知招聘信息”选择“联想员工推荐”并且输入推荐人itCode：2027XZLMXX
内推简历优先筛选，面试流程加快！', 1, 'ac1d56129c1435a3', 'referral', ''),
('ref_764a1c26489cc94f', 'TP-Link联洲（急缺岗位同步）', '制造业', '27届秋招', '["【急缺岗位】技术支持工程师", "软件工程师", "产品测试工程师", "大模型应用算法工程师", "驻外售前技术支持工程师", "采购专员"]', '["深圳", "上海", "成都", "东莞", "海外"]', 'TP-Link联洲（急缺岗位同步）27届秋招官方内推', 'EZKRB9', 'https://join.tplinkglobal.com:443/share/jobs?share_id=2091011259323105282&share_type=ck', '2026-11-10T11:40:08Z', '尽早投递', 'active', 'TP-Link联洲2027届秋季校招进行中! 
💰产研&业务类：本科24.5W-50W 硕士30W-60W
💰职能支撑类：本科22W-35W 硕士25.5W-40W
💎行业龙头，涉足消费网络、消费电子、商用网络、商用安防、运营商网络、软件与云服务、家用机器人等领域的全球性跨国集团，常年稳居WLAN产品出货量全球第一。
💎27秋招9大类岗位800+HC
💎工作地点：深圳、上海、成都、东莞、海外
【薪酬福利】
💰产研&业务类：本科24.5W-50W 硕士30W-60W
💰职能支撑类：本科22W-35W 硕士25.5W-40W
【专属内推通道】
https://join.tplinkglobal.com:443/share/jobs?share_id=2091011259323105282&share_type=ck
【推荐码】EZKRB9（内推简历全程点亮，优先处理）', 1, '764a1c26489cc94f', 'referral', ''),
('ref_6d423a55d9973ea4', '腾讯银之心工作室', '游戏', '27届实习,日常实习', '["策划类", "市场运营类", "交互设计", "用户体验类", "音频类"]', '["广州"]', '腾讯银之心工作室27届实习,日常实习官方内推', 'DS9Y4zxK', 'https://app-tc.mokahr.com/m/campus_apply/sgra/20017?recommendCode=DS9Y4zxK#/jobs', '2026-11-10T11:40:08Z', '尽早投递', 'active', '腾讯旗下银之心工作室2027校招启动！
【公司简介】SGRA工作室，亦称银之心，是腾讯游戏北极光工作室群旗下位于广州的独立工作室,具备自主研发与运营能力,团队致力于全球化跨平台游戏的研发与发行

【招聘岗位】策划类、市场运营类、交互设计/用户体验类、音频类

【工作地点】腾讯广州总部大楼

【内推链接】https://app-tc.mokahr.com/m/campus_apply/sgra/20017?recommendCode=DS9Y4zxK#/jobs

【内推码】DS9Y4zxK（简历优先筛选）', 1, '6d423a55d9973ea4', 'referral', ''),
('ref_48c7be5b6c7d6bd4', '姚品国际（hc多/11月20日截止网申）', '快消', '27届秋招,往届可投', '["渠道管培生（专业不限）"]', '["全国"]', '姚品国际（hc多/11月20日截止网申）27届秋招,往届可投官方内推', 'DSBvS2Q3', 'https://app.mokahr.com/m/campus_apply/ypgj/164305?recommendCode=DSBvS2Q3#/jobs', '2026-11-10T11:40:08Z', '尽早投递', 'active', '🔥姚品国际2027渠道管培生热招｜潮玩TCG赛道高薪管培，年包15-30W！

深耕潮玩、TCG卡牌热门年轻消费赛道，不做基础销售，定向培养区域渠道负责人！

【招聘要求】
26/27届本科及以上，沟通力强、自驱力拉满，能接受出差；
潮玩/零售/快消爱好者优先，学生干部、市场销售实习经历加分！

【工作城市】上海、北京、广深、南京、武汉、长沙、西安、合肥、大连、川渝、东北多区域可选

高薪成长双通道，想深耕消费赛道、独立操盘区域业务的同学速投！

【网申链接】https://app.mokahr.com/m/campus_apply/ypgj/164305?recommendCode=DSBvS2Q3#/jobs

【内推码】DSBvS2Q3（内推简历优先筛选，面试流程加快）', 1, '48c7be5b6c7d6bd4', 'referral', ''),
('ref_60f0447b11ab83ce', '万兴科技', 'AI,科技', '27届秋招', '["产品", "研发", "营销", "设计", "职能"]', '["深圳", "长沙", "北京", "杭州", "日本东京"]', '万兴科技27届秋招官方内推', 'EVV48A', 'https://wondersharecampus.zhiye.com/campus/jobs?shareId=7e1b69bf-0993-41ac-88e5-b577d7dfa529&shareSource=2', '2026-11-10T11:40:08Z', '尽早投递', 'active', 'AIGC上市-万兴科技2027届校招启动！应届生平均年薪50万！
拿一线城市高薪|住长沙宜居房子|千全球AI事业！

【关于万兴】AIGC软件A股上市公司万兴科技是全球领先的新生代数字创意赋能者；业务范围遍及全球200多个国家和地区

【招聘岗位】产品、研发、设计、营销、职能

【工作地点】深圳、长沙、北京、杭州、日本东京

【内推链接】https://wondersharecampus.zhiye.com/campus/jobs?shareId=7e1b69bf-0993-41ac-88e5-b577d7dfa529&shareSource=2

【内推码】EVV48A(内推简历优先筛选)', 1, '60f0447b11ab83ce', 'referral', ''),
('ref_009bc8bc5050ee73', '虎牙（10月31日网申截止）', '互联网', '27届秋招', '["产品类", "运营类", "技术类", "设计类", "职能类"]', '["佛山", "广州", "深圳", "上海", "武汉"]', '虎牙（10月31日网申截止）27届秋招官方内推', '通过左侧链接直接投递即即可', 'https://hr.huya.com/home', '2026-11-10T11:40:08Z', '10月31日', 'active', '虎牙2027届校园招聘开始啦！
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

【网申链接】
https://hr.huya.com/home

了解更多校招信息
请关注【虎牙招聘】公众号', 1, '009bc8bc5050ee73', 'referral', ''),
('ref_c3cc758a02bc9f50', '嘉士伯（10月31日截止）', '快消', '27届秋招,日常实习', '["商务管理培训生", "供应链管理培训生", "职能管培生"]', '["广州", "成都", "重庆", "昆明等全国多地"]', '嘉士伯（10月31日截止）27届秋招,日常实习官方内推', 'DShMaUDS', 'https://app.mokahr.com/m/campus_apply/carlsberg/37541?recommendCode=DShMaUDS&hash=%23%2Fjobs#/jobs', '2026-11-10T11:40:08Z', '10月31日', 'active', '关于我们：嘉士伯集团是全球三大啤酒公司之一，创建于1847年，旗下180多个品牌畅销于全球150个市场。嘉士伯中国运营着由27个酒厂组成的生产供应网络和覆盖中国各省区市的市场销售网络，员工数量近7000人。

【校招项目】
商务管理培训生/供应链管理培训生

工作地点：广州、成都、重庆、昆明等全国多地

我们提供：有竞争力的薪酬待遇、外企多元福利、年终奖金、六险一金、带薪年假、年度体检、女性友好专属福利、福利酒水 Happy Hour、生日派对、节日福利、导师带教、集团内职业发展机会丰富学习资源、轮岗趣游职场等

内推链接：
https://app.mokahr.com/m/campus_apply/carlsberg/37541?recommendCode=DShMaUDS&hash=%23%2Fjobs#/jobs

内推码：DShMaUDS（简历优先筛选，后续有流程上的问题欢迎随时联系）', 1, 'c3cc758a02bc9f50', 'referral', '');
