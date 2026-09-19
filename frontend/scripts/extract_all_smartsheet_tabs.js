/**
 * 【腾讯文档多维表格全自动挂机提取脚本 V9.0 - Auto-Pilot 托管版】
 * 
 * 特色：
 * 1. 彻底解决“文档管理员限制了查看者操作权限，无法复制内容”的问题。
 * 2. 精准适配左侧栏 Tab 布局，全自动依次切换 4 个目标 Tab。
 * 3. 全自动虚拟列表平滑滚动扫描，自动去重聚合。
 * 4. 用户只需在控制台粘贴并回车，双手离开键盘，15秒后自动下载 experiences_and_resources.json！
 */
(async function runSmartsheetAutoPilotV9() {
  console.log("%c[Auto-Pilot V9.0] 启动全自动抓取引擎...", "color: #1677ff; font-weight: bold; font-size: 16px;");

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

  // 1. 目标 Tab 列表（基于左侧栏关键词）
  const TARGET_TABS = [
    { title: "⛽大厂面试经验总结【上岸版】", keywords: ["大厂面试经验总结", "面试经验总结", "上岸版"], type: "exp" },
    { title: "校招资料库（题库）", keywords: ["校招资料库", "题库"], type: "res" },
    { title: "⛽面试真题答题思路", keywords: ["面试真题答题思路", "答题思路"], type: "res" },
    { title: "互联网大厂真题合集", keywords: ["互联网大厂真题合集", "真题合集", "直题合集"], type: "res" }
  ];

  const store = {
    doc_id: "DRmRGYk14dW53VHdS",
    exported_at: new Date().toISOString(),
    sheets: {},
    experiences: [],
    resources: []
  };

  // 2. 创建或更新浮动提示框
  const old = document.getElementById("autopilot-panel");
  if (old) old.remove();

  const panel = document.createElement("div");
  panel.id = "autopilot-panel";
  panel.style.cssText = "position:fixed;top:20px;right:20px;width:380px;background:#1677ff;color:#fff;border-radius:10px;box-shadow:0 8px 30px rgba(0,0,0,0.3);z-index:99999999;padding:16px;font-family:sans-serif;font-size:13px;line-height:1.5;";
  panel.innerHTML = `
    <div style="font-weight:bold;font-size:15px;margin-bottom:8px;">🚀 多维表格全自动采集中 (V9.0)...</div>
    <div id="autopilot-status" style="background:rgba(255,255,255,0.15);padding:8px;border-radius:6px;margin-bottom:8px;">
      正在初始化抓取环境，请稍候...
    </div>
    <div style="font-size:11px;opacity:0.85;">提示：全自动执行中，请勿手动切换页面或点击表格。</div>
  `;
  document.body.appendChild(panel);

  const setStatus = (txt) => {
    console.log(`[Auto-Pilot] ${txt}`);
    const el = document.getElementById("autopilot-status");
    if (el) el.innerText = txt;
  };

  // 3. 在左侧栏定位 Tab 并点击
  function clickSidebarTab(keywords) {
    const candidates = Array.from(document.querySelectorAll('*')).filter(el => {
      const r = el.getBoundingClientRect();
      if (r.left > 300 || r.width <= 0 || r.height <= 0) return false;
      const t = (el.innerText || '').trim();
      return keywords.some(kw => t.includes(kw));
    });

    if (candidates.length === 0) return false;
    // 选文本长度最短的叶子/具体节点
    candidates.sort((a, b) => a.innerText.trim().length - b.innerText.trim().length);
    const targetEl = candidates[0];
    targetEl.click();
    targetEl.dispatchEvent(new MouseEvent('click', { bubbles: true }));
    return true;
  }

  // 4. 获取当前视口中可见的表格行数据（视觉分行）
  function captureCurrentViewportRows() {
    const tableElements = Array.from(document.querySelectorAll('*')).filter(el => {
      if (el.id === 'autopilot-panel' || el.closest('#autopilot-panel')) return false;
      const r = el.getBoundingClientRect();
      // 必须在右侧表格区域
      if (r.left < 240 || r.top < 70 || r.bottom > window.innerHeight - 20) return false;
      if (r.width <= 0 || r.height <= 0) return false;

      const txt = (el.innerText || el.textContent || '').trim();
      if (!txt) return false;

      // 避免包含大量子文字的容器节点
      if (el.children.length > 0) {
        const childLen = Array.from(el.children).reduce((acc, c) => acc + (c.innerText || '').trim().length, 0);
        if (childLen >= txt.length * 0.8) return false;
      }
      return true;
    });

    const rowGroups = [];
    tableElements.forEach(el => {
      const r = el.getBoundingClientRect();
      const txt = el.innerText.trim();
      if (!txt) return;

      const a = el.closest('a') || el.querySelector('a');
      let link = a ? cleanUrl(a.href) : '';
      if (!link && /https?:\/\/[^\s]+/.test(txt)) {
        const m = txt.match(/https?:\/\/[^\s]+/);
        if (m) link = cleanUrl(m[0]);
      }

      const cell = { x: r.left, text: txt, link };
      let rg = rowGroups.find(g => Math.abs(g.y - r.top) <= 8);
      if (rg) {
        if (!rg.cells.some(c => Math.abs(c.x - r.left) <= 5)) rg.cells.push(cell);
      } else {
        rowGroups.push({ y: r.top, cells: [cell] });
      }
    });

    rowGroups.sort((a, b) => a.y - b.y);
    rowGroups.forEach(rg => rg.cells.sort((a, b) => a.x - b.x));

    return rowGroups.map(rg => rg.cells).filter(cells => cells.length >= 2);
  }

  // 5. 将扫描到的行转换为结构化数据
  function processTabRows(allCapturedVisualRows, tabTitle, tabType) {
    if (allCapturedVisualRows.length === 0) return [];
    const headerRow = allCapturedVisualRows[0];
    const headers = headerRow.map((c, i) => c.text || `列_${i + 1}`);

    const dataRows = allCapturedVisualRows.slice(1);
    const result = [];

    dataRows.forEach(rowCells => {
      const rowObj = {};
      rowCells.forEach((c, idx) => {
        const h = headers[idx] || `列_${idx + 1}`;
        rowObj[h] = c.text;
        if (c.link && !rowObj["网盘链接"]) {
          rowObj["网盘链接"] = c.link;
        }
      });

      const fullText = rowCells.map(c => c.text).join(" ");
      const urlMatch = fullText.match(/https?:\/\/[^\s\u4e00-\u9fa5<>'"，,）)]+/);
      if (urlMatch && !rowObj["网盘链接"]) {
        rowObj["网盘链接"] = cleanUrl(urlMatch[0]);
      }
      const codeMatch = fullText.match(/(?:提取码|密码|访问码|code)[：:\s]*([a-zA-Z0-9]{4,8})/i);
      if (codeMatch && !rowObj["提取码"]) {
        rowObj["提取码"] = codeMatch[1].trim();
      }

      rowObj["_source_sheet"] = tabTitle;
      result.push(rowObj);
    });

    return result;
  }

  // 6. 执行单 Tab 虚拟滚动扫描
  async function scanTabWithScrolling(tabInfo) {
    setStatus(`正在打开【${tabInfo.title}】...`);
    const clicked = clickSidebarTab(tabInfo.keywords);
    await sleep(2000);

    const scrollContainer = Array.from(document.querySelectorAll('*')).find(el => {
      const r = el.getBoundingClientRect();
      return r.left > 240 && el.scrollHeight > el.clientHeight + 40;
    }) || window;

    if (scrollContainer.scrollTop !== undefined) scrollContainer.scrollTop = 0;
    await sleep(400);

    const capturedMap = new Map();
    let headerCells = null;

    // 向上滑动以确保表头捕获
    const initialRows = captureCurrentViewportRows();
    if (initialRows.length > 0) {
      headerCells = initialRows[0];
    }

    for (let pass = 0; pass < 12; pass++) {
      const currentRows = captureCurrentViewportRows();
      if (!headerCells && currentRows.length > 0) headerCells = currentRows[0];

      currentRows.forEach((row, rIdx) => {
        // 跳过第一遍的表头
        if (pass === 0 && rIdx === 0) return;
        const rowKey = row.map(c => c.text).join("###");
        if (!capturedMap.has(rowKey) && row.length >= 2) {
          capturedMap.set(rowKey, row);
        }
      });

      setStatus(`【${tabInfo.title}】已扫描 ${capturedMap.size} 行数据 (滚动 ${pass + 1}/12)...`);

      if (scrollContainer.scrollTop !== undefined) {
        const prev = scrollContainer.scrollTop;
        scrollContainer.scrollTop += 650;
        await sleep(350);
        if (scrollContainer.scrollTop === prev && pass > 2) break;
      } else {
        window.scrollBy(0, 650);
        await sleep(350);
      }
    }

    if (scrollContainer.scrollTop !== undefined) scrollContainer.scrollTop = 0;

    const allVisualRows = [];
    if (headerCells) allVisualRows.push(headerCells);
    allVisualRows.push(...Array.from(capturedMap.values()));

    const structured = processTabRows(allVisualRows, tabInfo.title, tabInfo.type);
    store.sheets[tabInfo.title] = structured;

    if (tabInfo.type === "exp") {
      store.experiences.push(...structured);
    } else {
      store.resources.push(...structured);
    }

    setStatus(`✅ 【${tabInfo.title}】采集完毕，共收录 ${structured.length} 条记录！`);
    await sleep(1000);
  }

  // 7. 循环执行所有 Tab
  for (let i = 0; i < TARGET_TABS.length; i++) {
    const tab = TARGET_TABS[i];
    setStatus(`[${i + 1}/${TARGET_TABS.length}] 正在处理: ${tab.title}`);
    await scanTabWithScrolling(tab);
  }

  // 8. 导出下载
  window.__EXTRACTED_RESULT__ = store;
  const jsonStr = JSON.stringify(store, null, 2);
  const blob = new Blob([jsonStr], { type: "application/json" });
  const a = document.createElement("a");
  a.href = URL.createObjectURL(blob);
  a.download = "experiences_and_resources.json";
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);

  try { if (typeof copy === "function") copy(jsonStr); } catch(e) {}

  panel.style.background = "#52c41a";
  panel.innerHTML = `
    <div style="font-weight:bold;font-size:15px;margin-bottom:6px;">🎉 全自动采集大功告成！</div>
    <div>- 面经记录: <b>${store.experiences.length}</b> 条</div>
    <div>- 真题资料: <b>${store.resources.length}</b> 条</div>
    <div style="margin-top:8px;font-size:12px;background:rgba(255,255,255,0.2);padding:6px;border-radius:4px;">
      文件 <b>experiences_and_resources.json</b> 已自动下载！请放回项目 seeds/ 目录，然后执行 npm run import:resources 即可。
    </div>
  `;

  console.log("%c[Success] 全部数据采集完毕并已触发下载！", "color: #52c41a; font-weight: bold; font-size: 16px;");
})();
