@echo off
setlocal
where pwsh.exe >nul 2>nul
if %ERRORLEVEL% equ 0 (
    pwsh -NoProfile -ExecutionPolicy Bypass -File "%~dp0ai-menu.ps1" %*
) else (
    powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0ai-menu.ps1" %*
)
endlocal
