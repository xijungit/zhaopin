/**
 * 【腾讯文档多维表格真实行数据深度提取器 V10.2】
 * 
 * 核心升级：
 * 1. 排除 sheetName 等元数据干扰，直接锁定包含“用友集团/携程/nowcoder/试卷”等真实内容的行记录字典或数组！
 * 2. 自动向上溯源父级容器（recordMap / rows / sheetData），完整抓取全部行记录！
 * 3. 使用 WeakSet 消除循环引用，自动保存为 smartsheet_real_dump.json。
 */
(async function dumpSmartsheetRowsFromMemoryV10_2() {
  console.log("%c[Row Extractor V10.2] 正在深度检索真实行数据模型...", "color: #1677ff; font-weight: bold; font-size: 16px;");

  // 只匹配具体的行内容，绝对不匹配 sheetName
  const ROW_KEYWORDS = ["用友集团", "英雄游戏", "欣旺达", "携程", "nowcoder.com", "nowcoder", "建议用时"];

  function safeStringify(obj, space = 2) {
    const seen = new WeakSet();
    return JSON.stringify(obj, (key, value) => {
      if (typeof value === "object" && value !== null) {
        if (seen.has(value)) return undefined;
        seen.add(value);
      }
      return value;
    }, space);
  }

  const visited = new Set();
  const queue = [{ obj: window, path: "window", depth: 0, parent: null }];
  const IGNORE = new Set(["document", "window", "top", "parent", "frames", "self", "location", "history", "navigator"]);

  let bestMatch = null;

  while (queue.length > 0 && queue.length < 35000) {
    const { obj, path, depth, parent } = queue.shift();
    if (!obj || typeof obj !== "object" || visited.has(obj) || depth > 10) continue;
    visited.add(obj);

    // 检查当前对象内部是否直接包含真实的行数据特征
    let matchedKeywords = 0;
    try {
      const keys = Object.keys(obj);
      for (const k of keys) {
        const val = obj[k];
        if (typeof val === "string" && ROW_KEYWORDS.some(kw => val.includes(kw))) {
          matchedKeywords++;
        }
      }
    } catch(e) {}

    // 命中包含多个真实字段/值的行对象
    if (matchedKeywords >= 1) {
      console.log(`%c[命中数据行] ${path} (匹配到 ${matchedKeywords} 个真实字段)`, "color: #52c41a; font-weight: bold;");
      
      // 优先获取包含所有行的父级对象（如 recordMap 或 rows 数组）
      let candidate = obj;
      let candPath = path;
      if (parent && typeof parent === "object") {
        const pKeys = Object.keys(parent);
        // 如果父级包含很多个类似的行对象
        if (pKeys.length > 2) {
          candidate = parent;
          candPath = path.substring(0, path.lastIndexOf("."));
        }
      }

      bestMatch = { obj: candidate, path: candPath };
      break;
    }

    for (const key of Object.keys(obj)) {
      if (IGNORE.has(key) || key.startsWith("__REACT_DEVTOOLS")) continue;
      let val;
      try { val = obj[key]; } catch(e) { continue; }
      if (val && typeof val === "object" && !visited.has(val)) {
        queue.push({ obj: val, path: `${path}.${key}`, depth: depth + 1, parent: obj });
      }
    }
  }

  if (!bestMatch) {
    alert("内存扫描未能在当前瞬间命中行记录，请确保当前页面停留且已加载出包含试卷名字的表格！");
    return;
  }

  console.log("%c[成功捕获行数据容器]", "color: #52c41a; font-size: 15px; font-weight: bold;", bestMatch.path, bestMatch.obj);
  window.__REAL_ROWS_DATA__ = bestMatch.obj;

  try {
    const jsonStr = safeStringify(bestMatch.obj, 2);
    const blob = new Blob([jsonStr], { type: "application/json" });
    const a = document.createElement("a");
    a.href = URL.createObjectURL(blob);
    a.download = "smartsheet_real_dump.json";
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);

    alert(`🎉 恭喜！成功捕获真实表格行数据！已自动下载 smartsheet_real_dump.json！\n路径: ${bestMatch.path}\n请将下载的文件拖入项目 seeds/ 目录即可！`);
  } catch(err) {
    console.error("导出异常:", err);
    alert("导出异常: " + err.message);
  }
})();
