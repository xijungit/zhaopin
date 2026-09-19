# 2027届名企校招内推、面经复盘与题库资料平台

> 采用 **Cloudflare Workers + D1 + R2 + React 19 + Vite** 全栈无服务器边缘架构，具备官网多源监控、按量积分付费与闲鱼/淘宝卡密变现闭环的移动端 H5 综合求职平台。

---

## 🌟 核心特色与功能模块

1. **🔥 官方内推广场 (Jobs)**
   - 聚合国资委 98 家重点央企、中国 500 强、互联网大厂在招岗位。
   - 【今日首发】徽章：24 小时内官网最新发布的岗位优先置顶高亮。
   - 名企官网直达九宫格：一键直达国网、三大运营商、腾讯、华为、工行等招聘主站。
   - 内推码与网申直通：100% 免费开放，支持一键复制内推码并防拦截跳转投递。

2. **💡 深度面经题库 (Experiences)**
   - 真实上岸学长学姐复盘，严格落实 **STAR 答题法则**。
   - 公开部分考察背景引流，深度拆解与满分模板通过积分（Credits）解锁，一次解锁永久查阅。

3. **📚 题库与资料宝库 (Resources)**
   - 涵盖北森/SHL 线上测评题库、历年编程笔试真题、单页中英文简历模板。
   - 积分解锁后直接展示专属网盘直达链接与提取码，支持一键复制。

4. **👤 个人中心与邀请裂变 (Profile)**
   - 积分钱包：新用户注册赠送 100 积分。
   - 邀请有礼：专属裂变短链（`/?ref=INVITE_CODE`），好友注册双方各获 50 积分。
   - 双渠道充值与电商卡密：支持在线扫码支付 + 淘宝/闲鱼卡密核销（格式 `ZPIN-XXXX-XXXX-XXXX`）。

5. **🛡️ 管理后台控制台 (Admin)**
   - 官网监控管理：支持自定义录入新企业官网，支持一键触发全网活跃渠道同步。
   - 卡密批量生成器：自定义面额、点数（1.5倍让利），一键生成并导出 CSV 用于电商发货。
   - 统计看板：全网职位量、今日首发数、总用户数、解锁与积分流水。

---

## 🛠️ 项目目录结构

```text
D:\project code\zhaopin\
├── frontend\
│   ├── dist\                      # 前端生产构建静态产物
│   ├── migrations\                # Cloudflare D1 SQLite 数据库迁移
│   │   ├── 0001_initial_auth.sql  # 用户与鉴权会话
│   │   ├── 0002_crawler_sources.sql # 招聘官网渠道源
│   │   ├── 0003_jobs_and_content.sql # 岗位、面经、资料、解锁记录
│   │   ├── 0004_points_and_payment.sql # 积分流水、订单、卡密表
│   │   └── 0005_seed_data.sql     # 38家名企官网+40条岗位+32套真题面经种子数据
│   ├── public\
│   ├── src\
│   │   ├── components\            # 卡片、支付收银台、解锁弹窗、官网添加弹窗
│   │   ├── views\                 # 4 大主 Tab + 管理后台控制台
│   │   ├── apiClient.js           # API 接口统一封装
│   │   ├── App.css                # 移动端 H5 原生响应式样式
│   │   ├── App.jsx                # 根应用
│   │   └── main.jsx
│   ├── worker\
│   │   ├── crawler\               # ATS 接口适配与岗位排重同步引擎
│   │   ├── auth.js / jobs.js / experiences.js / resources.js / points.js / admin.js
│   │   └── index.js               # Worker 入口与定时 Cron 调度器
│   ├── scripts\
│   │   └── import_seeds.mjs       # 种子数据生成与迁移整合脚本
│   ├── package.json
│   ├── vite.config.js
│   └── wrangler.jsonc             # Cloudflare D1/Assets/Cron 部署配置
├── seeds\
│   ├── soes_and_top500.json       # 38 家名企校招入口种子库
│   ├── initial_jobs.json          # 40 条精选真实在招岗位
│   └── initial_resources.json     # 16 套测评真题 + 16 篇 STAR 深度面经
└── README.md
```

---

## 🚀 本地开发与上线部署指南

### 1. 安装依赖
进入 `frontend` 目录：
```bash
cd "D:\project code\zhaopin\frontend"
npm install
```

### 2. 启动本地全栈开发环境
利用 Cloudflare Vite 插件在本地启动秒级热重载环境（同时模拟 Worker 与 D1）：
```bash
npm run dev
```

### 3. 创建与初始化 Cloudflare D1 数据库
```bash
# 创建 D1 数据库
npx wrangler d1 create zhaopin-platform-db

# 应用所有数据表结构迁移并灌入初始名企与岗位种子数据 (本地)
npx wrangler d1 migrations apply zhaopin-platform-db --local

# 应用到云端生产环境
npx wrangler d1 migrations apply zhaopin-platform-db --remote
```

### 4. 生产构建与一键发布
```bash
# 1. 构建前端生产产物
npm run build

# 2. 一键部署 Worker 逻辑与前端静态资源至 Cloudflare 全球边缘节点
npx wrangler deploy
```

---

## 💰 商业变现与卡密发货说明

1. **电商平台（闲鱼 / 淘宝 / 拼多多）**：
   - 登录系统管理后台，点击【电商卡密生成】；
   - 设置面额（如 10 元）、兑换点数（如 750 积分）、数量（如 100 张），点击生成；
   - 点击【导出卡密 CSV 表格】，直接导入发卡机器人或手动发货；
   - 用户在手机端打开 H5 页面 -> 个人中心 -> 点击【卡密兑换】 -> 输入卡密即刻到账。
2. **防吞码安全机制**：
   - 数据库底层采用状态预占更新 -> 积分入账 -> 异常自动触发反向补偿回滚（`UPDATE redemption_codes SET status='unused'...`），确保资金与账本零差异。
