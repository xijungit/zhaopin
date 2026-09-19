/**
 * 【腾讯文档多维表格终极纯数据提取器 V11.0】
 * 适用场景：文档管理员禁止复制、禁止另存为/导出。
 * 原理：绕过 Canvas 权限限制，直接从内存中提取纯文本字段，杜绝循环引用报错。
 */
(async function extractSmartsheetV11() {
  console.log("%c[V11.0] 开始提取真实多维表格数据...", "color: #1677ff; font-weight: bold; font-size: 15px;");

  function cleanVal(v) {
    if (v === null || v === undefined) return "";
    if (typeof v === "string" || typeof v === "number" || typeof v === "boolean") return String(v).trim();
    if (Array.isArray(v)) return v.map(cleanVal).filter(Boolean).join(" ");
    if (typeof v === "object") {
      if (v.text !== undefined) return cleanVal(v.text);
      if (v.link !== undefined) return String(v.link).trim();
      if (v.url !== undefined) return String(v.url).trim();
      if (v.name !== undefined) return String(v.name).trim();
      if (v.value !== undefined) return cleanVal(v.value);
      if (v.title !== undefined) return String(v.title).trim();
      const parts = [];
      for (const k of Object.keys(v)) {
        if (typeof v[k] === "string" && v[k].length < 1000) parts.push(v[k]);
      }
      return parts.join(" ").trim();
    }
    return "";
  }

  // 1. 从 IndexedDB 提取
  async function scanIndexedDB() {
    try {
      const dbs = await indexedDB.databases();
      const records = [];
      for (const dbInfo of dbs) {
        if (!dbInfo.name) continue;
        const db = await new Promise((res, rej) => {
          const r = indexedDB.open(dbInfo.name);
          r.onsuccess = () => res(r.result);
          r.onerror = rej;
        });
        for (const storeName of Array.from(db.objectStoreNames)) {
          const items = await new Promise(res => {
            try {
              const tx = db.transaction(storeName, "readonly");
              const store = tx.objectStore(storeName);
              const r = store.getAll();
              r.onsuccess = () => res(r.result || []);
              r.onerror = () => res([]);
            } catch { res([]); }
          });
          for (const item of items) {
            const str = JSON.stringify(item);
            if (str.includes("nowcoder") || str.includes("用友") || str.includes("携程") || str.includes("面试") || str.includes("试卷")) {
              records.push({ source: "IDB:" + dbInfo.name + "/" + storeName, raw: item });
            }
          }
        }
        db.close();
      }
      return records;
    } catch (e) {
      console.warn("[IDB Scan]", e);
      return [];
    }
  }

  // 2. 从 React Fiber（Canvas 挂载点）秒级向上穿透
  function scanReactFiber() {
    const canvas = document.querySelector("canvas");
    if (!canvas) return [];
    const fiberKey = Object.keys(canvas).find(k => k.startsWith("__reactFiber") || k.startsWith("__reactInternalInstance"));
    if (!fiberKey) return [];
    let curr = canvas[fiberKey];
    const candidateSets = [];
    while (curr) {
      const p = curr.memoizedProps;
      if (p && typeof p === "object") {
        for (const k of Object.keys(p)) {
          const val = p[k];
          if (Array.isArray(val) && val.length > 5) {
            const s = JSON.stringify(val.slice(0, 3));
            if (s.includes("nowcoder") || s.includes("用友") || s.includes("携程") || s.includes("试卷") || s.includes("经验")) {
              candidateSets.push({ source: "Fiber.props." + k, rows: val });
            }
          } else if (val && typeof val === "object" && (val.records || val.rows || val.recordMap)) {
            candidateSets.push({ source: "Fiber.props." + k + ".records", rows: val.records || val.rows || Object.values(val.recordMap || {}) });
          }
        }
      }
      curr = curr.return;
    }
    return candidateSets;
  }

  // 3. 扫描全局 non-standard window 对象
  function scanWindowObjects() {
    const candidateSets = [];
    const iframe = document.createElement("iframe");
    iframe.style.display = "none";
    document.body.appendChild(iframe);
    const stdKeys = new Set(Object.getOwnPropertyNames(iframe.contentWindow));
    document.body.removeChild(iframe);

    const appKeys = Object.getOwnPropertyNames(window).filter(k => !stdKeys.has(k) && !k.startsWith("_"));
    for (const k of appKeys) {
      try {
        const val = window[k];
        if (val && typeof val === "object") {
          for (const subKey of Object.keys(val)) {
            const subVal = val[subKey];
            if (Array.isArray(subVal) && subVal.length > 5) {
              const s = JSON.stringify(subVal.slice(0, 3));
              if (s.includes("nowcoder") || s.includes("用友") || s.includes("携程") || s.includes("经验")) {
                candidateSets.push({ source: "window." + k + "." + subKey, rows: subVal });
              }
            }
          }
        }
      } catch {}
    }
    return candidateSets;
  }

  console.log("[1/3] 正在扫描 React Fiber 数据流...");
  const fiberMatches = scanReactFiber();
  console.log("React Fiber 发现候选数据集: " + fiberMatches.length + " 处");

  console.log("[2/3] 正在扫描 IndexedDB 本地缓存...");
  const idbMatches = await scanIndexedDB();
  console.log("IndexedDB 发现候选条目: " + idbMatches.length + " 条");

  console.log("[3/3] 正在扫描全局应用模型...");
  const winMatches = scanWindowObjects();
  console.log("全局模型发现候选数据集: " + winMatches.length + " 处");

  // 汇总所有提取到的行
  const allExtractedRows = [];
  [...fiberMatches, ...winMatches].forEach(m => {
    if (Array.isArray(m.rows)) {
      m.rows.forEach(r => {
        if (r && typeof r === "object") {
          const cleanRow = {};
          for (const col of Object.keys(r)) {
            const txt = cleanVal(r[col]);
            if (txt) cleanRow[col] = txt;
          }
          if (Object.keys(cleanRow).length > 0) {
            allExtractedRows.push(cleanRow);
          }
        }
      });
    }
  });

  idbMatches.forEach(item => {
    const r = item.raw;
    if (r && typeof r === "object") {
      const cleanRow = {};
      for (const col of Object.keys(r)) {
        const txt = cleanVal(r[col]);
        if (txt) cleanRow[col] = txt;
      }
      if (Object.keys(cleanRow).length > 0) {
        allExtractedRows.push(cleanRow);
      }
    }
  });

  if (allExtractedRows.length === 0) {
    console.warn("%c[提示] 内存中未能直接捕获完整行。最稳妥、零代码的方式是：在当前 Network(网络) 面板右键 -> 导出 HAR 包！", "color: #faad14; font-size: 14px; font-weight: bold;");
    alert("未能直接从当前内存定位到行对象。请采用最轻松的【导出 HAR】方案：\n1. 按 F12 打开网络面板；\n2. 刷新页面并点击各个 Tab；\n3. 点击网络面板顶部的导出 HAR 按钮即可！");
    return;
  }

  // 去重
  const seen = new Set();
  const uniqueRows = [];
  allExtractedRows.forEach(r => {
    const key = JSON.stringify(r);
    if (!seen.has(key)) {
      seen.add(key);
      uniqueRows.push(r);
    }
  });

  console.log("%c[成功] 成功提取到 " + uniqueRows.length + " 条真实数据记录！", "color: #52c41a; font-weight: bold; font-size: 16px;");
  console.table(uniqueRows.slice(0, 5));

  const exportPayload = {
    exported_at: new Date().toISOString(),
    doc_id: "DRmRGYk14dW53VHdS",
    total_records: uniqueRows.length,
    records: uniqueRows
  };

  const blob = new Blob([JSON.stringify(exportPayload, null, 2)], { type: "application/json" });
  const a = document.createElement("a");
  a.href = URL.createObjectURL(blob);
  a.download = "clean_smartsheet_data.json";
  document.body.appendChild(a);
  a.click();
  document.body.removeChild(a);

  alert("🎉 恭喜！成功提取到 " + uniqueRows.length + " 条真实多维表格数据！已自动触发下载 clean_smartsheet_data.json！");
})();
