import os
import sys
import json
import zipfile
import xml.etree.ElementTree as ET

def parse_xlsx(file_path):
    print(f"[Excel Parser] 正在解析: {file_path}")
    zf = zipfile.ZipFile(file_path)
    
    # 1. 解析 sharedStrings.xml
    shared_strings = []
    if "xl/sharedStrings.xml" in zf.namelist():
        tree = ET.fromstring(zf.read("xl/sharedStrings.xml"))
        for si in tree.findall("{http://schemas.openxmlformats.org/spreadsheetml/2006/main}si"):
            text = "".join(t.text or "" for t in si.findall(".//{http://schemas.openxmlformats.org/spreadsheetml/2006/main}t"))
            shared_strings.append(text)
    
    # 2. 解析 workbook.xml 获取 sheet 列表
    sheet_info = []
    if "xl/workbook.xml" in zf.namelist():
        tree = ET.fromstring(zf.read("xl/workbook.xml"))
        sheets_node = tree.find("{http://schemas.openxmlformats.org/spreadsheetml/2006/main}sheets")
        if sheets_node is not None:
            for idx, s in enumerate(sheets_node.findall("{http://schemas.openxmlformats.org/spreadsheetml/2006/main}sheet")):
                name = s.get("name")
                sheet_id = s.get("{http://schemas.openxmlformats.org/officeDocument/2006/relationships}id") or f"rId{idx+1}"
                sheet_info.append({"name": name, "rId": sheet_id, "file": f"xl/worksheets/sheet{idx+1}.xml"})

    # 3. 逐个 sheet 提取行与单元格
    result = {"sheets": {}, "experiences": [], "resources": []}

    def get_col_index(cell_ref):
        col = ""
        for ch in cell_ref:
            if ch.isalpha(): col += ch
            else: break
        num = 0
        for c in col:
            num = num * 26 + (ord(c.upper()) - ord('A') + 1)
        return num - 1

    for s in sheet_info:
        sheet_name = s["name"]
        sheet_file = s["file"]
        if sheet_file not in zf.namelist():
            # 尝试通过名字寻找
            candidates = [f for f in zf.namelist() if f.startswith("xl/worksheets/sheet")]
            if candidates: sheet_file = candidates[len(result["sheets"]) % len(candidates)]
            else: continue

        print(f"[Excel Parser] 正在读取工作表: {sheet_name}")
        tree = ET.fromstring(zf.read(sheet_file))
        sheet_data = tree.find("{http://schemas.openxmlformats.org/spreadsheetml/2006/main}sheetData")
        if sheet_data is None: continue

        rows = []
        for r in sheet_data.findall("{http://schemas.openxmlformats.org/spreadsheetml/2006/main}row"):
            row_dict = {}
            for c in r.findall("{http://schemas.openxmlformats.org/spreadsheetml/2006/main}c"):
                ref = c.get("r", "")
                t = c.get("t", "")
                col_idx = get_col_index(ref)
                v_node = c.find("{http://schemas.openxmlformats.org/spreadsheetml/2006/main}v")
                val = ""
                if v_node is not None and v_node.text:
                    if t == "s" and shared_strings:
                        try:
                            s_idx = int(v_node.text)
                            val = shared_strings[s_idx]
                        except:
                            val = v_node.text
                    else:
                        val = v_node.text
                row_dict[col_idx] = val.strip()
            
            if any(row_dict.values()):
                max_col = max(row_dict.keys())
                row_list = [row_dict.get(i, "") for i in range(max_col + 1)]
                rows.append(row_list)

        if len(rows) < 2: continue
        headers = [h or f"列_{i+1}" for i, h in enumerate(rows[0])]
        structured_rows = []
        for r in rows[1:]:
            row_obj = {}
            for i, h in enumerate(headers):
                val = r[i] if i < len(r) else ""
                row_obj[h] = val
            row_obj["_source_sheet"] = sheet_name
            structured_rows.append(row_obj)

        result["sheets"][sheet_name] = structured_rows

        if any(k in sheet_name for k in ["面试经验", "上岸版", "面经"]):
            result["experiences"].extend(structured_rows)
        else:
            result["resources"].extend(structured_rows)

    output_path = os.path.join(os.path.dirname(__file__), "../../seeds/experiences_and_resources.json")
    output_path = os.path.abspath(output_path)
    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(result, f, ensure_ascii=False, indent=2)

    print(f"\n[Excel Parser] 🎉 成功解析 Excel！共提取面经 {len(result['experiences'])} 条，真题资料 {len(result['resources'])} 条。")
    print(f"[Excel Parser] 数据已写入: {output_path}")

if __name__ == "__main__":
    import glob
    seeds_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), "../../seeds"))
    downloads_dir = os.path.expanduser("~/Downloads")
    
    target_file = None
    if len(sys.argv) > 1:
        target_file = sys.argv[1]
    else:
        # 自动检索
        for d in [seeds_dir, downloads_dir, "D:/download"]:
            for f in glob.glob(os.path.join(d, "*.xlsx")):
                target_file = f
                break
            if target_file: break

    if target_file and os.path.exists(target_file):
        parse_xlsx(target_file)
    else:
        print("[Excel Parser] 请传入 .xlsx 文件路径，或将导出的 Excel 文件放入 seeds/ 或 Downloads 目录！")
