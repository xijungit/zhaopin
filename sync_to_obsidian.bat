@echo off
chcp 65001 >nul
cd /d "%~dp0"
title Sync Documentation to Obsidian Knowledge Base
echo ================================================================
echo   Sync Documentation to Obsidian Knowledge Base
echo ================================================================
echo.

python "%~dp0sync_to_obsidian.py"
if %errorlevel% equ 0 goto :done

echo.
echo [Notice] Python execution was unavailable or failed.
echo Trying fallback via PowerShell...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0sync_to_obsidian.ps1"

:done
echo.
echo ================================================================
echo Process finished.
echo ================================================================
pause
