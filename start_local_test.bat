@echo off
chcp 65001 >nul
echo ===================================================
echo   校招招聘平台 - 启动本地独立测试环境
echo ===================================================
cd /d "%~dp0frontend"
echo [1/2] 检查本地 D1 测试数据库...
call npx wrangler d1 migrations apply zhaopin-platform-db --local

echo.
echo [2/2] 正在启动全栈开发测试服务器 (Vite + 本地 D1)...
echo ===================================================
echo 测试地址: http://localhost:5173
echo 请在浏览器中打开上方网址进行测试验证。
echo 按 Ctrl+C 可停止服务器。
echo ===================================================
call npm run dev
