@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

title 校招招聘平台 - 部署上线
echo ===================================================
echo   校招招聘平台 - 生产环境构建与部署
echo ===================================================

cd /d "%~dp0frontend"

set "WRANGLER_HOME=%~dp0frontend\.wrangler-home"
set "XDG_CONFIG_HOME=%~dp0frontend\.wrangler-home"

echo.
echo [1/3] 正在编译前端生产静态资源...
call npm run build
if errorlevel 1 goto :build_fail

echo.
echo [2/3] 正在应用远程 D1 数据库迁移...
echo y | call npx wrangler d1 migrations apply zhaopin-platform-db --remote
if errorlevel 1 goto :need_login_migration

:deploy_worker
echo.
echo [3/3] 正在部署到 Cloudflare Pages/Worker (zhaopin.qujin.vip)...
call npx wrangler deploy
if errorlevel 1 goto :need_login

goto :deploy_success

:need_login_migration
echo.
echo ===================================================
echo [提示] 数据库迁移遇到权限校验，正在为您调起 Cloudflare 浏览器登录...
echo 请在弹出的网页中点击「Allow」允许授权。
echo ===================================================
echo.
call npx wrangler login
echo.
echo [重新尝试应用远程迁移...]
echo y | call npx wrangler d1 migrations apply zhaopin-platform-db --remote
if errorlevel 1 goto :deploy_fail
goto :deploy_worker

:need_login
echo.
echo ===================================================
echo [提示] 部署遇到权限校验，正在为您调起 Cloudflare 浏览器登录...
echo 请在弹出的网页中点击「Allow」允许授权。
echo ===================================================
echo.
call npx wrangler login
echo.
echo [重新尝试部署...]
call npx wrangler deploy
if errorlevel 1 goto :deploy_fail
goto :deploy_success

:deploy_success
echo.
echo ===================================================
echo [成功] 最新数据库结构与代码已成功发布上线！
echo 线上访问地址: https://zhaopin.qujin.vip/
echo ===================================================
pause
exit /b 0

:build_fail
echo.
echo [错误] 前端编译失败，请检查报错。
pause
exit /b 1

:deploy_fail
echo.
echo [错误] 部署未成功，请检查网络或账号权限。
pause
exit /b 1