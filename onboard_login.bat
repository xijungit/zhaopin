@echo off
chcp 65001 >nul
setlocal

title Smartsheet Login Onboarding (Save Cookie)
echo ================================================================
echo   Tencent Smartsheet - Login Onboarding (one-time operation)
echo   A visible browser window will pop up. If it shows "document does not exist",
echo   complete the login in the window. The script auto-saves the cookie when
echo   it detects the data API is active.
echo ================================================================
cd /d "%~dp0"
node "frontend\scripts\crawler_smartsheet\headless_har_crawler.mjs" --onboard
echo.
pause
