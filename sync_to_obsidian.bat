@echo off
chcp 65001 >nul
set "SRC=%~dp0docs\校招招聘平台全栈开发与多维表格数据同步全景文档.md"
set "DEST=D:\知识库\校招招聘平台全栈开发与多维表格数据同步全景文档.md"

echo [Obsidian 同步助手] 正在同步开发文档到本地 Obsidian 知识库...
if exist "%SRC%" (
    copy /Y "%SRC%" "%DEST%" >nul
    if %errorlevel% equ 0 (
        echo [成功] 文档已同步至: %DEST%
    ) else (
        echo [错误] 复制文件失败，请检查路径权限。
    )
) else (
    echo [错误] 未找到源文档: %SRC%
)
pause
