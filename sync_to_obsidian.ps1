# PowerShell Obsidian Sync Helper
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$docsDir = Join-Path $scriptDir "docs"
$destDir = "D:\\知识库"

if (-not (Test-Path $docsDir)) {
    Write-Host "[错误] 未找到文档目录: $docsDir" -ForegroundColor Red
    exit 1
}

$files = Get-ChildItem -Path $docsDir -Filter "*.md"
if ($files.Count -eq 0) {
    Write-Host "[错误] 在 $docsDir 未找到 .md 文档" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $destDir)) {
    New-Item -ItemType Directory -Path $destDir -Force | Out-Null
}

foreach ($f in $files) {
    $target = Join-Path $destDir $f.Name
    try {
        Copy-Item -Path $f.FullName -Destination $target -Force
        Write-Host ("[成功] 已同步至 Obsidian: " + $target) -ForegroundColor Green
    } catch {
        Write-Host ("[错误] 复制失败: " + $_.Exception.Message) -ForegroundColor Red
    }
}
Write-Host "全部同步完成！" -ForegroundColor Cyan
