# 校招求职综合平台部署与 GitHub 协作指南

本项目采用 **React 19 + Vite 8 + Cloudflare Workers + Cloudflare D1 (SQLite) + Cloudflare R2** 边缘 Serverless 架构，支持无服务器秒级扩展、自动化官网监控采集以及移动端 H5 变现体系。

---

## 1. 快速入门与本地测试验证

### 1.1 一键启动本地测试环境 (推荐)
在项目根目录下直接双击运行：
`start_local_test.bat`

该脚本会自动执行：
1. 检查并应用本地 D1 SQLite 数据库迁移 (`wrangler d1 migrations apply --local`)，自动同步 6,778 条真实岗位（内推 316 / 企业 5,112 / 央国企 1,350）及 3,500+ 篇真题面经；
2. 启动全栈 Vite 8 + Miniflare 本地开发服务器 (`http://localhost:5173`)。

### 1.2 命令行手动启动
```bash
cd frontend

# 1. 应用本地 D1 数据库迁移
npx wrangler d1 migrations apply zhaopin-platform-db --local

# 2. 启动本地全栈开发环境
npm run dev
```
打开 `http://localhost:5173` 验证企业校招、央国企校招（搜索“保利科技”）、藏宝阁萌龙门禁与内推直投。

---

## 2. 日常数据更新与一键热部署 (HAR 极速流水线)

从腾讯文档导出最新的 `docs.qq.com.har` 保存到浏览器的“下载”目录后：
- **双击运行**：根目录下的 `update_and_deploy_har.bat`；
- **流水线自动处理**：
  1. 自动从 Downloads 拷贝覆盖至 `seeds/docs.qq.com.har`；
  2. 自动调用 `parse_and_merge_all_har_tabs.py` 进行全量子表比对提纯，根据 SHA-256 指纹过滤老数据，生成新迁移；
  3. 自动向本地及 Cloudflare D1 生产数据库应用迁移；
  4. 自动编译前端并发布部署 Worker 至生产域名 `https://zhaopin.qujin.vip`。

---

## 3. GitHub 仓库关联与推送

在 GitHub (https://github.com) 创建仓库，然后在当前项目根目录运行以下命令：

```bash
# 1. 添加远程仓库地址 (替换为您的实际 GitHub 仓库 URL)
git remote add origin https://github.com/<your-username>/zhaopin.git

# 2. 推送代码至 GitHub main 分支
git branch -M main
git push -u origin main
```

---

## 4. Cloudflare 线上部署配置 (初次配置)

### 4.1 登录 Cloudflare
```bash
cd frontend
npx wrangler login
```

### 4.2 创建远程 D1 数据库
在终端执行以下命令创建生产环境 D1 数据库：
```bash
npx wrangler d1 create zhaopin-platform-db
```
执行后终端会返回类似如下信息：
```text
✅ Successfully created DB 'zhaopin-platform-db'!

[[d1_databases]]
binding = "DB"
database_name = "zhaopin-platform-db"
database_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
```

### 4.3 更新 `wrangler.jsonc` 中的 database_id
打开 `frontend/wrangler.jsonc`，将上面生成的真实 UUID 填入 `database_id`：
```jsonc
  "d1_databases": [
    {
      "binding": "DB",
      "database_name": "zhaopin-platform-db",
      "database_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", // 填入上面生成的真实 UUID
      "migrations_dir": "migrations"
    }
  ]
```

### 4.4 常规生产上线部署 (推荐)
在本地测试验证无误后，在根目录下直接双击运行：
`deploy_remote.bat`

该脚本自动通过 `echo y | npx wrangler d1 migrations apply zhaopin-platform-db --remote` 确认应用远程迁移（版本 0001~0013），随后自动执行 `npm run deploy` 编译发布前端与 Worker。

### 4.5 命令行执行远程迁移与部署
```bash
cd frontend

# 1. 远程执行数据库迁移 (通过管道自动输入 y 确认)
echo y | npx wrangler d1 migrations apply zhaopin-platform-db --remote

# 2. 构建前端并发布至 Cloudflare 生产环境
npm run deploy
```
部署完成后，可以通过自定义域名（如 `https://zhaopin.qujin.vip`）或 Cloudflare 自动分配的 `*.workers.dev` 访问线上服务。

---

## 5. GitHub Actions 自动化 CI/CD 部署

本项目已内置 `.github/workflows/deploy.yml`。每次您将代码提交推送到 `main` 分支时，GitHub Actions 会自动执行构建、D1 迁移与线上部署。

### 5.1 获取 Cloudflare 凭据
1. **Cloudflare Account ID**：登录 Cloudflare Dashboard，在首页右侧面板复制 **Account ID**。
2. **Cloudflare API Token**：
   - 进入 [Cloudflare API 令牌页面](https://dash.cloudflare.com/profile/api-tokens)；
   - 点击 **创建令牌 (Create Token)** -> 选择 **Edit Cloudflare Workers** 模板；
   - 权限确保包含：`Account.Cloudflare Workers (Edit)`、`Account.D1 (Edit)`；
   - 创建后复制 Token。

### 5.2 配置 GitHub Secrets
打开您在 GitHub 上的仓库页面：
1. 点击 **Settings** -> 左侧栏 **Secrets and variables** -> **Actions**；
2. 点击 **New repository secret**，添加以下两个密钥：
   - `CLOUDFLARE_ACCOUNT_ID`：填入您的 Account ID；
   - `CLOUDFLARE_API_TOKEN`：填入您的 API Token。

配置完成后，后续任何代码提交至 `main` 即可全自动构建并发布到 Cloudflare。

---

## 6. 核心目录与功能映射

- `frontend/src/`：React 19 响应式自适应界面组件
  - `views/JobsView.jsx`：官方内推广场、首发筛选、官网直达矩阵
  - `views/EnterpriseJobsView.jsx`：企业校招专区（5,112条岗位）
  - `views/SoeJobsView.jsx`：央国企校招专区（1,350条公告，含保利科技等）
  - `views/TreasureView.jsx`：藏宝阁（收缩整合面经与真题，9.9元VIP畅读）
  - `components/TreasureLockModal.jsx`：小蓝龙吉祥物卡通悬浮动效门禁弹窗
  - `views/ProfileView.jsx`：个人中心、隐私脱敏、积分钱包、充值收银台、卡密兑换
  - `views/AdminView.jsx`：渠道源监控管理、腾讯文档导入、卡密批量生成
- `frontend/worker/`：Cloudflare Worker 后端路由
  - `jobs.js` / `experiences.js` / `resources.js` / `points.js` / `admin.js`
  - `crawler/`：Moka/北森等标准化 ATS 爬虫与同步调度服务（定时 Cron 执行）
- `frontend/migrations/`：D1 数据库结构与单调递增版本化迁移（0001~0013）
- `seeds/`：腾讯文档全量子表 HAR 与快照数据源
