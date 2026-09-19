import os
import sys
import json
import zlib
import base64
import re
import hashlib

sys.stdout.reconfigure(encoding='utf-8')

def b64zlib(b64str):
    pad = (4 - len(b64str) % 4) % 4
    return json.loads(zlib.decompress(base64.b64decode(b64str + '=' * pad)).decode('utf-8'))

def generate_hash(text):
    return hashlib.sha256(text.encode('utf-8')).hexdigest()[:12]

def clean_sql_str(val):
    if val is None:
        return ''
    return str(val).replace("'", "''").strip()

def infer_format(title, desc, url):
    combined = (str(title) + ' ' + str(desc) + ' ' + str(url)).lower()
    if 'pdf' in combined:
        return 'PDF 文档'
    if 'excel' in combined or 'xlsx' in combined or '表格' in combined:
        return 'Excel 题库'
    if 'zip' in combined or 'rar' in combined or '压缩包' in combined or '礼包' in combined:
        return 'ZIP 资料包'
    if 'nowcoder.com' in combined:
        return '在线答题试卷'
    if 'docs.qq.com' in combined or 'feishu.cn' in combined:
        return '在线协同文档'
    if 'pan.baidu.com' in combined:
        return '百度网盘资源'
    if 'pan.quark.cn' in combined:
        return '夸克网盘资源'
    return '在线文档'

def infer_position_type(company, content, industry):
    combined = (company + ' ' + content[:500] + ' ' + industry).lower()
    if any(k in combined for k in ['java', 'c++', 'python', '后端', '前端', '软件', '研发', '架构', '嵌入式', '硬件']):
        return '技术研发'
    if any(k in combined for k in ['算法', 'ai', '机器学习', '深度学习', '人工智能', '大模型', '视觉']):
        return '算法/AI'
    if any(k in combined for k in ['产品', 'pm', '需求', '原型', '功能设计']):
        return '产品策划'
    if any(k in combined for k in ['运营', '市场', '新媒体', '增长', '社群']):
        return '运营推广'
    if any(k in combined for k in ['测试', 'qa', '质量']):
        return '质量测试'
    if industry:
        return f'{industry}方向'
    return '综合类'

def extract_summary(detail):
    if not detail:
        return '真实面试高频真题与核心问答全面拆解，含避坑指南与上岸复习建议。'
    lines = [line.strip() for line in detail.splitlines() if line.strip()]
    content_lines = []
    for line in lines:
        if line.startswith('#') or line.startswith('一、') or line.startswith('二、') or '【上岸版】' in line:
            continue
        content_lines.append(line)
    text = ' '.join(content_lines) if content_lines else ' '.join(lines)
    text = re.sub(r'\s+', ' ', text).strip()
    if len(text) > 160:
        return text[:160] + '...'
    return text

def main():
    root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '../..'))
    seeds_dir = os.path.join(root_dir, 'seeds')
    
    har_candidates = [
        os.path.join(seeds_dir, 'docs.qq.com.har'),
        r'D:\download\docs.qq.com.har',
        os.path.join(os.path.expanduser('~'), 'Downloads', 'docs.qq.com.har')
    ]
    
    har_path = None
    for p in har_candidates:
        if os.path.exists(p):
            har_path = p
            break
            
    if not har_path:
        print('[Error] 未找到 docs.qq.com.har 文件！')
        sys.exit(1)
        
    print(f'[HAR Parser] 正在读取 HAR 文件: {har_path} (大小: {os.path.getsize(har_path) / 1024 / 1024:.2f} MB)')
    with open(har_path, 'r', encoding='utf-8', errors='ignore') as f:
        har_data = json.load(f)

    entries = har_data.get('log', {}).get('entries', [])
    print(f'[HAR Parser] HAR 文件共包含 {len(entries)} 条网络请求')

    sub_chunks = {}
    for e in entries:
        url = e.get('request', {}).get('url', '')
        if 'dop-api' in url:
            c = e.get('response', {}).get('content', {})
            t = c.get('text', '')
            if not t: continue
            if c.get('encoding') == 'base64':
                t = base64.b64decode(t).decode('utf-8', errors='ignore')
            
            sub = None
            if 'tab=' in url:
                m_tab = re.search(r'[?&]tab=([^&]+)', url)
                if m_tab: sub = m_tab.group(1)
            elif 'subId=' in url:
                m_sub = re.search(r'[?&]subId=([^&]+)', url)
                if m_sub: sub = m_sub.group(1)
            if not sub: continue
            
            smart_b64 = None
            if 'clientVarsCallback' in t:
                m_cb = re.search(r'clientVarsCallback\((.*)\)', t, re.DOTALL)
                if m_cb:
                    smart_b64 = json.loads(m_cb.group(1))['clientVars']['collab_client_vars']['initialAttributedText']['text'][0].get('smartsheet')
            else:
                try:
                    smart_b64 = json.loads(t).get('data', {}).get('initialAttributedText', {}).get('text', [{}])[0].get('smartsheet')
                except:
                    pass
            
            if smart_b64:
                if sub not in sub_chunks:
                    sub_chunks[sub] = []
                sub_chunks[sub].append(b64zlib(smart_b64))

    print(f'[HAR Parser] 成功命中目标子表: {list(sub_chunks.keys())}')

    opt_maps = {}
    for sub, chunks in sub_chunks.items():
        opt_maps[sub] = {}
        for chunk in chunks:
            for it in chunk[0]:
                k3 = it.get('c', {}).get('k3', {})
                if isinstance(k3, dict) and 'k3' in k3:
                    for fid, fdef in k3['k3'].items():
                        if 'k9' in fdef and isinstance(fdef['k9'], dict) and 'k3' in fdef['k9']:
                            opt_maps[sub][fid] = {}
                            for opt in fdef['k9']['k3']:
                                opt_maps[sub][fid][opt.get('k1')] = opt.get('k2', '')

    def get_cell_text(cell, sub, fid):
        if not isinstance(cell, dict): return ''
        if 'k9' in cell and isinstance(cell['k9'], list):
            opts = [opt_maps.get(sub, {}).get(fid, {}).get(oid, oid) for oid in cell['k9']]
            return ','.join(filter(None, opts))
        if 'k8' in cell and isinstance(cell['k8'], list):
            u = cell['k8'][0].get('k3') or cell['k8'][0].get('k2') or ''
            return u.strip()
        if 'k1' in cell and isinstance(cell['k1'], list):
            return ''.join(s.get('k2', '') for s in cell['k1'] if isinstance(s, dict)).strip()
        if 'k2' in cell and isinstance(cell['k2'], str):
            return cell['k2'].strip()
        return ''

    def extract_rows(sub):
        chunks = sub_chunks.get(sub, [])
        records = {}
        row_order = []
        for chunk in chunks:
            for it in chunk[0]:
                c = it.get('c', {})
                k4 = c.get('k4', [])
                if isinstance(k4, list) and k4 and isinstance(k4[0], dict) and 'k1' in k4[0]:
                    for r in k4[0]['k1'].get('k1', []):
                        if r not in row_order:
                            row_order.append(r)
                k2 = c.get('k2', {})
                if isinstance(k2, dict) and 'k1' in k2:
                    records.update(k2['k1'])
        
        rows = []
        all_rids = row_order if len(row_order) >= len(records) else list(records.keys())
        for rid in all_rids:
            r = records.get(rid)
            if not r: continue
            row_data = r.get('k1', r)
            row_dict = {}
            has_any = False
            for fid, cell in row_data.items():
                val = get_cell_text(cell, sub, fid)
                if val:
                    has_any = True
                    row_dict[fid] = val
            if has_any:
                row_dict['_rid'] = rid
                rows.append(row_dict)
        return rows

    # 1. 提取面经复盘 (tkJOfb)
    exp_rows = extract_rows('tkJOfb')
    print(f'[HAR Parser] 提取到面经复盘 (tkJOfb) 原始记录: {len(exp_rows)} 条')

    experiences = []
    exp_idx = 0
    for r in exp_rows:
        comp = r.get('funVyx', '').strip()
        detail = r.get('fQfJj2', '').strip()
        industry = r.get('fLAqex', '').strip()
        if not comp and not detail:
            continue
        exp_idx += 1
        company_name = comp or '名企'
        title = f'{company_name}校招面试核心考点与全流程复盘【上岸经验】'
        pos_type = infer_position_type(company_name, detail, industry)
        summary = extract_summary(detail)
        exp_id = f'exp_real_{exp_idx:04d}_{generate_hash(company_name + title)}'
        
        experiences.append({
            'id': exp_id,
            'title': title,
            'company_name': company_name,
            'position_type': pos_type,
            'round_tag': '全流程复盘',
            'question_type': '核心考点与高频真题拆解',
            'summary': summary,
            'detail_content': detail or summary,
            'points_required': 5,
            'source_platform': '多维表格-大厂面试经验总结',
            'source_url': 'https://docs.qq.com/smartsheet/DRmRGYk14dW53VHdS?tab=tkJOfb',
            'view_count': 50 + (exp_idx * 7) % 150
        })

    # 2. 提取真题资料
    res_rows_t3 = extract_rows('t3cxoF')
    print(f'[HAR Parser] 提取到校招资料库 (t3cxoF) 原始记录: {len(res_rows_t3)} 条')
    
    res_rows_tl = extract_rows('tlO4ma')
    print(f'[HAR Parser] 提取到面试真题答题思路 (tlO4ma) 原始记录: {len(res_rows_tl)} 条')
    
    res_rows_t2 = extract_rows('t2DetB')
    print(f'[HAR Parser] 提取到互联网大厂真题合集 (t2DetB) 原始记录: {len(res_rows_t2)} 条')

    resources = []
    res_idx = 0

    # 2.1 处理校招资料库 (t3cxoF)
    for r in res_rows_t3:
        title = r.get('fxp4KM', '').strip()
        url = r.get('fFPRzQ', '').strip()
        code = r.get('ftLYy4', '').strip()
        if not title and not url:
            continue
        res_idx += 1
        res_id = f'res_real_{res_idx:04d}_{generate_hash(title + url)}'
        fmt = infer_format(title, '', url)
        resources.append({
            'id': res_id,
            'title': title,
            'category': '校招通关题库',
            'description': f'{title}，包含校招网申测评、笔试各题型核心题库及官方详细答案解析。',
            'file_format': fmt,
            'drive_url': url or 'https://docs.qq.com/smartsheet/DRmRGYk14dW53VHdS?tab=t3cxoF',
            'access_code': code,
            'points_required': 10,
            'download_count': 20 + (res_idx * 11) % 180
        })

    # 2.2 处理面试真题答题思路 (tlO4ma)
    for r in res_rows_tl:
        comp = r.get('fLE85r', '').strip()
        pos = r.get('fsJX0a', '').strip()
        q = r.get('fgIfX1', '').strip()
        ans = r.get('fi865P', '').strip()
        if not q and not ans:
            continue
        res_idx += 1
        clean_q = re.sub(r'^(?:问[：:]|\d+[、. ]+)', '', q).strip()
        header_prefix = f'【{comp}·{pos}】' if comp and pos else (f'【{comp}】' if comp else '')
        res_title = f'{header_prefix}{clean_q}' if header_prefix else clean_q
        if len(res_title) > 180:
            res_title = res_title[:177] + '...'
        res_id = f'res_real_{res_idx:04d}_{generate_hash(comp + pos + q)}'
        
        resources.append({
            'id': res_id,
            'title': res_title,
            'category': '答题思路与秘籍',
            'description': ans or f'{comp} {pos} 核心考题深度拆解与标准答案参考。',
            'file_format': '在线答题文档',
            'drive_url': 'https://docs.qq.com/smartsheet/DRmRGYk14dW53VHdS?tab=tlO4ma',
            'access_code': '',
            'points_required': 10,
            'download_count': 15 + (res_idx * 9) % 210
        })

    # 2.3 处理互联网大厂真题合集 (t2DetB)
    for r in res_rows_t2:
        comp = r.get('fvSyNZ', '').strip()
        pos = r.get('fbu9fA', '').strip()
        detail_pos = r.get('fH11DU', '').strip()
        paper_name = r.get('f2g1QT', '').strip()
        minutes = r.get('fu0hg2', '').strip() or '60'
        url = r.get('fvqJGe', '').strip()
        if not paper_name and not url:
            continue
        res_idx += 1
        res_title = paper_name or f'{comp}{detail_pos or pos}笔试真题试卷'
        res_id = f'res_real_{res_idx:04d}_{generate_hash(res_title + url)}'
        
        resources.append({
            'id': res_id,
            'title': res_title,
            'category': '大厂历年真题',
            'description': f'{comp} {detail_pos or pos} 历年笔试/面试真题试卷，建议用时 {minutes} 分钟，在线模拟答题与即时判分。',
            'file_format': '在线答题试卷',
            'drive_url': url or 'https://docs.qq.com/smartsheet/DRmRGYk14dW53VHdS?tab=t2DetB',
            'access_code': '',
            'points_required': 10,
            'download_count': 30 + (res_idx * 13) % 260
        })

    print(f'[HAR Parser] 清洗转换完成: 真实面经 {len(experiences)} 条，真实真题资料 {len(resources)} 条')

    # 输出 JSON 产物
    exp_out_path = os.path.join(seeds_dir, 'real_experiences.json')
    res_out_path = os.path.join(seeds_dir, 'real_resources.json')
    combo_out_path = os.path.join(seeds_dir, 'experiences_and_resources.json')

    with open(exp_out_path, 'w', encoding='utf-8') as f:
        json.dump(experiences, f, ensure_ascii=False, indent=2)
    with open(res_out_path, 'w', encoding='utf-8') as f:
        json.dump(resources, f, ensure_ascii=False, indent=2)
    with open(combo_out_path, 'w', encoding='utf-8') as f:
        json.dump({
            'exported_at': '2026-09-19T12:00:00.000Z',
            'doc_id': 'DRmRGYk14dW53VHdS',
            'experiences': experiences,
            'resources': resources
        }, f, ensure_ascii=False, indent=2)

    print(f'[HAR Parser] 数据已同步至:')
    print(f'  - {exp_out_path}')
    print(f'  - {res_out_path}')
    print(f'  - {combo_out_path}')

    # 生成 D1 迁移文件
    migration_path = os.path.join(root_dir, 'frontend', 'migrations', '0009_import_real_experiences_and_resources.sql')
    print(f'[HAR Parser] 正在生成 SQL 迁移脚本: {migration_path}')

    with open(migration_path, 'w', encoding='utf-8') as f:
        f.write('-- 0008_import_real_experiences_and_resources.sql\n')
        f.write('-- 全量同步腾讯多维表格真实“面经复盘”与“真题资料”，并清除初始化阶段虚拟 Mock 占位数据\n\n')
        
        f.write('-- 1. 清除虚拟占位 Mock 数据\n')
        f.write("DELETE FROM interview_experiences WHERE id LIKE 'exp_0%';\n")
        f.write("DELETE FROM resource_materials WHERE id LIKE 'res_0%';\n\n")

        f.write(f'-- 2. 导入真实面经复盘 (共 {len(experiences)} 条)\n')
        for exp in experiences:
            f.write('INSERT OR REPLACE INTO interview_experiences (\n')
            f.write('  id, title, company_name, position_type, round_tag, question_type,\n')
            f.write('  summary, detail_content, points_required, source_platform, source_url, view_count\n')
            f.write(') VALUES (\n')
            f.write(f"  '{clean_sql_str(exp['id'])}',\n")
            f.write(f"  '{clean_sql_str(exp['title'])}',\n")
            f.write(f"  '{clean_sql_str(exp['company_name'])}',\n")
            f.write(f"  '{clean_sql_str(exp['position_type'])}',\n")
            f.write(f"  '{clean_sql_str(exp['round_tag'])}',\n")
            f.write(f"  '{clean_sql_str(exp['question_type'])}',\n")
            f.write(f"  '{clean_sql_str(exp['summary'])}',\n")
            f.write(f"  '{clean_sql_str(exp['detail_content'])}',\n")
            f.write(f"  {exp['points_required']},\n")
            f.write(f"  '{clean_sql_str(exp['source_platform'])}',\n")
            f.write(f"  '{clean_sql_str(exp['source_url'])}',\n")
            f.write(f"  {exp['view_count']}\n")
            f.write(');\n')

        f.write(f'\n-- 3. 导入真实求职真题资料 (共 {len(resources)} 条)\n')
        for res in resources:
            f.write('INSERT OR REPLACE INTO resource_materials (\n')
            f.write('  id, title, category, description, file_format, drive_url, access_code, points_required, download_count\n')
            f.write(') VALUES (\n')
            f.write(f"  '{clean_sql_str(res['id'])}',\n")
            f.write(f"  '{clean_sql_str(res['title'])}',\n")
            f.write(f"  '{clean_sql_str(res['category'])}',\n")
            f.write(f"  '{clean_sql_str(res['description'])}',\n")
            f.write(f"  '{clean_sql_str(res['file_format'])}',\n")
            f.write(f"  '{clean_sql_str(res['drive_url'])}',\n")
            f.write(f"  '{clean_sql_str(res['access_code'])}',\n")
            f.write(f"  {res['points_required']},\n")
            f.write(f"  {res['download_count']}\n")
            f.write(');\n')

    print(f'[HAR Parser] 🎉 SQL 迁移文件生成完毕！文件大小: {os.path.getsize(migration_path) / 1024 / 1024:.2f} MB')

if __name__ == '__main__':
    main()
