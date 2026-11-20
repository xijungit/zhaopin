# -*- coding: utf-8 -*-
import os
import sys
import json
import zlib
import base64
import re
import hashlib
import sqlite3
import urllib.parse
from datetime import datetime

sys.stdout.reconfigure(encoding='utf-8')

def b64zlib(b64str):
    pad = (4 - len(b64str) % 4) % 4
    return json.loads(zlib.decompress(base64.b64decode(b64str + '=' * pad)).decode('utf-8'))

def clean_sql_str(val):
    if val is None:
        return ''
    return str(val).replace("'", "''").strip()

def clean_url(url):
    if not url:
        return ''
    url = str(url).strip()
    if 'docs.qq.com/scenario/link.html' in url:
        m = re.search(r'[?&](?:url|target)=([^&]+)', url)
        if m:
            try:
                url = urllib.parse.unquote(m.group(1)).strip()
            except:
                pass
    return url

def clean_city_list(city_str):
    if not city_str:
        return '["全国"]'
    tokens = re.split(r'[,，、/|\s;]+', str(city_str).replace('市', '').strip())
    tokens = [t.strip() for t in tokens if t.strip() and t.strip() != '...']
    if len(tokens) > 8:
        tokens = tokens[:8]
        if '全国' not in tokens:
            tokens.append('全国')
    if not tokens:
        tokens = ['全国']
    return json.dumps(tokens, ensure_ascii=False)

def clean_pos_list(pos_str):
    if not pos_str:
        return '["综合岗"]'
    tokens = re.split(r'[,，、/|\s;]+', str(pos_str).strip())
    tokens = [t.strip() for t in tokens if t.strip() and t.strip() != '...' and '等' not in t]
    if len(tokens) > 6:
        tokens = tokens[:6]
    if not tokens:
        tokens = ['综合岗']
    return json.dumps(tokens, ensure_ascii=False)

def infer_industry(prop, comp, pos):
    text = (str(prop) + ' ' + str(comp) + ' ' + str(pos)).lower()
    if any(k in text for k in ['互联网', '软件', '游戏', '字节', '腾讯', '阿里', '快手', '美团']):
        return '互联网/科技'
    if any(k in text for k in ['芯片', '半导体', '集成电路', '硬件', '电子']):
        return '电子/半导体'
    if any(k in text for k in ['新能源', '光伏', '电池', '锂电', '风电', '储能', '能源', '电力', '电网']):
        return '新能源/能源'
    if any(k in text for k in ['汽车', '整车', '制造', '蔚来', '小鹏', '比亚迪', '吉利']):
        return '汽车/制造'
    if any(k in text for k in ['药', '生物', '医疗', '器械', '健康', '医学']):
        return '生物医药'
    if any(k in text for k in ['银行', '证券', '保险', '基金', '金融', '期货']):
        return '金融/银行'
    if any(k in text for k in ['机械', '装备', '航天', '航空', '船舶', '重工', '自动化']):
        return '高端制造'
    if any(k in text for k in ['建筑', '地产', '设计', '规划', '土木', '工程']):
        return '建筑/地产'
    if any(k in text for k in ['快消', '电商', '消费', '食品', '饮料', '零售']):
        return '消费品/零售'
    if any(k in text for k in ['通信', '移动', '联通', '电信', '铁塔']):
        return '通信运营'
    if any(k in text for k in ['科研', '院所', '大学', '高校', '教育']):
        return '科教科研'
    return '综合行业'

def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    root_dir = os.path.abspath(os.path.join(script_dir, '../..'))
    har_path = os.path.join(root_dir, 'seeds/docs.qq.com.har')
    d1_dir = os.path.join(root_dir, 'frontend/.wrangler/state/v3/d1/miniflare-D1DatabaseObject')
    db_path = os.path.join(d1_dir, '93963726e7abc34d6aace238e289e1185af5e891a69d5b86ae22b195c1f6295a.sqlite')
    if (not os.path.exists(db_path) or os.path.getsize(db_path) == 0) and os.path.exists(d1_dir):
        candidates = [
            os.path.join(d1_dir, f) for f in os.listdir(d1_dir)
            if f.endswith('.sqlite') and not f.startswith('metadata') and os.path.getsize(os.path.join(d1_dir, f)) > 0
        ]
        if candidates:
            candidates.sort(key=lambda p: (os.path.getsize(p), os.path.getmtime(p)), reverse=True)
            db_path = candidates[0]
    migrations_dir = os.path.join(root_dir, 'frontend/migrations')

    # Also check Downloads folder if HAR is in Downloads
    dl_har = os.path.join(os.path.expanduser('~'), 'Downloads/docs.qq.com.har')
    if os.path.exists(dl_har):
        if not os.path.exists(har_path) or os.path.getmtime(dl_har) > os.path.getmtime(har_path):
            import shutil
            shutil.copy2(dl_har, har_path)
            print(f'[HAR Sync] 检测到 Downloads 中有更新的 HAR 文件，已覆盖同步: {dl_har} -> {har_path}')

    if not os.path.exists(har_path):
        print(f'[Error] HAR file not found at {har_path}')
        sys.exit(1)

    print(f'[Step 1] Loading local SQLite database for deduplication & update check...')
    conn = sqlite3.connect(db_path)
    cur = conn.cursor()

    existing_job_keys = set()
    existing_referrals_by_comp = {}
    for row in cur.execute('SELECT id, company_name, referral_code, apply_url, dedup_hash, channel_type FROM job_referrals'):
        jid, comp, ref_code, url, d_hash, channel_type = row
        c_clean = comp.strip() if comp else ''
        u_clean = url.strip() if url else ''
        if c_clean and u_clean:
            existing_job_keys.add(f'{c_clean}_{u_clean}')
        if d_hash:
            existing_job_keys.add(d_hash.strip())
        if channel_type == 'referral' and c_clean:
            existing_referrals_by_comp.setdefault(c_clean, []).append({
                'id': jid,
                'code': (ref_code or '').strip(),
                'url': u_clean
            })

    existing_exp_keys = set()
    for row in cur.execute('SELECT company_name, title FROM interview_experiences'):
        comp, title = row
        if comp and title:
            existing_exp_keys.add(f'{comp.strip()}_{title.strip()}')

    existing_res_keys = set()
    for row in cur.execute('SELECT title, drive_url FROM resource_materials'):
        title, d_url = row
        if title:
            existing_res_keys.add(title.strip())
        if d_url:
            existing_res_keys.add(d_url.strip())

    print(f'Existing Job Keys: {len(existing_job_keys)}')
    print(f'Existing Experience Keys: {len(existing_exp_keys)}')
    print(f'Existing Resource Keys: {len(existing_res_keys)}')

    print(f'[Step 2] Parsing HAR file: {har_path} (Size: {os.path.getsize(har_path)/1024/1024:.2f} MB)...')
    with open(har_path, 'r', encoding='utf-8', errors='ignore') as f:
        har_data = json.load(f)

    sub_chunks = {}
    tab_server_meta = {}
    tab_cell_max_time = {}

    for e in har_data.get('log', {}).get('entries', []):
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
            if not sub:
                m = re.search(r'(BB\w+|t\w{5})', url)
                if m: sub = m.group(1)
            
            smart_b64 = None
            if 'clientVarsCallback' in t:
                m_cb = re.search(r'clientVarsCallback\((.*)\)', t, re.DOTALL)
                if m_cb:
                    try:
                        cv = json.loads(m_cb.group(1))['clientVars']
                        smart_b64 = cv['collab_client_vars']['initialAttributedText']['text'][0].get('smartsheet')
                        headers = cv.get('collab_client_vars', {}).get('header', [])
                        for g in headers:
                            for tb in g.get('d', []):
                                tid = tb.get('id')
                                tname = tb.get('name')
                                if tid and tname:
                                    tab_server_meta.setdefault(tid, {})['title'] = tname
                    except:
                        pass
            else:
                try:
                    js_data = json.loads(t).get('data', {})
                    smart_b64 = js_data.get('initialAttributedText', {}).get('text', [{}])[0].get('smartsheet')
                    page_ctx = js_data.get('pageCtx')
                    if isinstance(page_ctx, str):
                        p_info = json.loads(page_ctx)
                        tot = p_info.get('total_row')
                        if tot is not None and sub:
                            tab_server_meta.setdefault(sub, {})['total_row'] = tot
                    elif js_data.get('maxrow') and sub:
                        tab_server_meta.setdefault(sub, {})['total_row'] = js_data.get('maxrow')
                except:
                    pass

            if smart_b64 and sub:
                decomp = b64zlib(smart_b64)
                sub_chunks.setdefault(sub, []).append(decomp)
                for elem in decomp[0]:
                    k2 = elem.get('c', {}).get('k2', {})
                    if isinstance(k2, dict) and 'k1' in k2:
                        for rid, r in k2['k1'].items():
                            row = r.get('k1', r)
                            for fid, cell in row.items():
                                if isinstance(cell, dict):
                                    ts = cell.get('k32')
                                    if ts and str(ts).isdigit():
                                        ts_int = int(ts)
                                        if ts_int > tab_cell_max_time.get(sub, 0):
                                            tab_cell_max_time[sub] = ts_int

    opt_maps = {}
    for sub, chunks in sub_chunks.items():
        opt_maps[sub] = {}
        for chunk in chunks:
            for it in chunk[0]:
                k3 = it.get('c', {}).get('k3', {})
                if isinstance(k3, dict) and 'k3' in k3:
                    for fid, fdef in k3['k3'].items():
                        opts_list = []
                        if 'k17' in fdef and isinstance(fdef['k17'], dict) and 'k3' in fdef['k17']:
                            opts_list = fdef['k17']['k3']
                        elif 'k9' in fdef and isinstance(fdef['k9'], dict) and 'k3' in fdef['k9']:
                            opts_list = fdef['k9']['k3']
                        if opts_list:
                            opt_maps[sub][fid] = {}
                            for opt in opts_list:
                                opt_maps[sub][fid][opt.get('k1')] = opt.get('k2', '')

    def get_cell_text(cell, sub, fid):
        if not isinstance(cell, dict): return ''
        if 'k17' in cell and isinstance(cell['k17'], list):
            opts = [opt_maps.get(sub, {}).get(fid, {}).get(oid, oid) for oid in cell['k17']]
            return ','.join(filter(None, opts))
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

    print('\n[Step 3] HAR 子表诊断与完整性自检:')
    all_tab_names = {
        'BB08J2': '官方内推汇总',
        'tny2X0': '企业网申信息汇总',
        'tXOMXd': '校园招聘官方平台',
        'tkJOfb': '大厂面试经验总结',
        'tlO4ma': '面试真题答题思路',
        'tOh0uO': '牛客/小红书面经',
        't3cxoF': '校招资料库(题库)',
        't2DetB': '大厂历年真题合集',
        'tcv4Zk': '地方人才政策汇总'
    }

    warn_tabs = []
    for tid, title in all_tab_names.items():
        rows = extract_rows(tid)
        loaded_cnt = len(rows)
        meta_tot = tab_server_meta.get(tid, {}).get('total_row', loaded_cnt)
        max_ts = tab_cell_max_time.get(tid, 0)
        dt_str = datetime.fromtimestamp(max_ts / 1000).strftime('%Y-%m-%d %H:%M') if max_ts else '历史'
        
        status_flag = '✓ 完整'
        if loaded_cnt < meta_tot:
            status_flag = f'⚠️ 缺漏({loaded_cnt}/{meta_tot})'
            warn_tabs.append((tid, title, loaded_cnt, meta_tot))
        print(f'  - [{tid}] {title:18s}: 已加载 {loaded_cnt:4d} 行 / 服务端总行数 {meta_tot:4d} | 最新修改: {dt_str} | {status_flag}')

    if warn_tabs:
        print('\n' + '='*70)
        print('⚠️  【温馨提示：HAR文件存在未滚到底部的子表】')
        for wt in warn_tabs:
            print(f'   子表【{wt[1]}】({wt[0]}) 线上总共 {wt[3]} 行，但 HAR 抓包只抓到了前 {wt[2]} 行！')
        print('   建议操作：请在浏览器打开该多维表格，点击对应子表并【向下滚动拉到最底部】，')
        print('   然后再重新导出 HAR 文件并放入 seeds/docs.qq.com.har，避免遗漏底部新数据。')
        print('='*70 + '\n')

    print('\n[Step 4] Processing Subtabs and deduplicating...')

    # 1. Subtab tny2X0 -> 企业校招 (channel_type = 'enterprise')
    rows_ent = extract_rows('tny2X0')
    new_enterprise_jobs = []
    for r in rows_ent:
        comp = r.get('fuC4ml', '').strip()
        apply_url = clean_url(r.get('fCfYCy') or r.get('frp4xc'))
        if not comp or not apply_url or len(apply_url) < 8:
            continue
        
        d_hash = hashlib.sha256(f'{comp}_{apply_url}'.encode('utf-8')).hexdigest()[:16]
        key1 = f'{comp}_{apply_url}'
        if key1 in existing_job_keys or d_hash in existing_job_keys:
            continue
        existing_job_keys.add(key1)
        existing_job_keys.add(d_hash)

        job_pos = r.get('fKEqPG', '全职校招岗位')
        industry = r.get('fd6Ih1') or infer_industry('', comp, job_pos)
        rec_type = r.get('fDriSQ') or '2026/2027校招'
        cities = clean_city_list(r.get('fiwGHt', '全国'))
        categories = clean_pos_list(job_pos)
        deadline = r.get('f8Qb0Z', '')
        pub_time = r.get('fTUflc') or datetime.now().strftime('%Y-%m-%dT%H:%M:%SZ')
        if len(pub_time) == 10 and '-' in pub_time:
            pub_time = f'{pub_time}T00:00:00.000Z'
        title = f'{comp}{rec_type}网申开启'
        highlights = f'【{comp}】校园招聘官方网申通道。招聘岗位：{job_pos}。地点覆盖：{r.get("fiwGHt", "全国")}。'
        
        new_enterprise_jobs.append((
            f'ent_{d_hash}',
            comp,
            industry,
            rec_type,
            categories,
            cities,
            title,
            apply_url,
            pub_time,
            deadline,
            highlights,
            d_hash
        ))

    print(f'-> Extracted {len(new_enterprise_jobs)} NEW enterprise jobs.')

    # 2. Subtab tXOMXd -> 央国企校招 (channel_type = 'soe')
    rows_soe = extract_rows('tXOMXd')
    new_soe_jobs = []
    for r in rows_soe:
        pairs = [
            (r.get('fYq3YD', '').strip(), clean_url(r.get('ffIV3t')), r.get('fz9O3d', '事业单位/地方国企')),
            (r.get('fElZEt', '').strip(), clean_url(r.get('fLLbTe')), r.get('fVqvmx', '央企名录'))
        ]
        for comp, url, stype in pairs:
            if not comp or not url or len(url) < 8:
                continue
            d_hash = hashlib.sha256(f'{comp}_{url}'.encode('utf-8')).hexdigest()[:16]
            key1 = f'{comp}_{url}'
            if key1 in existing_job_keys or d_hash in existing_job_keys:
                continue
            existing_job_keys.add(key1)
            existing_job_keys.add(d_hash)

            industry = infer_industry(stype, comp, '管理及综合')
            rec_type = '官方校招录用'
            categories = json.dumps(['管理管培', '专业技术', '综合业务'], ensure_ascii=False)
            cities = json.dumps(['全国', '重点省市'], ensure_ascii=False)
            title = f'{comp}官方招聘平台'
            highlights = f'【{comp}】官方录用专栏直达。性质：{stype}。覆盖总分支机构校园招聘与定向录用公告。'
            pub_time = datetime.now().strftime('%Y-%m-%dT00:00:00.000Z')

            new_soe_jobs.append((
                f'soe_{d_hash}',
                comp,
                industry,
                rec_type,
                categories,
                cities,
                title,
                url,
                pub_time,
                highlights,
                d_hash,
                stype
            ))

    print(f'-> Extracted {len(new_soe_jobs)} NEW SOE jobs.')

    # 3. Subtab BB08J2 -> 官方内推 (channel_type = 'referral') + 热更新已有内推码/链接
    rows_ref = extract_rows('BB08J2')
    new_referrals = []
    updated_referrals = []

    for r in rows_ref:
        comp = r.get('funVyx', '').strip()
        ref_code = r.get('fdsuyd', '').strip()
        apply_url = clean_url(r.get('fZ0o0K') or r.get('fhMy9x'))
        if not comp:
            continue
        if not apply_url and not ref_code:
            continue

        d_hash = hashlib.sha256(f'{comp}_{ref_code}_{apply_url}'.encode('utf-8')).hexdigest()[:16]
        key1 = f'{comp}_{apply_url}'

        if comp in existing_referrals_by_comp:
            ex_list = existing_referrals_by_comp[comp]
            matched_ex = None
            for ex in ex_list:
                if apply_url and ex['url'] == apply_url:
                    matched_ex = ex
                    break
            if not matched_ex and len(ex_list) == 1:
                matched_ex = ex_list[0]

            if matched_ex:
                needs_update = False
                new_code = ref_code if ref_code else matched_ex['code']
                new_u = apply_url if apply_url else matched_ex['url']
                if ref_code and ref_code != matched_ex['code']:
                    needs_update = True
                if apply_url and apply_url != matched_ex['url']:
                    needs_update = True
                
                if needs_update:
                    updated_referrals.append((matched_ex['id'], comp, new_code, new_u))
                    matched_ex['code'] = new_code
                    matched_ex['url'] = new_u
                    continue

        if key1 in existing_job_keys or d_hash in existing_job_keys:
            continue
        existing_job_keys.add(key1)
        existing_job_keys.add(d_hash)

        industry = r.get('fLAqex') or infer_industry('', comp, r.get('fi1tV0', ''))
        rec_type = r.get('f8ZqLG') or '2026/2027内推'
        categories = clean_pos_list(r.get('fi1tV0', ''))
        cities = clean_city_list(r.get('fJQ64O', '全国'))
        deadline = r.get('fdkAD7', '')
        pub_time = r.get('frFn6O') or datetime.now().strftime('%Y-%m-%dT%H:%M:%SZ')
        if len(pub_time) == 10 and '-' in pub_time:
            pub_time = f'{pub_time}T00:00:00.000Z'
        title = f'{comp}{rec_type}官方内推'
        highlights = r.get('f471tG') or r.get('fU8LKa') or f'【{comp}】官方内推通道，专属内推码：{ref_code}'

        new_referrals.append((
            f'ref_{d_hash}',
            comp,
            industry,
            rec_type,
            categories,
            cities,
            title,
            ref_code,
            apply_url,
            pub_time,
            deadline,
            highlights,
            d_hash
        ))

    print(f'-> Extracted {len(new_referrals)} NEW referrals, {len(updated_referrals)} referrals needing code/URL updates.')

    # 4. Subtab tkJOfb / tlO4ma / tOh0uO -> 面经复盘 (interview_experiences)
    rows_exp1 = extract_rows('tkJOfb')
    rows_exp2 = extract_rows('tlO4ma')
    rows_exp3 = extract_rows('tOh0uO')
    
    new_experiences = []
    for r in rows_exp1:
        comp = r.get('funVyx', '').strip()
        detail = r.get('fQfJj2', '').strip()
        ind = r.get('fLAqex', '').strip() or '综合行业'
        if not comp or len(detail) < 15: continue
        title = f'{comp}校招面试通关复盘与高频真题精解'
        key1 = f'{comp}_{title}'
        if key1 in existing_exp_keys: continue
        existing_exp_keys.add(key1)

        summary = (detail[:150] + '...').replace('\n', ' ')
        e_id = f'exp_{hashlib.sha256(key1.encode("utf-8")).hexdigest()[:16]}'
        new_experiences.append((e_id, title, comp, '技术/综合岗', '一面/二面/HR面', ind, summary, detail, 50, ''))

    for r in rows_exp2:
        comp = r.get('fLE85r', '').strip()
        q = r.get('fgIfX1', '').strip()
        ans = r.get('fi865P', '').strip()
        pos = r.get('fsJX0a', '').strip() or '核心专业岗'
        if not comp or (not q and not ans): continue
        title = f'{comp}{pos}经典面试题拆解及答题思路'
        key1 = f'{comp}_{title}'
        if key1 in existing_exp_keys: continue
        existing_exp_keys.add(key1)

        detail = f'### 面试真题\n{q}\n\n### 参考思路与核心要点\n{ans}'
        summary = (q[:120] + '...').replace('\n', ' ') if q else '名企高频考核题目深度剖析与标准答题参考。'
        e_id = f'exp_{hashlib.sha256(key1.encode("utf-8")).hexdigest()[:16]}'
        new_experiences.append((e_id, title, comp, pos, '专业技术面', '高频真题精解', summary, detail, 30, ''))

    for r in rows_exp3:
        comp = r.get('fAbVyf', '').strip()
        pos = r.get('fEDJOw', '').strip() or '核心业务岗'
        links = []
        for lk in ['fFFkuW', 'fKbFys', 'flhwVn', 'ffeqFC', 'fSXagA', 'fAu3B4']:
            u = clean_url(r.get(lk))
            if u: links.append(u)
        if not comp or not links: continue
        title = f'{comp}{pos}求职上岸经历与面试真题精选'
        key1 = f'{comp}_{title}'
        if key1 in existing_exp_keys: continue
        existing_exp_keys.add(key1)

        links_str = '\n'.join([f'- [面经资源直达]({u})' for u in links])
        detail = f'### {comp} {pos} 上岸经验与复习资源汇总\n\n{links_str}\n\n> 建议对照岗位技术栈系统性梳理过往项目经历与核心考察点。'
        summary = f'{comp}{pos}校招上岸经验深度复盘，附真题汇总与复习参考资料。'
        e_id = f'exp_{hashlib.sha256(key1.encode("utf-8")).hexdigest()[:16]}'
        new_experiences.append((e_id, title, comp, pos, '综合复盘', '上岸资料汇总', summary, detail, 30, links[0] if links else ''))

    print(f'-> Extracted {len(new_experiences)} NEW experiences.')

    # 5. Subtab tcv4Zk -> 人才政策 (resource_materials, category='人才引进政策')
    rows_policy = extract_rows('tcv4Zk')
    new_resources = []
    for r in rows_policy:
        name = r.get('fWbnIH', '').strip()
        url = clean_url(r.get('fnKvM8'))
        city = r.get('fRiVMs', '').strip()
        date_str = r.get('felAX9', '').strip()
        if not name or not url: continue
        if (name and name in existing_res_keys) or (url and url in existing_res_keys): continue
        if name: existing_res_keys.add(name)
        if url: existing_res_keys.add(url)

        title = f'【{city or "人才政策"}】{name}'
        res_id = f'res_pol_{hashlib.sha256((name + url).encode("utf-8")).hexdigest()[:14]}'
        desc = f'各省市青年校招毕业生青年人才引进政策官方细则与申报指南，涵盖落户、租房补贴、生活安家费及安居补贴等优惠政策。' + (f'发布时间：{date_str}。' if date_str else '')
        new_resources.append((
            res_id,
            title,
            '人才引进政策',
            desc,
            '在线协同文档',
            url,
            '',
            0
        ))

    # 6. Subtab t3cxoF -> 校招题库 (resource_materials, category='校招通关题库')
    rows_t3 = extract_rows('t3cxoF')
    for r in rows_t3:
        title = r.get('fxp4KM', '').strip()
        url = clean_url(r.get('fFPRzQ'))
        code = r.get('ftLYy4', '').strip()
        if not title and not url: continue
        if (title and title in existing_res_keys) or (url and url in existing_res_keys):
            continue
        if title: existing_res_keys.add(title)
        if url: existing_res_keys.add(url)

        res_id = f'res_t3_{hashlib.sha256((title + url).encode("utf-8")).hexdigest()[:14]}'
        fmt = '百度网盘资源' if 'pan.baidu.com' in url else '在线文档'
        desc = f'{title}，包含校招网申测评、笔试各题型核心题库及官方详细答案解析。'
        new_resources.append((
            res_id,
            title,
            '校招通关题库',
            desc,
            fmt,
            url,
            code,
            10
        ))

    # 7. Subtab t2DetB -> 互联网大厂真题 (resource_materials, category='大厂历年真题')
    rows_t2 = extract_rows('t2DetB')
    for r in rows_t2:
        comp = r.get('fvSyNZ', '').strip()
        pos = r.get('fbu9fA', '').strip()
        detail_pos = r.get('fH11DU', '').strip()
        paper_name = r.get('f2g1QT', '').strip()
        minutes = r.get('fu0hg2', '').strip() or '60'
        url = clean_url(r.get('fvqJGe'))
        if not paper_name and not url: continue
        res_title = paper_name or f'{comp}{detail_pos or pos}笔试真题试卷'
        if (res_title and res_title in existing_res_keys) or (url and url in existing_res_keys):
            continue
        if res_title: existing_res_keys.add(res_title)
        if url: existing_res_keys.add(url)

        res_id = f'res_t2_{hashlib.sha256((res_title + url).encode("utf-8")).hexdigest()[:14]}'
        desc = f'{comp} {detail_pos or pos} 历年笔试/面试真题试卷，建议用时 {minutes} 分钟，在线模拟答题与即时判分。'
        new_resources.append((
            res_id,
            res_title,
            '大厂历年真题',
            desc,
            '在线答题试卷',
            url,
            '',
            10
        ))

    print(f'-> Extracted {len(new_resources)} NEW resources (Policy/Question Banks/Past Papers).')

    total_mutations = len(new_enterprise_jobs) + len(new_soe_jobs) + len(new_referrals) + len(updated_referrals) + len(new_experiences) + len(new_resources)
    if total_mutations == 0:
        print('\n[Result] 未检测到任何新增或需更新的数据，当前数据库已与当前 HAR 文件完全一致，无需生成重复迁移。')
        sys.exit(2)

    existing_sql_files = [f for f in os.listdir(migrations_dir) if f.endswith('.sql')]
    max_num = 0
    for f in existing_sql_files:
        m = re.match(r'^(\d{4})_', f)
        if m:
            num = int(m.group(1))
            if num > max_num:
                max_num = num

    target_migration_num = max_num + 1
    sql_filename = f'{target_migration_num:04d}_merge_all_smartsheet_subtabs.sql'
    sql_path = os.path.join(migrations_dir, sql_filename)

    sql_lines = []
    sql_lines.append(f'-- {sql_filename}')
    sql_lines.append('-- 自动增量融合多维表格新数据与内推热更新\n')

    if updated_referrals:
        sql_lines.append('-- 0. 内推码与投递链接热更新')
        for uid, comp, code, url in updated_referrals:
            sql_lines.append(f"UPDATE job_referrals SET referral_code = '{clean_sql_str(code)}', apply_url = '{clean_sql_str(url)}' WHERE id = '{clean_sql_str(uid)}';")
        sql_lines.append('')

    if new_enterprise_jobs:
        sql_lines.append('-- 1. 新增企业校招岗位 (enterprise)')
        for i in range(0, len(new_enterprise_jobs), 10):
            batch = new_enterprise_jobs[i:i+10]
            val_strs = []
            for j in batch:
                val_strs.append(f"('{clean_sql_str(j[0])}', '{clean_sql_str(j[1])}', '{clean_sql_str(j[2])}', '{clean_sql_str(j[3])}', '{clean_sql_str(j[4])}', '{clean_sql_str(j[5])}', '{clean_sql_str(j[6])}', '', '{clean_sql_str(j[7])}', '{clean_sql_str(j[8])}', '{clean_sql_str(j[9])}', 'active', '{clean_sql_str(j[10])}', 1, '{clean_sql_str(j[11])}', 'enterprise', '民营/外企')")
            sql_lines.append("INSERT OR IGNORE INTO job_referrals (id, company_name, industry, recruitment_type, job_categories, cities, job_title, referral_code, apply_url, publish_time, deadline, status, highlights, is_official_sync, dedup_hash, channel_type, soe_type) VALUES\n" + ",\n".join(val_strs) + ";\n")

    if new_soe_jobs:
        sql_lines.append('-- 2. 新增央国企校招岗位 (soe)')
        for i in range(0, len(new_soe_jobs), 10):
            batch = new_soe_jobs[i:i+10]
            val_strs = []
            for j in batch:
                val_strs.append(f"('{clean_sql_str(j[0])}', '{clean_sql_str(j[1])}', '{clean_sql_str(j[2])}', '{clean_sql_str(j[3])}', '{clean_sql_str(j[4])}', '{clean_sql_str(j[5])}', '{clean_sql_str(j[6])}', '', '{clean_sql_str(j[7])}', '{clean_sql_str(j[8])}', '', 'active', '{clean_sql_str(j[9])}', 1, '{clean_sql_str(j[10])}', 'soe', '{clean_sql_str(j[11])}')")
            sql_lines.append("INSERT OR IGNORE INTO job_referrals (id, company_name, industry, recruitment_type, job_categories, cities, job_title, referral_code, apply_url, publish_time, deadline, status, highlights, is_official_sync, dedup_hash, channel_type, soe_type) VALUES\n" + ",\n".join(val_strs) + ";\n")

    if new_referrals:
        sql_lines.append('-- 3. 新增官方内推 (referral)')
        for i in range(0, len(new_referrals), 10):
            batch = new_referrals[i:i+10]
            val_strs = []
            for j in batch:
                val_strs.append(f"('{clean_sql_str(j[0])}', '{clean_sql_str(j[1])}', '{clean_sql_str(j[2])}', '{clean_sql_str(j[3])}', '{clean_sql_str(j[4])}', '{clean_sql_str(j[5])}', '{clean_sql_str(j[6])}', '{clean_sql_str(j[7])}', '{clean_sql_str(j[8])}', '{clean_sql_str(j[9])}', '{clean_sql_str(j[10])}', 'active', '{clean_sql_str(j[11])}', 1, '{clean_sql_str(j[12])}', 'referral', '')")
            sql_lines.append("INSERT OR IGNORE INTO job_referrals (id, company_name, industry, recruitment_type, job_categories, cities, job_title, referral_code, apply_url, publish_time, deadline, status, highlights, is_official_sync, dedup_hash, channel_type, soe_type) VALUES\n" + ",\n".join(val_strs) + ";\n")

    if new_experiences:
        sql_lines.append('-- 4. 新增面经复盘 (interview_experiences)')
        for i in range(0, len(new_experiences), 1):
            batch = new_experiences[i:i+1]
            val_strs = []
            for e in batch:
                val_strs.append(f"('{clean_sql_str(e[0])}', '{clean_sql_str(e[1])}', '{clean_sql_str(e[2])}', '{clean_sql_str(e[3])}', '{clean_sql_str(e[4])}', '{clean_sql_str(e[5])}', '{clean_sql_str(e[6])}', '{clean_sql_str(e[7])}', {e[8]}, 'smartsheet', '{clean_sql_str(e[9])}')")
            sql_lines.append("INSERT OR IGNORE INTO interview_experiences (id, title, company_name, position_type, round_tag, question_type, summary, detail_content, points_required, source_platform, source_url) VALUES\n" + ",\n".join(val_strs) + ";\n")

    if new_resources:
        sql_lines.append('-- 5. 新增资料资源 (resource_materials)')
        for i in range(0, len(new_resources), 10):
            batch = new_resources[i:i+10]
            val_strs = []
            for r in batch:
                val_strs.append(f"('{clean_sql_str(r[0])}', '{clean_sql_str(r[1])}', '{clean_sql_str(r[2])}', '{clean_sql_str(r[3])}', '{clean_sql_str(r[4])}', '{clean_sql_str(r[5])}', '{clean_sql_str(r[6])}', {r[7]})")
            sql_lines.append("INSERT OR IGNORE INTO resource_materials (id, title, category, description, file_format, drive_url, access_code, points_required) VALUES\n" + ",\n".join(val_strs) + ";\n")

    with open(sql_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines))

    print(f'[Done] Successfully generated migration: {sql_path}')
    print(f'Total mutations generated. Summary:')
    print(f'  - Referral Updates: {len(updated_referrals)}')
    print(f'  - New Enterprise Jobs: {len(new_enterprise_jobs)}')
    print(f'  - New SOE Jobs: {len(new_soe_jobs)}')
    print(f'  - New Referrals: {len(new_referrals)}')
    print(f'  - New Experiences: {len(new_experiences)}')
    print(f'  - New Resources: {len(new_resources)}')

if __name__ == '__main__':
    main()
