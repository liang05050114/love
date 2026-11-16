@echo off
setlocal
set "NODE_DIR=%~dp0tools\node-v22.13.0-win-x64"
set "PATH=%NODE_DIR%;%PATH%"
powershell -NoProfile -Command "try { (Invoke-WebRequest -UseBasicParsing -Uri 'http://localhost:3000/' -TimeoutSec 1).StatusCode | Out-Null; exit 0 } catch { exit 1 }" >nul 2>&1
if "%errorlevel%"=="0" exit /b 0
cd /d "%~dp0carousel-lamp"
call npm run dev
