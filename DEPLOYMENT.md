# 校招求职综合平台部署与 GitHub 协作指南

本项目采用 **React 19 + Vite + Cloudflare Workers + Cloudflare D1 (SQLite) + Cloudflare R2** 边缘 Serverless 架构，支持无服务器秒级扩展、自动化官网监控采集以及移动端 H5 变现体系。

---

## 1. 快速入门与本地开发

### 1.1 安装与本地启动
```bash
# 1. 启动本地开发服务 (同时模拟 Worker 与本地 D1)
npm run dev

# 2. 本地数据库迁移与种子数据注入 (如需重置本地 D1)
npm run db:migrate:local

# 3. 生产环境构建检查
npm run build
```
本地服务默认运行于 `http://localhost:5173`。

---

## 2. GitHub 仓库关联与首次推送

在 GitHub (https://github.com) 创建一个名为 `zhaopin`（或您自定义名称）的空仓库，然后在当前项目根目录运行以下命令：

```bash
# 1. 添加远程仓库地址 (替换为您的实际 GitHub 仓库 URL)
git remote add origin https://github.com/<your-username>/zhaopin.git

# 2. 推送代码至 GitHub main 分支
git branch -M main
git push -u origin main
```

---

## 3. Cloudflare 线上部署配置 (初次配置)

### 3.1 登录 Cloudflare
```bash
cd frontend
npx wrangler login
```

### 3.2 创建远程 D1 数据库
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

### 3.3 更新 `wrangler.jsonc` 中的 database_id
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

### 3.4 远程执行数据库迁移与种子数据灌入
运行以下命令，将建表语句与内置的 38 家名企官网、40 个真实岗位、32 份真题/面经初始化到线上 D1 数据库：
```bash
# 根目录下执行
npm run db:migrate:remote

# 或者在 frontend 目录下执行
cd frontend
npx wrangler d1 migrations apply zhaopin-platform-db --remote
```

### 3.5 首次手动一键部署
```bash
# 根目录下执行
npm run deploy
```
部署完成后，可以通过自定义域名（如 `https://zhaopin.xuchendl.com`）或 Cloudflare 自动分配的 `*.workers.dev` 访问线上服务。

---

## 4. GitHub Actions 自动化 CI/CD 部署

本项目已内置 `.github/workflows/deploy.yml`。每次您将代码提交推送到 `main` 分支时，GitHub Actions 会自动执行构建、D1 迁移与线上部署。

### 4.1 获取 Cloudflare 凭据
1. **Cloudflare Account ID**：登录 Cloudflare Dashboard，在首页右侧面板复制 **Account ID**。
2. **Cloudflare API Token**：
   - 进入 [Cloudflare API 令牌页面](https://dash.cloudflare.com/profile/api-tokens)；
   - 点击 **创建令牌 (Create Token)** -> 选择 **Edit Cloudflare Workers** 模板；
   - 权限确保包含：`Account.Cloudflare Workers (Edit)`、`Account.D1 (Edit)`；
   - 创建后复制 Token。

### 4.2 配置 GitHub Secrets
打开您在 GitHub 上的仓库页面：
1. 点击 **Settings** -> 左侧栏 **Secrets and variables** -> **Actions**；
2. 点击 **New repository secret**，添加以下两个密钥：
   - `CLOUDFLARE_ACCOUNT_ID`：填入您的 Account ID；
   - `CLOUDFLARE_API_TOKEN`：填入您的 API Token。

配置完成后，后续任何代码提交至 `main` 即可全自动构建并发布到 Cloudflare。

---

## 5. 核心目录与功能映射

- `frontend/src/`：React 19 移动端 H5 界面组件
  - `views/JobsView.jsx`：岗位检索、首发筛选、官网直达矩阵
  - `views/ExperiencesView.jsx`：高频面经、答题技巧（积分解锁）
  - `views/ResourcesView.jsx`：笔试真题、北森测评题库、简历模板下载
  - `views/ProfileView.jsx`：个人中心、积分钱包、充值收银台、卡密兑换
  - `views/AdminView.jsx`：渠道源监控管理、腾讯文档导入、卡密批量生成
- `frontend/worker/`：Cloudflare Worker 后端路由
  - `jobs.js` / `experiences.js` / `resources.js` / `points.js` / `admin.js`
  - `crawler/`：Moka/北森等标准化 ATS 爬虫与同步调度服务（定时 Cron 执行）
- `frontend/migrations/`：D1 数据库结构与种子数据
- `seeds/`：AI 整理的央国企与 500 强渠道库及首批真实职位数据
