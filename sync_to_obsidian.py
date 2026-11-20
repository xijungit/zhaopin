# -*- coding: utf-8 -*-
import os
import shutil
import glob
import sys

if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8')

script_dir = os.path.dirname(os.path.abspath(__file__))
docs_dir = os.path.join(script_dir, 'docs')
dest_dir = os.path.join('D:\\', '知识库')

if not os.path.exists(docs_dir):
    print(f'[错误] 未找到文档目录: {docs_dir}')
    sys.exit(1)

md_files = glob.glob(os.path.join(docs_dir, '*.md'))
if not md_files:
    print(f'[错误] 在 {docs_dir} 中未找到任何 .md 文件')
    sys.exit(1)

if not os.path.exists(dest_dir):
    try:
        os.makedirs(dest_dir, exist_ok=True)
    except Exception as e:
        print(f'[错误] 创建目标目录 {dest_dir} 失败: {e}')
        sys.exit(1)

success_count = 0
for src in md_files:
    filename = os.path.basename(src)
    dest = os.path.join(dest_dir, filename)
    try:
        shutil.copy2(src, dest)
        size = os.path.getsize(dest)
        print(f'[成功] 已同步至 Obsidian: {dest} ({size} 字节)')
        success_count += 1
    except Exception as e:
        print(f'[错误] 同步 {filename} 失败: {e}')

if success_count > 0:
    print(f'\n全部完成！成功同步 {success_count} 份核心文档到本地知识库。')
else:
    sys.exit(1)
