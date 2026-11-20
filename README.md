# 2027届名企校招内推、企业校招、央国企专区与藏宝阁求职综合平台

> 采用 **Cloudflare Workers + D1 + R2 + React 19 + Vite 8** 全栈无服务器边缘架构，具备官网多源监控、多维表格 9 大子表增量去重、9.9 元卡通萌龙门禁与闲鱼/淘宝卡密变现闭环的移动端 H5 / PC 自适应综合求职平台。

---

## 🌟 核心特色与功能模块

1. **🔥 官方内推广场 (Jobs)**
   - **真实数据全量聚合**：直连并清洗腾讯文档多维表格（Tab `BB08J2` 官方内推汇总），涵盖 316 家在招名企（如智元机器人、腾讯、沐曦股份、普渡机器人、阿里、美团、大疆、华为等）。
   - **防截断与外链直达引擎**：智能识别剥离腾讯文档 `scenario/link.html` 安全中转拦截，拦截 `...` 损坏 URL，一键直通飞书招聘、Moka、北森、腾讯校招官网，告别 404 错误。
   - **【今日首发】徽章**：24 小时内官网最新发布的岗位优先置顶高亮。
   - **名企官网直达九宫格**：一键直达国网、三大运营商、腾讯、华为、工行等招聘主站。
   - **内推码与网申直通**：100% 免费开放，支持一键复制真实内推码（如智元 `N3NGUCJ`、腾讯 `J0WFI7TE3T`、沐曦 `DSgWzfPv`）并安全跳转。

2. **🏢 企业校招专区 (Enterprise)**
   - **名企与新锐外企校招直通车**：同步清洗自腾讯多维表格“企业网申信息汇总”（Tab `tny2X0`），精选 **5,112 条**优质民企、独角兽、硬科技与知名外企官方校招网申渠道。
   - **多维自适应筛选**：覆盖芯片半导体、新能源汽车、互联网高科技、生物医药等热门赛道，支持城市、岗位类别与批次快捷过滤。

3. **🏛️ 央国企校招专区 (SOE)**
   - **体制内官方招考专区**：同步清洗自“校园招聘信息官方平台（国企央企、事业单位）”（Tab `tXOMXd`），收录 **1,350 条**权威公告，包含广大求职者关心的**保利科技、国家电网、中国移动、中国建筑、中国中车、航天科技及国有六大行**等。
   - **专属体制内性质标签**：独家支持【央企龙头】、【地方国企】、【科研事业单位】、【银行与金融机构】一键过滤与专属体制内徽章标识，直达官方公告。

4. **🏰 藏宝阁与 9.9 元卡通萌龙门禁 (Treasure Pavilion)**
   - **核心栏目收缩整合**：将“面经复盘”（1,271 篇）与“真题资料”（2,267 份，含 23 条青年人才引进政策）收缩整合至“藏宝阁”Tab。
   - **小蓝龙吉祥物沉浸动效门禁**：未激活时展示小蓝龙守护神兽（图1吉祥物）呼吸浮动动画与金色光晕粒子，弹出专属台词气泡：
     > “你是否希望用9.9元激活藏宝阁，这 9.9 元不是买卖，是你开启财富法门的钥匙。买不了吃亏，买不了上当，只为筛选有缘人。”
   - **9.9 元终身 VIP 权益**：微信/支付宝一键 9.9 元（990 分）开通会员，大厂深度面经（含 STAR 题解）与名企题库（含网盘密码与人才补贴政策）全场免积分畅享！底层完整保留独立积分配置以备未来精细化运营。

5. **👤 个人中心与隐私安全 (Profile)**
   - **隐私脱敏安全加固**：个人中心卡片彻底阻断密码明文与哈希展示，保障账号安全。
   - **安全昵称与自主修改**：新用户默认安全脱敏展示，支持自主修改个人昵称。
   - **积分钱包与邀请裂变**：新用户注册赠送 100 积分；专属裂变短链（`/?ref=INVITE_CODE`），好友注册双方各获 50 积分。
   - **双渠道充值与电商卡密**：支持在线扫码支付 + 淘宝/闲鱼卡密核销（格式 `ZPIN-XXXX-XXXX-XXXX`）。

6. **🛡️ 管理后台控制台 (Admin)**
   - **官网监控管理**：支持自定义录入新企业官网，支持一键触发全网活跃渠道同步。
   - **卡密批量生成器**：自定义面额、点数（1.5倍让利），一键生成并导出 CSV 用于电商发货。
   - **数据统计看板**：全网职位量、今日首发数、总用户数、解锁流水与订单汇总。

---

## 🛠️ 项目目录结构

```text
D:\project code\zhaopin\
├── frontend\
│   ├── dist\                      # 前端生产构建静态产物
│   ├── migrations\                # Cloudflare D1 SQLite 数据库迁移 (单调递增版本化)
│   │   ├── 0001_initial_auth.sql  # 用户与鉴权会话
│   │   ├── 0002_crawler_sources.sql # 招聘官网渠道源
│   │   ├── 0003_jobs_and_content.sql # 岗位、面经、资料、解锁记录
│   │   ├── 0004_points_and_payment.sql # 积分流水、订单、卡密表
│   │   ├── 0005_seed_data.sql     # 基础初始种子数据
│   │   ├── 0008/0009_import_real_experiences_and_resources.sql # 真实面经与通关题库
│   │   ├── 0010_import_real_smartsheet_321_referrals.sql       # 清除旧假数据，入库真实官方内推
│   │   ├── 0011_add_campus_channels_and_treasure_vip.sql       # 扩展渠道类型与藏宝阁终身VIP字段
│   │   ├── 0012_import_enterprise_and_soe_jobs.sql             # 批量导入企业校招与央国企校招岗位
│   │   └── 0013_merge_all_smartsheet_subtabs.sql               # 全量子表增量融合与人才政策
│   ├── public\
│   │   └── assets\
│   │       └── dragon_mascot.png  # 藏宝阁小蓝龙卡通吉祥物静态资产
│   ├── src\
│   │   ├── components\            # 岗位卡片、支付收银台、解锁弹窗、官网矩阵、TreasureLockModal(萌龙弹窗)
│   │   ├── views\                 # Jobs(内推) / EnterpriseJobsView(企业) / SoeJobsView(央国企) / TreasureView(藏宝阁) / Profile / Admin
│   │   ├── apiClient.js           # API 统一封装与错误熔断
│   │   ├── App.css                # 现代化自适应响应式样式与 @keyframes dragonFloat 动效
│   │   ├── App.jsx                # 根应用 (5-Tab 响应式自适应布局)
│   │   └── main.jsx
│   ├── worker\
│   │   ├── crawler\               # ATS 适配器 (ats_adapters.js 具备中转解码与截断校验)
│   │   ├── auth.js / jobs.js / experiences.js / resources.js / points.js / admin.js
│   │   └── index.js               # Worker 入口与定时 Cron 调度器
│   ├── scripts\
│   │   ├── crawler_smartsheet\  # Playwright 无头浏览器自动抓包器与 9 子表登记表配置
│   │   │   ├── headless_har_crawler.mjs # 无头浏览器自动抓包器（--onboard 登录引导）
│   │   │   └── crawler.config.json      # 9 大子表登记表/超时重试/Cookie 扩展点
│   │   ├── parse_and_merge_all_har_tabs.py # 全量子表 ZLIB 解包与 SHA-256 增量去重融合脚本
│   │   ├── extract_campus_channels.js     # 浏览器端多维表格一键导出脚本
│   │   ├── parse_campus_jobs.py           # 企业与央国企校招快速解析器
│   │   ├── parse_smartsheet_referrals.py  # 官方内推提取脚本
│   │   ├── parse_har_export.py            # HAR 逆向提取真实面经与通关题库
│   │   ├── import_smartsheet_file.mjs     # 本地多维表格文件排重解析入库
│   │   └── sync_tencent_smartsheet.mjs    # 腾讯文档在线抓取双轨同步脚本
│   ├── package.json
│   ├── vite.config.js
│   └── wrangler.jsonc             # Cloudflare D1/Assets/Cron 部署配置
├── seeds\
│   ├── docs.qq.com.har            # 腾讯多维表格全原子表网络抓包源
│   ├── smartsheet_real_jobs.json  # 真实岗位数据提纯快照
│   ├── experiences_and_resources.json # 真实真题面经快照
│   └── soes_and_top500.json       # 名企校招入口种子库
├── docs\
│   └── 校招招聘平台全栈开发与多维表格数据同步全景文档.md # 架构设计、数据工程与避坑全景指南
├── auto_sync_har.bat             # 【无人值守入口】Step0 无头浏览器自动抓包 + 增量清洗去重 + D1热更新 + 生产发布（无pause）
├── onboard_login.bat             # 【一次性登录引导】弹出可见浏览器完成登录，自动保存Cookie至 seeds/tencent_docs_cookie.txt
├── logs/                       # 无人值守运行日志（cron_sync.log / auto_sync.log / 失败截图，已gitignore）
├── update_and_deploy_har.bat      # 【人工应急通道】手动HAR归位 + 增量清洗去重 + D1热更新 + 生产发布
├── start_local_test.bat           # 【一键本地测试】Vite 8 + 本地 Miniflare D1 独立沙箱验证
├── deploy_remote.bat              # 【一键线上发布】自动管道确认迁移应用与 Worker 上线部署
├── sync_to_obsidian.bat           # 【一键知识库同步】文档同步至 Obsidian 笔记库
├── DEPLOYMENT.md                  # 生产部署与 CI/CD 配置指南
└── README.md
```

---

## 🚀 本地测试与日常更新部署指南

### 0. 【无人值守自动同步】零手工全流程 (默认推荐)
目标多维表格当前公开可匿名访问，无需任何手工操作，每日 04:00 计划任务全自动抓取并更新上线：
- **登录引导（当前无需执行，备用）**：若未来该文档改为受限权限访问，双击运行 `onboard_login.bat`，
  在弹出的浏览器窗口完成登录，脚本自动保存全部 Cookie（含 HttpOnly）至 `seeds/tencent_docs_cookie.txt`；
- **计划任务**：`Zhaopin_AutoHarSync` 每日 04:00 自动执行 `auto_sync_har.bat`：
  Playwright 无头浏览器遍历 9 大子表抓包 → 增量清洗去重 → D1 本地+远程迁移 → 构建部署生产域名；
  抓包失败自动降级到人工 HAR 通道（优先 Downloads 目录新 HAR，其次 seeds 现有 HAR，超 7 天提示数据过期）；
- **可观测性**：`logs/cron_sync.log`（计划任务全量输出）、`logs/auto_sync.log`（抓取器进度）、
  `logs/crawler_error.png`（失败现场截图）；Worker 云端 Cron 每 2 小时检测数据新鲜度，超 7 天在运行日志告警；
- **维护**：文档若改为受限权限或登录态过期，重新运行一次 `onboard_login.bat`；
  手动执行无人值守流程：双击 `auto_sync_har.bat`；卸载计划任务：`schtasks /Delete /TN Zhaopin_AutoHarSync /F`；
  调整调度时间：`schtasks /Change /TN Zhaopin_AutoHarSync /ST 06:00`。

### 1. 【人工应急通道】HAR 文件增量更新与生产全自动热部署
从腾讯文档手动导出最新的 `docs.qq.com.har`（DevTools 抓包 “Save all as HAR with content”）保存在浏览器的“下载”目录后，**只需一步操作**：
- **双击运行**：项目根目录下的 `update_and_deploy_har.bat`；
- **全自动执行 4 大阶段（全程约 30 秒）**：
  1. 自动检测用户 `Downloads` 目录并将 HAR 拷贝归位至 `seeds/docs.qq.com.har`；
  2. 调用 `parse_and_merge_all_har_tabs.py` 进行全量子表比对提纯，自动过滤已存在的历史数据，仅为全新数据生成增量迁移 SQL（无新数据时自动跳过数据库更新）；
  3. 自动向本地及 Cloudflare D1 远程数据库应用迁移；
  4. 自动编译前端产物并热发布部署 Worker 至生产域名 `https://zhaopin.qujin.vip`。

### 2. 本地独立测试环境 (先测后上)
为保证生产安全，修改界面或逻辑后，可在本地隔离测试环境中进行验证：
- **一键测试**：双击运行项目根目录 `start_local_test.bat`；
- **命令行启动**：
  ```bash
  cd frontend
  npx wrangler d1 migrations apply zhaopin-platform-db --local
  npm run dev
  ```
- **访问测试地址**：`http://localhost:5173`，验证企业校招、央国企校招（搜索“保利科技”）、藏宝阁萌龙门禁与内推直投。

### 3. 生产环境常规发布上线
当本地验证确认无误，且无需重跑 HAR 时：
- **一键发布**：双击运行项目根目录 `deploy_remote.bat`；
- **线上验收**：访问生产域名 `https://zhaopin.qujin.vip`。

---

## 📖 核心设计与数据工程开发全景文档

关于本系统的深层架构、腾讯多维表格 9 大子表 ZLIB 二进制逆向算法、AST 节点解析、复合排重哈希算法、Cloudflare D1 迁移不可变性踩坑复盘与 13 大避坑指南，详见：
👉 **[docs/校招招聘平台全栈开发与多维表格数据同步全景文档.md](docs/校招招聘平台全栈开发与多维表格数据同步全景文档.md)**

---

## 💰 商业变现与卡密发货说明

1. **藏宝阁 9.9 元终身 VIP 变现**：
   - 用户在“藏宝阁”点击开通，调起微信/支付宝支付 9.9 元（990 分）；
   - 支付成功后自动升级为终身 VIP，全场面经、真题题库与人才引进政策免积分畅读；
   - 底层依然完整保留每篇资料的 `points_required` 字段，兼顾未来未开通用户的单篇积分兑换模式。
2. **电商平台（闲鱼 / 淘宝 / 拼多多）卡密变现**：
   - 登录系统管理后台，点击【电商卡密生成】；
   - 设置面额（如 10 元）、兑换点数（如 750 积分）、数量（如 100 张），点击生成并导出 CSV；
   - 用户在手机端打开 H5 页面 -> 个人中心 -> 点击【卡密兑换】 -> 输入卡密即刻到账。
3. **防吞码安全机制**：
   - 数据库底层采用状态预占更新 -> 积分入账 -> 异常自动触发反向补偿回滚，确保资金与账本零差异。
