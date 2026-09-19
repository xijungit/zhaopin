import os
import sys
import json
import zlib
import base64
import re
import hashlib
import datetime
import urllib.parse

sys.stdout.reconfigure(encoding='utf-8')

def b64zlib(b64str):
    pad = (4 - len(b64str) % 4) % 4
    return json.loads(zlib.decompress(base64.b64decode(b64str + '=' * pad)).decode('utf-8'))

def clean_url(u):
    if not u:
        return ''
    u = str(u).strip().replace('\r', '').replace('\n', '')
    
    # Check if there is an embedded http/https
    m_http = re.search(r'https?://[^\s\xa0<>"\'\)\]]+', u)
    if m_http:
        u = m_http.group(0)

    if 'docs.qq.com/scenario/link.html' in u or 'link-warning' in u:
        m = re.search(r'[?&](?:url|target)=([^&]+)', u)
        if m:
            try:
                u = urllib.parse.unquote(m.group(1)).strip()
            except:
                pass

    if '@' in u and ('hr@' in u or 'mail' in u):
        m_email = re.search(r'([a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+)', u)
        if m_email:
            return f'mailto:{m_email.group(1)}'

    if not u.startswith('http://') and not u.startswith('https://') and not u.startswith('mailto:'):
        if re.search(r'[\w\-]+\.[a-zA-Z]{2,}', u):
            u = 'https://' + u
        else:
            return ''
    return u

def get_cell_text(cell):
    if not cell or not isinstance(cell, dict):
        return ''
    if 'k1' in cell and isinstance(cell['k1'], list):
        return ''.join(s.get('k2', '') for s in cell['k1'] if isinstance(s, dict)).strip()
    if 'k2' in cell and isinstance(cell['k2'], str):
        return cell['k2'].strip()
    return ''

def get_cell_url(cell):
    if not cell or not isinstance(cell, dict):
        return ''
    if 'k8' in cell and isinstance(cell['k8'], list) and cell['k8']:
        u = cell['k8'][0].get('k3') or cell['k8'][0].get('k2') or ''
        cleaned = clean_url(u)
        if cleaned:
            return cleaned
    if 'k1' in cell and isinstance(cell['k1'], list):
        for part in cell['k1']:
            if isinstance(part, dict) and part.get('k1') == 'url':
                u = part.get('k3') or part.get('k2') or ''
                cleaned = clean_url(u)
                if cleaned:
                    return cleaned
    txt = get_cell_text(cell)
    m = re.search(r'https?://[^\s\xa0<>"\'\)\]]+', txt)
    if m:
        cleaned = clean_url(m.group(0))
        if cleaned:
            return cleaned
    if '邮箱' in txt and '@' in txt:
        m_email = re.search(r'([a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+)', txt)
        if m_email:
            return f'mailto:{m_email.group(1)}'
    return ''

def parse_cities(city_str):
    if not city_str:
        return ['全国']
    tokens = re.split(r'[,，、/|\s;]+', city_str.replace('等', '').strip())
    tokens = [t.strip() for t in tokens if t.strip() and t.strip() != '...']
    return tokens if tokens else ['全国']

def parse_job_categories(job_str):
    if not job_str:
        return ['综合类']
    tokens = re.split(r'[,，、/|\s;]+', job_str.strip())
    tokens = [t.strip() for t in tokens if t.strip() and t.strip() != '...' and '共' not in t]
    return tokens if tokens else ['综合类']

def parse_timestamp(val):
    if not val:
        return '2026-09-19T08:00:00.000Z'
    try:
        ts = int(val)
        if ts > 1000000000000:
            ts = ts / 1000
        return datetime.datetime.fromtimestamp(ts, tz=datetime.timezone.utc).strftime('%Y-%m-%dT%H:%M:%S.000Z')
    except:
        return '2026-09-19T08:00:00.000Z'

def generate_dedup_hash(comp, rec_type, title, url):
    raw = f"{comp.strip()}_{rec_type.strip()}_{title.strip()}_{url.strip()}"
    return hashlib.sha256(raw.encode('utf-8')).hexdigest()[:32]

def clean_sql_val(val):
    if val is None:
        return ''
    return str(val).replace("'", "''").strip()

def main():
    root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '../..'))
    seeds_dir = os.path.join(root_dir, 'seeds')
    har_path = os.path.join(seeds_dir, 'docs.qq.com.har')

    if not os.path.exists(har_path):
        print(f'[Error] HAR file not found: {har_path}')
        sys.exit(1)

    print(f'[HAR Parser] Reading {har_path} ({os.path.getsize(har_path) / 1024 / 1024:.2f} MB)...')
    with open(har_path, 'r', encoding='utf-8', errors='ignore') as f:
        har = json.load(f)

    bb_chunks = []
    row_order = []
    for e in har.get('log', {}).get('entries', []):
        url = e.get('request', {}).get('url', '')
        if 'BB08J2' in url and 'dop-api' in url:
            c = e.get('response', {}).get('content', {})
            t = c.get('text', '')
            if not t:
                continue
            if c.get('encoding') == 'base64':
                t = base64.b64decode(t).decode('utf-8', errors='ignore')
            try:
                sb64 = json.loads(t)['data']['initialAttributedText']['text'][0]['smartsheet']
                decomp = b64zlib(sb64)
                bb_chunks.append(decomp)
                if not row_order:
                    k4 = decomp[0][0].get('c', {}).get('k3', {}).get('k4', [])
                    if k4 and isinstance(k4[0], dict) and 'k1' in k4[0] and 'k1' in k4[0]['k1']:
                        row_order = k4[0]['k1']['k1']
            except Exception as err:
                pass

    print(f'[HAR Parser] Loaded {len(bb_chunks)} chunks for BB08J2. Row order count: {len(row_order)}')

    opt_maps = {}
    for chunk in bb_chunks:
        for it in chunk[0]:
            k3 = it.get('c', {}).get('k3', {})
            if isinstance(k3, dict) and 'k3' in k3:
                for fid, fdef in k3['k3'].items():
                    if 'k9' in fdef and isinstance(fdef['k9'], dict) and 'k3' in fdef['k9']:
                        opt_maps[fid] = {}
                        for opt in fdef['k9']['k3']:
                            opt_maps[fid][opt.get('k1')] = opt.get('k2', '')

    records = {}
    for chunk in bb_chunks:
        for it in chunk[0]:
            c = it.get('c', {})
            k2 = c.get('k2', {})
            if isinstance(k2, dict) and 'k1' in k2:
                records.update(k2['k1'])

    print(f'[HAR Parser] Total records in data dict: {len(records)}')

    rids = row_order if len(row_order) >= len(records) else list(records.keys())

    parsed_jobs = []
    job_idx = 0
    for rid in rids:
        rdata = records.get(rid, {})
        row = rdata.get('k1', {})
        comp = get_cell_text(row.get('funVyx', {}))
        if not comp:
            continue

        # Skip banner separator rows
        if any(b in comp for b in ['重点企业', '往届校招', '近期新增']):
            continue

        url = get_cell_url(row.get('fZ0o0K', {}))
        if not url:
            url = get_cell_url(row.get('fU8LKa', {}))

        # If no valid URL, skip non-job rows
        if not url:
            continue

        job_idx += 1

        # Industry
        ind_cell = row.get('fLAqex', {})
        ind = []
        if 'k9' in ind_cell and isinstance(ind_cell['k9'], list):
            ind = [opt_maps.get('fLAqex', {}).get(oid, '') for oid in ind_cell['k9']]
        industry = '/'.join(filter(None, ind)) or '互联网/科技'

        # Recruitment Type
        rec_cell = row.get('f8ZqLG', {})
        rec = []
        if 'k9' in rec_cell and isinstance(rec_cell['k9'], list):
            rec = [opt_maps.get('f8ZqLG', {}).get(oid, '') for oid in rec_cell['k9']]
        rec_type = '/'.join(filter(None, rec)) or '27届秋招'

        jobs = get_cell_text(row.get('fi1tV0', {}))
        cities_txt = get_cell_text(row.get('fJQ64O', {}))
        cities = parse_cities(cities_txt)
        job_categories = parse_job_categories(jobs)

        code = get_cell_text(row.get('fdsuyd', {}))
        deadline = get_cell_text(row.get('fdkAD7', {})) or '招满即止'
        time_k4 = row.get('frFn6O', {}).get('k4')
        publish_time = parse_timestamp(time_k4)
        highlights = get_cell_text(row.get('fU8LKa', {}))

        job_title = jobs if jobs else f'{comp}校园招聘'
        dedup_hash = generate_dedup_hash(comp, rec_type, job_title, url)
        job_id = f'smartsheet_{job_idx:04d}_{dedup_hash[:8]}'

        parsed_jobs.append({
            'id': job_id,
            'source_rid': rid,
            'company_name': comp,
            'industry': industry,
            'recruitment_type': rec_type,
            'job_categories': job_categories,
            'cities': cities,
            'job_title': job_title,
            'referral_code': code,
            'apply_url': url,
            'publish_time': publish_time,
            'deadline': deadline,
            'status': 'active',
            'highlights': highlights[:500] if highlights else '',
            'is_official_sync': 1,
            'dedup_hash': dedup_hash
        })

    print(f'[HAR Parser] Successfully extracted {len(parsed_jobs)} verified enterprise jobs.')

    out_json = os.path.join(seeds_dir, 'smartsheet_real_jobs.json')
    with open(out_json, 'w', encoding='utf-8') as f:
        json.dump(parsed_jobs, f, ensure_ascii=False, indent=2)
    print(f'[HAR Parser] Saved to {out_json}')

    out_321 = os.path.join(seeds_dir, 'smartsheet_321_real_jobs.json')
    with open(out_321, 'w', encoding='utf-8') as f:
        json.dump(parsed_jobs, f, ensure_ascii=False, indent=2)
    print(f'[HAR Parser] Saved backup to {out_321}')

    # Generate 0010 Migration SQL
    migrations_dir = os.path.join(root_dir, 'frontend/migrations')
    sql_path = os.path.join(migrations_dir, '0010_import_real_smartsheet_321_referrals.sql')

    sql_lines = [
        '-- 1. 全面清理历史测试假数据与旧截断/mock占位数据 (包括 pid=1001 虚构链接等)',
        "DELETE FROM job_referrals WHERE id LIKE 'job_%' OR id LIKE 'smartsheet_%' OR apply_url LIKE '%pid=1001%';",
        '',
        f'-- 2. 全量导入腾讯文档多维表格真实内推数据 (共 {len(parsed_jobs)} 条真实企业岗位)',
    ]

    for j in parsed_jobs:
        c_name = clean_sql_val(j['company_name'])
        ind = clean_sql_val(j['industry'])
        r_type = clean_sql_val(j['recruitment_type'])
        cats = clean_sql_val(json.dumps(j['job_categories'], ensure_ascii=False))
        cities = clean_sql_val(json.dumps(j['cities'], ensure_ascii=False))
        title = clean_sql_val(j['job_title'])
        code = clean_sql_val(j['referral_code'])
        apply = clean_sql_val(j['apply_url'])
        pub_t = clean_sql_val(j['publish_time'])
        dline = clean_sql_val(j['deadline'])
        hl = clean_sql_val(j['highlights'])
        d_hash = clean_sql_val(j['dedup_hash'])
        jid = clean_sql_val(j['id'])

        stmt = f"""INSERT INTO job_referrals (
  id, company_name, industry, recruitment_type, job_categories, cities,
  job_title, referral_code, apply_url, publish_time, deadline, status,
  highlights, is_official_sync, dedup_hash, updated_at
) VALUES (
  '{jid}', '{c_name}', '{ind}', '{r_type}', '{cats}', '{cities}',
  '{title}', '{code}', '{apply}', '{pub_t}', '{dline}', 'active',
  '{hl}', 1, '{d_hash}', CURRENT_TIMESTAMP
) ON CONFLICT(dedup_hash) DO UPDATE SET
  company_name = excluded.company_name,
  industry = excluded.industry,
  recruitment_type = excluded.recruitment_type,
  job_categories = excluded.job_categories,
  cities = excluded.cities,
  job_title = excluded.job_title,
  referral_code = excluded.referral_code,
  apply_url = excluded.apply_url,
  highlights = excluded.highlights,
  status = 'active',
  updated_at = CURRENT_TIMESTAMP;"""
        sql_lines.append(stmt)

    with open(sql_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines) + '\n')

    print(f'[HAR Parser] Generated Migration SQL at: {sql_path} (Statements: {len(parsed_jobs)})')

    targets = ['智元机器人', '腾讯', '沐曦股份', '大疆', '阿里巴巴', '美团', '字节跳动', '百度']
    print('[HAR Parser] Key target company check:')
    for t in targets:
        m = [j for j in parsed_jobs if t in j['company_name']]
        if m:
            for it in m:
                print(f"  ✓ {it['company_name']} | {it['job_title'][:30]} | Code: {it['referral_code']} | URL: {it['apply_url'][:70]}")
        else:
            print(f'  ✗ [MISSING] {t}')

if __name__ == '__main__':
    main()
