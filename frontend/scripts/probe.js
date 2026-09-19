(function probeSmartsheet() {
  console.log("%c[Probe] 开始深度探测 Tencent Smartsheet 数据载体...", "color: #1677ff; font-weight: bold;");

  // 1. 检查所有 DOM Script 标签
  const scripts = Array.from(document.querySelectorAll("script"));
  console.log("[Probe] DOM 中共有 " + scripts.length + " 个 script 标签");
  let foundScript = null;
  for (let i = 0; i < scripts.length; i++) {
    const txt = scripts[i].text || scripts[i].textContent || "";
    if (txt.includes("BB08J2") || txt.includes("DRmRGYk14dW53VHdS") || (txt.includes("sheets") && txt.includes("records"))) {
      console.log("%c[Probe] 命中包含表格核心数据的 Script 标签 #" + i + "，长度: " + txt.length, "color: #52c41a; font-weight: bold;");
      foundScript = txt;
      // 检查变量名
      const varMatches = txt.match(/(?:window.)?([a-zA-Z0-9_$]+)s*=s*[{[]/g);
      if (varMatches) console.log("  匹配到的变量赋值:", varMatches.slice(0, 10));
      break;
    }
  }

  // 2. 检查全局 window 上的挂载点
  const candidates = [];
  for (const k of Object.keys(window)) {
    try {
      const v = window[k];
      if (v && typeof v === "object") {
        if (v.sheets || v.sheetList || v.recordMap || v.records || v.tableData) {
          candidates.push(k);
        }
      }
    } catch(e) {}
  }
  console.log("[Probe] 命中包含 sheets/records 的全局 window 变量:", candidates);

  // 3. 检查 Network 资源加载记录 (真实 API 接口)
  const resources = window.performance.getEntriesByType("resource");
  const apiUrls = resources.map(r => r.name).filter(u => u.includes("smartsheet") || u.includes("dop-api") || u.includes("sheet") || u.includes("get_"));
  console.log("[Probe] 页面已请求过的相关 API 列表 (" + apiUrls.length + "):", apiUrls.slice(0, 10));

  return { foundScript: !!foundScript, candidates, apiUrlsCount: apiUrls.length };
})();