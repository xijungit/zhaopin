@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

title HAR Data Sync and Cloudflare Deploy
echo ================================================================
echo   Campus Recruitment Platform - 1-Click HAR Update ^& Deploy
echo ================================================================
echo.

set "SCRIPT_DIR=%~dp0"
set "SEEDS_DIR=%SCRIPT_DIR%seeds"
set "FRONTEND_DIR=%SCRIPT_DIR%frontend"
set "USER_DOWNLOADS=%USERPROFILE%\Downloads\docs.qq.com.har"

set "WRANGLER_HOME=%FRONTEND_DIR%\.wrangler-home"
set "XDG_CONFIG_HOME=%FRONTEND_DIR%\.wrangler-home"

echo [Step 1/4] Checking HAR file...
if exist "%USER_DOWNLOADS%" (
    echo Found latest HAR in Downloads folder: %USER_DOWNLOADS%
    echo Copying to seeds/docs.qq.com.har...
    copy /y "%USER_DOWNLOADS%" "%SEEDS_DIR%\docs.qq.com.har" >nul
    echo Copied successfully.
) else if exist "%SEEDS_DIR%\docs.qq.com.har" (
    echo Using existing HAR file in seeds/docs.qq.com.har.
) else (
    echo [Error] docs.qq.com.har not found in Downloads or seeds/
    pause
    exit /b 1
)

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
    echo [Error] Python script failed with code %PY_STATUS%.
    pause
    exit /b %PY_STATUS%
)

echo.
echo [Step 3/4] Applying migrations to D1 databases...
cd /d "%FRONTEND_DIR%"
echo Applying to local database...
call npx wrangler d1 migrations apply zhaopin-platform-db --local
echo Applying to remote Cloudflare database...
echo y | call npx wrangler d1 migrations apply zhaopin-platform-db --remote

:build_and_deploy
echo.
echo [Step 4/4] Building frontend and deploying to Cloudflare...
cd /d "%FRONTEND_DIR%"
call npm run build
if errorlevel 1 (
    echo [Error] npm run build failed.
    pause
    exit /b 1
)

echo Deploying Worker...
call npx wrangler deploy
if errorlevel 1 (
    echo [Notice] Authentication required. Opening login...
    call npx wrangler login
    call npx wrangler deploy
)

echo.
echo ================================================================
echo [Success] All data updated and deployed to production!
echo Website: https://zhaopin.qujin.vip/
echo ================================================================
pause
exit /b 0