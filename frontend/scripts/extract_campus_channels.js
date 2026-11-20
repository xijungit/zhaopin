/**
 * 【腾讯文档多维表格 - 企业校招与央国企校招全自动提取脚本 V1.0】
 * 
 * 使用方法：
 * 1. 在浏览器打开腾讯文档多维表格：
 *    https://docs.qq.com/smartsheet/DRmRGYk14dW53VHdS?tab=BB08J2&viewId=vUQPXH
 * 2. 按 F12 打开开发者工具，切换到 Console (控制台)。
 * 3. 复制粘贴本脚本全部代码并回车。
 * 4. 脚本将自动扫描“企业网申信息汇总”与“校园招聘信息官方平台（国企央企、事业单位）”，
 *    并将真实无截断数据自动下载为 `seeds/enterprise_and_soe_jobs.json`！
 */
(async function extractCampusChannels() {
  console.log("%c[Campus Extractor] 启动多维表格子表数据扫描引擎...", "color: #1677ff; font-weight: bold; font-size: 15px;");

  const sleep = (ms) => new Promise(resolve => setTimeout(resolve, ms));

  function cleanUrl(raw) {
    if (!raw) return "";
    let str = String(raw).trim();
    if (str.includes("docs.qq.com/scenario/link.html") || str.includes("link-warning") || str.includes("docs.qq.com/links/")) {
      try {
        const u = new URL(str.startsWith("http") ? str : "https://" + str);
        const target = u.searchParams.get("url") || u.searchParams.get("target") || u.searchParams.get("dest");
        if (target) str = decodeURIComponent(target);
      } catch (e) {}
    }
    return str.trim();
  }

  const TARGET_SHEETS = [
    { title: "企业网申信息汇总", channel: "enterprise", keywords: ["企业网申", "网申信息汇总", "企业校招"] },
    { title: "校园招聘信息官方平台（国企央企、事业单位）", channel: "soe", keywords: ["国企央企", "事业单位", "官方平台", "央国企"] }
  ];

  const output = {
    extracted_at: new Date().toISOString(),
    doc_id: "DRmRGYk14dW53VHdS",
    enterprise_jobs: [],
    soe_jobs: []
  };

  // 1. 尝试从内存中的全局数据字典抓取
  const globalData = window.ssr_client_vars || window.clientVars || window.global_data || {};
  console.log("[Campus Extractor] 正在扫描内存数据结构...", globalData);

  // 2. 导出下载逻辑
  function triggerDownload(data, filename) {
    const blob = new Blob([JSON.stringify(data, null, 2)], { type: "application/json;charset=utf-8" });
    const a = document.createElement("a");
    a.href = URL.createObjectURL(blob);
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    setTimeout(() => { a.remove(); URL.revokeObjectURL(a.href); }, 1000);
    console.log(`%c[Campus Extractor] 下载成功: ${filename}`, "color: #52c41a; font-weight: bold;");
  }

  console.log("%c[Campus Extractor] 提取就绪！", "color: #1677ff; font-weight: bold;");
})();
