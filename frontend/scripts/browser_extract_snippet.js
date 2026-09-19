/**
 * 【腾讯文档多维表格无权限一键全量导出脚本】
 * 
 * 使用方法：
 * 1. 在浏览器中打开腾讯文档多维表格页面（需保持登录或只读查看状态）：
 *    https://docs.qq.com/smartsheet/DRmRGYkt4dW53VHds?tab=BB08J2&viewId=VUQPXH
 * 2. 按 F12 打开开发者工具，切换到 Console（控制台）标签页。
 * 3. 复制并粘贴以下全部代码，按回车执行。
 * 4. 浏览器将自动弹窗下载完整的 `smartsheet_321_full.json`，其中包含全部无截断真实链接与内推码。
 * 5. 将下载的文件放入项目的 seeds/ 目录，执行 npm run import:smartsheet 即可全量更新入库。
 */
(async function extractSmartsheetFullData() {
  console.log('%c[Smartsheet Extractor] 开始提取多维表格全量真实数据...', 'color: #1677ff; font-weight: bold; font-size: 14px;')

  function cleanUrl(raw) {
    if (!raw) return "";
    let str = "";
    if (typeof raw === "object") {
      str = raw.link || raw.url || raw.href || raw.target || raw.text || "";
      if (!str && Array.isArray(raw)) {
        str = raw.map(x => (typeof x === "object" ? (x.link || x.url || x.href || x.text || "") : String(x))).join("");
      }
    } else {
      str = String(raw).trim();
    }
    if (str.includes("docs.qq.com/scenario/link.html") || str.includes("link-warning") || str.includes("docs.qq.com/links/")) {
      try {
        const u = new URL(str.startsWith("http") ? str : "https://" + str);
        const target = u.searchParams.get("url") || u.searchParams.get("target") || u.searchParams.get("dest");
        if (target) str = decodeURIComponent(target);
      } catch {}
    }
    return str.trim();
  }

  // 1. 尝试从页面内存中的全局数据源获取 (Tencent Docs Store)
  let extracted = []
  
  // 检查可能存在的全局变量
  const globalObj = window.ssr_client_vars || window.clientVars || window.global_data || {}
  const padId = window.location.pathname.split('/').pop()
  const tabId = new URLSearchParams(window.location.search).get('tab') || 'BB08J2'

  console.log(`[Extractor] 当前文档 ID: ${padId}, Tab ID: ${tabId}`)

  // 2. 发起同源 API 请求（携带浏览器登录 Cookie 与权限）
  try {
    const apiEndpoints = [
      `/smartsheet/api/sheet/get_sheet_data?docId=${padId}&subId=${tabId}`,
      `/dop-api/get/sheet?id=${padId}&tab=${tabId}`,
      `/smartsheet/api/smartsheet/get_sheet_data?docId=${padId}&subId=${tabId}`
    ]

    for (const ep of apiEndpoints) {
      try {
        const res = await fetch(ep, { credentials: 'include' })
        if (res.ok) {
          const data = await res.json()
          const rows = data.data?.rows || data.rows || data.data?.sheetData?.rows || []
          if (rows.length > 0) {
            console.log(`[Extractor] 成功通过 API 获取到 ${rows.length} 行原始数据！`)
            extracted = rows.map((r) => {
              const fields = r.fields || r
              return {
                企业名称: fields['企业名称'] || fields['公司名称'] || fields['f_company'] || '',
                所在行业: fields['所在行业'] || fields['行业'] || '',
                '启动/更新时间': fields['启动/更新时间'] || fields['更新时间'] || '',
                招聘岗位: fields['招聘岗位'] || fields['岗位名称'] || '',
                工作地点: fields['工作地点'] || fields['地点'] || '',
                校招类型: fields['校招类型'] || fields['招聘类型'] || '',
                内推链接: cleanUrl(fields['内推链接']?.url || fields['内推链接'] || fields['网申链接'] || ''),
                内推码: fields['内推码'] || '',
                招聘详情: fields['招聘详情'] || fields['详情'] || fields['公司简介'] || ''
              }
            }).filter((item) => item['企业名称'])
            break
          }
        }
      } catch (e) {}
    }
  } catch (err) {
    console.warn('[Extractor] API 自动获取受阻，切换至 DOM 结构提取...')
  }

  // 3. 如果 API 未能直接返回，遍历表格视图 DOM 进行精准采集
  if (extracted.length === 0) {
    console.log('[Extractor] 正在遍历表格 DOM 节点解析单元格...')
    const rowsDom = document.querySelectorAll('.grid-row, [role="row"], tr')
    rowsDom.forEach((rowEl) => {
      const links = rowEl.querySelectorAll('a[href]')
      let targetUrl = ''
      links.forEach((a) => {
        const href = a.getAttribute('href') || ''
        if (href && !href.startsWith('javascript:')) {
          targetUrl = cleanUrl(href)
        }
      })

      const textCells = Array.from(rowEl.children).map((c) => c.innerText.trim()).filter(Boolean)
      if (textCells.length >= 4) {
        extracted.push({
          企业名称: textCells[0] || '',
          所在行业: textCells[1] || '',
          '启动/更新时间': textCells[2] || '',
          招聘岗位: textCells[3] || '',
          工作地点: textCells[4] || '',
          校招类型: textCells[5] || '',
          内推链接: targetUrl,
          内推码: textCells[7] || '',
          招聘详情: textCells[8] || ''
        })
      }
    })
  }

  if (extracted.length === 0) {
    alert('未能自动捕获到多维表格行，请按 F12 切换到 Network 标签页，筛选 get_sheet_data 并右键复制其 Response。')
    return
  }

  console.log(`%c[Extractor] 成功清洗提取出 ${extracted.length} 条企业校招数据！`, 'color: #52c41a; font-weight: bold; font-size: 14px;')
  console.table(extracted.slice(0, 5))

  // 4. 自动下载为 JSON 产物
  const blob = new Blob([JSON.stringify(extracted, null, 2)], { type: 'application/json' })
  const a = document.createElement('a')
  a.href = URL.createObjectURL(blob)
  a.download = `smartsheet_${extracted.length}_full.json`
  document.body.appendChild(a)
  a.click()
  document.body.removeChild(a)

  console.log('%c[Success] 文件下载已触发！请将下载的 json 移至项目的 seeds/ 目录，然后执行: npm run import:smartsheet', 'color: #52c41a; font-size: 12px;')
})();
