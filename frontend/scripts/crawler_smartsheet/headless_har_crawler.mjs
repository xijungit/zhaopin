#!/usr/bin/env node
/**
 * 【腾讯文档多维表格 无头浏览器 HAR 自动抓取器】
 * ------------------------------------------------------
 * 功能：使用 Playwright 无头 Chromium 自动打开腾讯文档多维表格，
 *       依次遍历 9 大子表，模拟人工点击切表 + 虚拟列表滚动到底部，
 *       通过 Playwright recordHar 完整录制全部 dop-api ZLIB 数据响应，
 *       组装标准 HAR 落盘至 seeds/docs.qq.com.har，
 *       下游 parse_and_merge_all_har_tabs.py ZLIB 解码/增量去重流水线原样复用。
 *
 * 使用：node frontend/scripts/crawler_smartsheet/headless_har_crawler.mjs
 * 退出码：0 = 抓取成功；1 = 抓取失败（失败现场截图 logs/crawler_error.png 供排查）
 *
 * 测试钩子：设置环境变量 FORCE_CRAWLER_FAIL=1 可模拟启动失败（用于无人值守降级演练 T3）。
 *
 * 登录引导：node headless_har_crawler.mjs --onboard
 *   弹出可见浏览器窗口，人工完成登录（文档需登录态时），脚本自动探测数据接口生效，
 *   并将全部 Cookie（含 HttpOnly）保存至 seeds/tencent_docs_cookie.txt；
 *   后续无头运行自动注入，直到登录态过期（约数周至数月）后重新 --onboard 即可。
 *
 * 账号扩展点：也支持手工把浏览器 DevTools 的 Cookie 头文本（k=v; k2=v2 格式）
 *             写入 seeds/tencent_docs_cookie.txt，脚本启动时自动解析注入。
 */
import { chromium } from 'playwright'
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
// 以脚本自身位置为锚点定位项目根目录，不依赖运行时的 CWD
const rootDir = path.resolve(__dirname, '../../..')

function loadConfig() {
  const cfg = JSON.parse(fs.readFileSync(path.join(__dirname, 'crawler.config.json'), 'utf-8'))
  // 相对路径统一锚定到项目根目录
  cfg.harPath = path.resolve(rootDir, cfg.harPath)
  cfg.cookieFile = path.resolve(rootDir, cfg.cookieFile)
  cfg.screenshotOnFail = path.resolve(rootDir, cfg.screenshotOnFail)
  return cfg
}

// 双通道日志：控制台 + logs/auto_sync.log（无人值守运行可追溯）
const logDir = path.join(rootDir, 'logs')
fs.mkdirSync(logDir, { recursive: true })
const logFile = path.join(logDir, 'auto_sync.log')
function log(msg) {
  const line = `[${new Date().toISOString()}] ${msg}`
  console.log(line)
  try { fs.appendFileSync(logFile, line + '\n', 'utf-8') } catch {}
}

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms))
}

// dop-api 数据响应判定（与 parse_and_merge_all_har_tabs.py 的 'dop-api' in url 识别规则一致）
function isApiDataResponse(res) {
  return res.url().includes('dop-api') && res.status() === 200
}

// ---------------- 子表激活：关键词点击（V9 脚本已验证算法） ----------------
/**
 * 在左侧栏（300px 以内）查找包含任一关键词的可见叶子节点并点击。
 * 算法与 extract_all_smartsheet_tabs.js V9 保持一致：取文本最短的候选节点，避免命中父容器。
 */
async function clickSidebarTab(page, keywords) {
  return await page.evaluate((kws) => {
    const candidates = Array.from(document.querySelectorAll('*')).filter((el) => {
      const r = el.getBoundingClientRect()
      if (r.left > 300 || r.width <= 0 || r.height <= 0) return false
      const t = (el.innerText || '').trim()
      if (!t || t.length > 40) return false
      return kws.some((kw) => t.includes(kw))
    })
    if (candidates.length === 0) return { ok: false, reason: '未找到匹配关键词的左侧栏节点' }
    candidates.sort((a, b) => a.innerText.trim().length - b.innerText.trim().length)
    const target = candidates[0]
    target.click()
    target.dispatchEvent(new MouseEvent('click', { bubbles: true }))
    return { ok: true, title: target.innerText.trim() }
  }, keywords)
}

/**
 * 虚拟滚动到底部：定位表格区域内可滚动容器（left>240 且高度溢出），每轮下移 650px，
 * 同时监测 dop-api 响应静默窗口——静默超过 quietWindowMs 且到达滚动底部时判定该子表数据加载完成。
 * 与 parse_and_merge_all_har_tabs.py 第 3 步的「未滚到底部」自检逻辑对齐。
 */
async function scrollTableToBottom(page, tabId, cfg) {
  const { scrollIntervalMs, quietWindowMs, maxScrollPasses } = cfg.timeouts

  // 响应静默监测：记录最近一次 dop-api 响应时间，静默满窗口视为该子表数据已全部落地
  let lastResponseAt = Date.now()
  let observedResponse = false // 标记：滚动开始后是否观察到新的 dop-api 数据响应
  const responseListener = (res) => {
    if (isApiDataResponse(res)) {
      lastResponseAt = Date.now()
      observedResponse = true
    }
  }
  page.on('response', responseListener)

  let atBottom = false
  for (let pass = 0; pass < maxScrollPasses; pass++) {
    const state = await page.evaluate(() => {
      const container = Array.from(document.querySelectorAll('*')).find((el) => {
        const r = el.getBoundingClientRect()
        return r.left > 240 && el.scrollHeight > el.clientHeight + 40
      })
      if (container) {
        container.scrollTop += 650
        return { atBottom: container.scrollTop + container.clientHeight >= container.scrollHeight - 50 }
      }
      window.scrollBy(0, 650)
      return { atBottom: window.innerHeight + window.scrollY >= document.documentElement.scrollHeight - 50 }
    })

    await sleep(scrollIntervalMs)

    const quietMs = Date.now() - lastResponseAt
    if (state.atBottom) atBottom = true
    // 到底且 dop-api 响应静默满窗口且滚动期间确有数据响应：判定数据加载完成
    if (atBottom && observedResponse && quietMs >= quietWindowMs) {
      log(`    [scroll] ${tabId} 到达底部且 dop-api 静默 ${Math.round(quietMs / 1000)}s，数据加载完成（第 ${pass + 1} 轮）`)
      break
    }
    if (pass === maxScrollPasses - 1 && !atBottom) {
      log(`    [scroll] ${tabId} 达到最大滚动轮数 ${maxScrollPasses} 仍未到底，下游 HAR 自检将提示缺漏`)
    }
  }
  page.off('response', responseListener)
}

// ---------------- 单个子表抓取 ----------------
async function captureTab(page, tab, cfg, attempt) {
  const { responseMs, pageMs } = cfg.timeouts

  // 先注册 dop-api 响应等待器再执行点击，防止响应早于监听注册而漏判（时序竞争防护）
  const apiWaiter = page
    .waitForResponse(isApiDataResponse, { timeout: responseMs })
    .then(() => true, () => false)

  const clickResult = await clickSidebarTab(page, tab.keywords)
  let activated = false
  if (clickResult.ok) {
    log(`    [click] 已点击子表【${tab.title}】（命中节点: ${clickResult.title}）`)
    activated = await apiWaiter
  } else {
    log(`    [click] ${clickResult.reason}，降级为 URL 直连 ${tab.id}`)
  }

  // 点击未生效（无 dop-api 响应）时降级为整页 URL 导航（tab 参数为官方寻址方式）
  if (!activated) {
    const url = `${cfg.docUrl}?tab=${tab.id}`
    log(`    [goto] 降级整页导航: ${url}`)
    try {
      await Promise.all([
        page.waitForResponse(isApiDataResponse, { timeout: responseMs }),
        page.goto(url, { waitUntil: 'domcontentloaded', timeout: pageMs }),
      ])
    } catch (err) {
      log(`    [goto] 导航或 dop-api 响应失败: ${err.message}`)
    }
  }

  // 虚拟滚动到底部，触发分页懒加载，确保 ZLIB 数据响应完整落地
  await sleep(1500) // 滚动前缓冲，等待表格渲染完成
  await scrollTableToBottom(page, tab.id, cfg)

  // 网络静默宽限，保证尾部响应全部写入 HAR
  await page.waitForLoadState('networkidle', { timeout: 15000 }).catch(() => {})
  if (attempt > 0) log(`    [retry] ${tab.id} 第 ${attempt} 次重试完成`)
}

// ---------------- 主流程 ----------------
async function run() {
  // 测试钩子：模拟无头浏览器启动失败，供 auto_sync_har.bat 降级演练（T3）使用
  if (process.env.FORCE_CRAWLER_FAIL === '1') {
    throw new Error('FORCE_CRAWLER_FAIL=1 模拟启动失败（降级演练钩子）')
  }

  // 登录引导模式：弹出可见浏览器窗口，人工完成登录后自动保存 Cookie 至扩展文件
  const onboard = process.argv.includes('--onboard')

  const cfg = loadConfig()
  log(`[Crawler] 目标文档: ${cfg.docUrl}（模式: ${onboard ? '登录引导(有界面)' : '无头自动抓取'}）`)
  log(`[Crawler] 子表数量: ${cfg.subTabs.length}（${cfg.subTabs.map((t) => t.title).join(' / ')}）`)

  // 反自动化规避 1：Chromium 启动参数抹除自动化标记（引导模式显示界面便于人工登录）
  const browser = await chromium.launch({
    headless: !onboard,
    args: ['--disable-blink-features=AutomationControlled'],
  })

  // 反自动化规避 2：真实桌面指纹（UA / 视口 / 语言 / 时区）+ 完整 HAR 录制
  const contextOptions = {
    userAgent: cfg.fingerprint.userAgent,
    viewport: cfg.fingerprint.viewport,
    locale: cfg.fingerprint.locale,
    timezoneId: cfg.fingerprint.timezoneId,
    recordHar: { path: cfg.harPath, mode: 'full' },
  }

  // 账号扩展点：cookie 文件存在即注入登录态（支持两种格式）：
  //   1) JSON 数组（--onboard 引导保存，含 HttpOnly 与完整域属性）；
  //   2) 纯文本 Cookie 头（k=v; k2=v2，手工从 DevTools 复制），按 docs.qq.com 域绑定
  if (fs.existsSync(cfg.cookieFile)) {
    const rawCookie = fs.readFileSync(cfg.cookieFile, 'utf-8').trim()
    if (rawCookie) {
      let cookieList = null
      try {
        const parsed = JSON.parse(rawCookie)
        if (Array.isArray(parsed)) cookieList = parsed
      } catch {}
      if (!cookieList) {
        cookieList = rawCookie.split(';')
          .map((s) => s.trim())
          .filter(Boolean)
          .map((pair) => {
            const eq = pair.indexOf('=')
            return {
              name: (eq > 0 ? pair.slice(0, eq) : pair).trim(),
              value: eq > 0 ? pair.slice(eq + 1).trim() : '',
              url: 'https://docs.qq.com',
            }
          })
      }
      if (cookieList.length > 0) {
        await context.addCookies(cookieList)
        log(`[Crawler] 检测到 Cookie 扩展文件，已注入 ${cookieList.length} 条登录态 Cookie`)
      }
    }
  }

  const context = await browser.newContext(contextOptions)
  const page = await context.newPage()

  // 反自动化规避 3：抹除 navigator.webdriver 自动化特征
  await page.addInitScript(() => {
    Object.defineProperty(navigator, 'webdriver', { get: () => undefined })
  })

  // 首次打开文档主页：响应等待与导航并行发起，首个 dop-api 数据响应落地即视为加载成功
  log('[Crawler] 打开文档主页...')
  try {
    await Promise.all([
      page.waitForResponse(isApiDataResponse, { timeout: onboard ? 300000 : cfg.timeouts.pageMs }),
      page.goto(cfg.docUrl, { waitUntil: 'domcontentloaded', timeout: cfg.timeouts.pageMs }),
    ])
  } catch {
    log('[Crawler] 警告：主页未见 dop-api 数据响应，文档可能不可匿名访问或接口改版')
  }

  if (onboard) {
    // 登录引导成功：把当前上下文全部 Cookie（含 HttpOnly）落盘，供后续无头运行注入
    const cookies = await context.cookies('https://docs.qq.com')
    fs.mkdirSync(path.dirname(cfg.cookieFile), { recursive: true })
    fs.writeFileSync(cfg.cookieFile, JSON.stringify(cookies, null, 2), 'utf-8')
    log(`[Onboard] 登录态校验通过，已保存 ${cookies.length} 条 Cookie 至 ${cfg.cookieFile}`)
  } else {
    // 匿名可用性预检：文档对匿名浏览器不可见（"文档不存在"即无登录态的表现）时快速失败，
    // 避免在空白页上白耗 9 个子表的抓取时间
    const bodyPreview = await page.evaluate(() => document.body.innerText.slice(0, 500))
    if (bodyPreview.includes('文档不存在') || bodyPreview.includes('请登录')) {
      throw new Error(
        '文档对匿名浏览器不可用（需登录态）。请先运行一次登录引导保存 Cookie：' +
        'node frontend/scripts/crawler_smartsheet/headless_har_crawler.mjs --onboard，' +
        '或退回人工 HAR 通道'
      )
    }
  }
  await page.waitForLoadState('networkidle', { timeout: 20000 }).catch(() => {})

  // 依次遍历 9 大子表（失败按配置重试）
  const failedTabs = []
  for (const tab of cfg.subTabs) {
    log(`[Tab ${tab.id}] 开始抓取子表【${tab.title}】...`)
    let success = false
    for (let attempt = 0; attempt <= cfg.retries.max && !success; attempt++) {
      if (attempt > 0) await sleep(cfg.retries.delayMs)
      try {
        await captureTab(page, tab, cfg, attempt)
        success = true
      } catch (err) {
        log(`[Tab ${tab.id}] 第 ${attempt + 1} 次抓取异常: ${err.message}`)
      }
    }
    if (!success) failedTabs.push(tab)
  }

  // 失败现场截图：保存当前文档页面状态，供人工排查（须在 HAR 刷盘前执行）
  if (failedTabs.length > 0) {
    try {
      await page.screenshot({ path: cfg.screenshotOnFail, fullPage: false })
      log(`[Crawler] 失败现场已保存: ${cfg.screenshotOnFail}`)
    } catch {}
  }

  // 关闭上下文时 Playwright 才真正刷盘写出 HAR 文件
  await context.close().catch(() => {})
  await browser.close().catch(() => {})

  // ---------- 产物完整性自检 ----------
  if (!fs.existsSync(cfg.harPath) || fs.statSync(cfg.harPath).size === 0) {
    throw new Error('HAR 文件未生成或为空')
  }
  const harSize = fs.statSync(cfg.harPath).size
  log(`[Crawler] HAR 已写入: ${cfg.harPath}（${(harSize / 1024 / 1024).toFixed(2)} MB）`)

  if (harSize < cfg.minHarBytes) {
    throw new Error(`HAR 体积 ${(harSize / 1024 / 1024).toFixed(2)}MB 低于阈值 ${(cfg.minHarBytes / 1024 / 1024)}MB，数据可能不完整`)
  }

  // 校验每个子表是否都有 dop-api 数据响应落地（与解析器一致，同时识别 tab= 与 subId= 参数）
  const har = JSON.parse(fs.readFileSync(cfg.harPath, 'utf-8'))
  const entries = har.log?.entries || []
  const tabsWithData = new Set()
  for (const entry of entries) {
    const reqUrl = entry.request?.url || ''
    if (!reqUrl.includes('dop-api')) continue
    const m = reqUrl.match(/[?&](?:tab|subId)=([^&]+)/)
    if (m && m[1]) tabsWithData.add(m[1])
  }
  const missing = cfg.subTabs.filter((t) => !tabsWithData.has(t.id)).map((t) => `${t.title}(${t.id})`)
  if (failedTabs.length > 0) {
    throw new Error(`以下子表抓取失败: ${failedTabs.map((t) => t.title).join('、')}，请查看失败截图与日志`)
  }
  if (missing.length > 0) {
    // 有子表数据响应缺失：判定本次抓取不完整，退出码 1 触发无人值守流水线的降级通道
    log(`[Crawler] HAR 中未检测到以下子表的 dop-api 响应: ${missing.join('、')}（判定抓取不完整）`)
    throw new Error(`子表数据响应缺失: ${missing.join('、')}，HAR 不完整，请检查页面状态或降级人工 HAR`)
  }
  log(`[Crawler] 全部 ${cfg.subTabs.length} 个子表的 dop-api 响应均已落入 HAR，完整性校验通过`)

  log('[Crawler] 抓取任务成功完成')
}

run().catch((err) => {
  log(`[Crawler FAILED] ${err.message}`)
  process.exit(1)
})
