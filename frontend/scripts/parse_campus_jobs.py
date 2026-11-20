import os
import sys
import re
import hashlib
import datetime
import openpyxl

sys.stdout.reconfigure(encoding='utf-8')

def clean_sql_str(val):
    if val is None:
        return ''
    return str(val).replace("'", "''").strip()

def parse_cities(city_str):
    if not city_str:
        return '["全国"]'
    tokens = re.split(r'[,，、/|\s;]+', str(city_str).replace('等', '').strip())
    tokens = [t.strip() for t in tokens if t.strip() and t.strip() != '...']
    # If too many cities (e.g. 30+), keep top 10 plus 全国
    if len(tokens) > 10:
        tokens = tokens[:10]
        if '全国' not in tokens:
            tokens.append('全国')
    if not tokens:
        tokens = ['全国']
    import json
    return json.dumps(tokens, ensure_ascii=False)

def parse_categories(pos_str):
    if not pos_str:
        return '["综合类"]'
    tokens = re.split(r'[,，、/|\s;]+', str(pos_str).strip())
    tokens = [t.strip() for t in tokens if t.strip() and t.strip() != '...' and '详见' not in t and '请见' not in t]
    if len(tokens) > 6:
        tokens = tokens[:6]
    if not tokens:
        tokens = ['综合类']
    import json
    return json.dumps(tokens, ensure_ascii=False)

def infer_industry(prop, comp, pos):
    text = (str(prop) + ' ' + str(comp) + ' ' + str(pos)).lower()
    if any(k in text for k in ['互联网', '电商', '游戏', '字节', '腾讯', '阿里', '快手', '美团']):
        return '互联网/科技'
    if any(k in text for k in ['芯片', '半导体', '集成电路', '硬件', '电子']):
        return '电子/半导体'
    if any(k in text for k in ['新能源', '电池', '光伏', '风电', '电网', '电力', '能源', '华能', '华电']):
        return '新能源/电力'
    if any(k in text for k in ['汽车', '车企', '理想', '蔚来', '小鹏', '比亚迪', '吉利']):
        return '汽车/出行'
    if any(k in text for k in ['药', '生物', '医疗', '器械', '健康', '医学']):
        return '生物医药'
    if any(k in text for k in ['银行', '证券', '基金', '金融', '保险', '信托']):
        return '金融/银行'
    if any(k in text for k in ['机械', '装备', '制造', '重工', '机器人', '自动化']):
        return '高端制造'
    if any(k in text for k in ['建筑', '地产', '设计', '规划', '土木', '中建']):
        return '建筑/工程'
    if any(k in text for k in ['快消', '消费', '零售', '食品', '饮料', '粮油']):
        return '消费品/零售'
    if any(k in text for k in ['通信', '移动', '联通', '电信', '铁塔']):
        return '通信网络'
    if any(k in text for k in ['科研', '院所', '大学', '高校', '教育']):
        return '科教文卫'
    first_prop = str(prop).split('\n')[0].strip()
    return first_prop if first_prop and len(first_prop) <= 12 else '综合行业'

def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    root_dir = os.path.abspath(os.path.join(script_dir, '../..'))
    excel_path = r'D:\download\国际人2027届校招（包含暑期实习）.xlsx'
    
    if not os.path.exists(excel_path):
        print(f"[Error] Excel file not found: {excel_path}")
        return

    print(f"[Parser] Loading {excel_path}...")
    wb = openpyxl.load_workbook(excel_path, data_only=True)
    sheet = wb['2027']
    rows = list(sheet.iter_rows(values_only=True))

    sql_path = os.path.join(root_dir, 'frontend/migrations/0012_import_enterprise_and_soe_jobs.sql')
    print(f"[Parser] Generating migration SQL -> {sql_path}")

    # We will write in chunks of 50 for performance and SQLite statement limits
    statements = []
    statements.append("-- 0012_import_enterprise_and_soe_jobs.sql")
    statements.append("-- 全量同步企业校招 (enterprise) 与央国企校招 (soe) 真实数据\n")
    
    # Clean old imported enterprise/soe data if any, preserve referral
    statements.append("DELETE FROM job_referrals WHERE channel_type IN ('enterprise', 'soe');\n")

    current_batch = []
    batch_size = 50
    total_parsed = 0
    soe_count = 0
    ent_count = 0

    seen_hashes = set()

    for idx, r in enumerate(rows[1:], 1):
        comp = str(r[0] or '').strip()
        url = str(r[1] or '').strip()
        title = str(r[2] or '').strip()
        pos = str(r[3] or '').strip()
        city_raw = str(r[4] or '').strip()
        prop_raw = str(r[5] or '').strip()
        start_date = r[6]
        end_mode = r[7]
        end_date = r[8] if len(r) > 8 else None

        if not comp or not url or url.startswith('#') or len(url) < 8:
            continue

        # Clean URL
        if 'docs.qq.com/scenario/link.html' in url:
            m = re.search(r'[?&](?:url|target)=([^&]+)', url)
            if m:
                import urllib.parse
                try: url = urllib.parse.unquote(m.group(1)).strip()
                except: pass

        # Determine if SOE
        is_soe = any(k in prop_raw or k in comp for k in ['国企', '央企', '事业单位', '电网', '银行', '移动', '电信', '联通', '中车', '航天', '航空', '石化', '石油', '烟草', '院所'])
        if is_soe:
            channel_type = 'soe'
            st = '国企'
            if '央企' in prop_raw or '中国' in comp:
                st = '央企'
            elif '事业单位' in prop_raw or '院所' in comp or '学校' in prop_raw:
                st = '事业单位'
            elif '银行' in prop_raw or '金融' in prop_raw:
                st = '银行金融'
            soe_type = st
            soe_count += 1
            item_id = f"soe_{idx:05d}_{hashlib.sha256((comp + title).encode('utf-8')).hexdigest()[:8]}"
        else:
            channel_type = 'enterprise'
            soe_type = ''
            ent_count += 1
            item_id = f"ent_{idx:05d}_{hashlib.sha256((comp + title).encode('utf-8')).hexdigest()[:8]}"

        dedup_raw = f"{comp}_{title}_{channel_type}_{url}"
        dedup_hash = hashlib.sha256(dedup_raw.encode('utf-8')).hexdigest()[:32]
        if dedup_hash in seen_hashes:
            continue
        seen_hashes.add(dedup_hash)

        industry = infer_industry(prop_raw, comp, pos)
        cities_json = parse_cities(city_raw)
        categories_json = parse_categories(pos)
        
        # Batch recruitment type
        rec_type = '2027校招'
        if '提前批' in title: rec_type = '2027提前批'
        elif '秋招' in title: rec_type = '2027秋招'
        elif '春招' in title or '2026' in title: rec_type = '2026春招'
        elif '实习' in title: rec_type = '暑期实习'

        # Dates
        pub_time = '2026-09-15T00:00:00.000Z'
        if isinstance(start_date, datetime.datetime):
            pub_time = start_date.strftime('%Y-%m-%dT00:00:00.000Z')
        elif isinstance(start_date, str) and len(start_date) >= 8:
            pub_time = start_date[:10] + 'T00:00:00.000Z'

        deadline_val = ''
        if isinstance(end_date, datetime.datetime):
            deadline_val = end_date.strftime('%Y-%m-%dT23:59:59.000Z')
        elif end_mode:
            deadline_val = str(end_mode).strip()

        highlights = f"【{comp}】官方正式招录。招聘岗位：{pos[:200]}。工作地点覆盖{city_raw[:80]}。"
        if prop_raw:
            highlights += f" 企业性质：{prop_raw.replace(chr(10), ' ')}。"

        row_sql = (
            f"('{clean_sql_str(item_id)}', '{clean_sql_str(comp)}', '{clean_sql_str(industry)}', "
            f"'{clean_sql_str(rec_type)}', '{clean_sql_str(categories_json)}', '{clean_sql_str(cities_json)}', "
            f"'{clean_sql_str(title)}', '', '{clean_sql_str(url)}', '{clean_sql_str(pub_time)}', "
            f"'{clean_sql_str(deadline_val)}', 'active', '{clean_sql_str(highlights)}', 1, "
            f"'{clean_sql_str(dedup_hash)}', '{clean_sql_str(channel_type)}', '{clean_sql_str(soe_type)}')"
        )
        current_batch.append(row_sql)
        total_parsed += 1

        if len(current_batch) >= batch_size:
            val_clause = ",\n".join(current_batch)
            stmt = (
                f"INSERT INTO job_referrals (id, company_name, industry, recruitment_type, job_categories, "
                f"cities, job_title, referral_code, apply_url, publish_time, deadline, status, highlights, "
                f"is_official_sync, dedup_hash, channel_type, soe_type)\nVALUES\n{val_clause}\n"
                f"ON CONFLICT(dedup_hash) DO UPDATE SET apply_url=excluded.apply_url, status=excluded.status;\n"
            )
            statements.append(stmt)
            current_batch = []

    if current_batch:
        val_clause = ",\n".join(current_batch)
        stmt = (
            f"INSERT INTO job_referrals (id, company_name, industry, recruitment_type, job_categories, "
            f"cities, job_title, referral_code, apply_url, publish_time, deadline, status, highlights, "
            f"is_official_sync, dedup_hash, channel_type, soe_type)\nVALUES\n{val_clause}\n"
            f"ON CONFLICT(dedup_hash) DO UPDATE SET apply_url=excluded.apply_url, status=excluded.status;\n"
        )
        statements.append(stmt)

    with open(sql_path, 'w', encoding='utf-8') as f:
        f.write("\n".join(statements))

    print(f"[Parser] Complete! Total processed: {total_parsed}")
    print(f"  - 企业校招 (enterprise): {ent_count} 条")
    print(f"  - 央国企校招 (soe): {soe_count} 条")
    print(f"  - SQL migration size: {os.path.getsize(sql_path) / 1024 / 1024:.2f} MB")

if __name__ == '__main__':
    main()
