@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

title HAR Data Auto-Sync (Unattended Mode)
echo ================================================================
echo   Campus Recruitment Platform - Unattended Auto Sync ^(No Pause^)
echo   %date% %time%
echo ================================================================
echo.

set "SCRIPT_DIR=%~dp0"
set "SEEDS_DIR=%SCRIPT_DIR%seeds"
set "FRONTEND_DIR=%SCRIPT_DIR%frontend"
set "LOGS_DIR=%SCRIPT_DIR%logs"
set "USER_DOWNLOADS=%USERPROFILE%\Downloads\docs.qq.com.har"

set "WRANGLER_HOME=%FRONTEND_DIR%\.wrangler-home"
set "XDG_CONFIG_HOME=%FRONTEND_DIR%\.wrangler-home"

if not exist "%LOGS_DIR%" mkdir "%LOGS_DIR%"

rem ---------- [Step 0/4] Headless browser auto-crawl (with test hook for failure simulation) ----------
echo [Step 0/4] Launching headless browser crawler...
if /i "%FORCE_CRAWLER_FAIL%"=="1" (
    echo [Test Hook] FORCE_CRAWLER_FAIL=1 detected - simulating crawl failure for degradation drill...
    set "CRAWL_OK=0"
) else (
    node "%FRONTEND_DIR%\scripts\crawler_smartsheet\headless_har_crawler.mjs"
    if !ERRORLEVEL! EQU 0 (set "CRAWL_OK=1") else (set "CRAWL_OK=0")
)

if "!CRAWL_OK!"=="1" (
    echo [Success] Auto-crawl OK, HAR refreshed at %SEEDS_DIR%\docs.qq.com.har
    goto :parse_data
) else (
    echo [Warning] Auto-crawl FAILED - falling back to manual HAR channel...
)

rem ---------- [Fallback] Manual HAR channel: prefer fresh HAR in Downloads, else keep existing ----------
if exist "%USER_DOWNLOADS%" (
    echo Found manual HAR in Downloads, copying to seeds...
    copy /y "%USER_DOWNLOADS%" "%SEEDS_DIR%\docs.qq.com.har" >nul
)

if exist "%SEEDS_DIR%\docs.qq.com.har" (
    for %%A in ("%SEEDS_DIR%\docs.qq.com.har") do echo [Info] Using HAR last modified: %%~tA
    rem [Staleness guard] HAR older than 7 days means site data may be outdated
    powershell -NoProfile -Command "if (((Get-Date) - (Get-Item '%SEEDS_DIR%\docs.qq.com.har').LastWriteTime) -gt (New-TimeSpan -Days 7)) { Write-Host '[Warning] HAR data older than 7 days - deployed data may be stale.' }"
) else (
    echo [Error] No HAR available in Downloads or seeds/. Aborting.
    exit /b 1
)

rem ---------- [Step 2/4] Incremental parse + dedup (exit code 2 = no new data, skip DB update) ----------
:parse_data
echo.
echo [Step 2/4] Parsing all subtabs and deduplicating data...
python "%FRONTEND_DIR%\scripts\parse_and_merge_all_har_tabs.py"
set "PY_STATUS=%ERRORLEVEL%"

if %PY_STATUS% EQU 2 (
    echo.
    echo ================================================================
    echo [Notice] All records in HAR already exist in the database.
    echo No duplicate migration needed. Skipping DB update.
    echo ================================================================
    goto :build_and_deploy
)

if %PY_STATUS% NEQ 0 (
    echo.
    echo [Error] Python parser failed with code %PY_STATUS%. Pipeline aborted.
    exit /b %PY_STATUS%
)

rem ---------- [Step 3/4] Apply migrations to D1 (local + remote) ----------
echo.
echo [Step 3/4] Applying migrations to D1 databases...
cd /d "%FRONTEND_DIR%"
echo Applying to local database...
call npx wrangler d1 migrations apply zhaopin-platform-db --local
if errorlevel 1 (
    echo [Error] Local D1 migration failed. Pipeline aborted.
    exit /b 1
)
echo Applying to remote Cloudflare database...
echo y | call npx wrangler d1 migrations apply zhaopin-platform-db --remote
if errorlevel 1 (
    echo [Error] Remote D1 migration failed. Pipeline aborted.
    exit /b 1
)

rem ---------- [Step 4/4] Build + deploy (unattended: no interactive login) ----------
:build_and_deploy
echo.
echo [Step 4/4] Building frontend and deploying to Cloudflare...
cd /d "%FRONTEND_DIR%"
call npm run build
if errorlevel 1 (
    echo [Error] npm run build failed. Pipeline aborted.
    exit /b 1
)

echo Deploying Worker...
call npx wrangler deploy
if errorlevel 1 (
    echo [Error] wrangler deploy failed ^(possibly expired auth^).
    echo [Hint] Run update_and_deploy_har.bat interactively once to complete npx wrangler login, then re-run.
    exit /b 1
)

echo.
echo ================================================================
echo [Success] Unattended auto-sync pipeline complete^!
echo Website: https://zhaopin.qujin.vip/
echo ================================================================
exit /b 0
