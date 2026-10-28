<#
.SYNOPSIS
    AI Menu Installer - Universal Installer for Windows PowerShell
    Installs 10 AI coding agents, verifies availability, and wires the 'ai' command.
#>

$ErrorActionPreference = "Continue"

Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "      AI CLI Menu - Universal Installer (Windows)   " -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "Configuring interactive terminal menu for 10 AI agents...`n" -ForegroundColor DarkCyan

function Log-Info($msg) { Write-Host "[INFO] $msg" -ForegroundColor Cyan }
function Log-Ok($msg)   { Write-Host "[✓] $msg" -ForegroundColor Green }
function Log-Warn($msg) { Write-Host "[!] $msg" -ForegroundColor Yellow }
function Log-Err($msg)  { Write-Host "[✗] $msg" -ForegroundColor Red }

$InstallDir = "$env:USERPROFILE\.local\bin"
if (-not (Test-Path $InstallDir)) {
    New-Item -ItemType Directory -Path $InstallDir -Force | Out-Null
}

# 1. Antigravity (agy)
Log-Info "Checking Antigravity CLI (agy)..."
if (Get-Command "agy" -ErrorAction SilentlyContinue) {
    Log-Ok "Antigravity CLI is already installed"
} else {
    Log-Warn "Antigravity not found. Installing..."
    try {
        Invoke-RestMethod https://antigravity.google/install.ps1 | Invoke-Expression
    } catch {
        Log-Warn "Could not auto-install Antigravity automatically: $_"
    }
}

# 2. OpenCode (opencode)
Log-Info "Checking OpenCode..."
if (Get-Command "opencode" -ErrorAction SilentlyContinue) {
    Log-Ok "OpenCode is already installed"
} else {
    Log-Warn "OpenCode not found. Installing..."
    try {
        Invoke-RestMethod https://opencode.ai/install.ps1 | Invoke-Expression
    } catch {
        Log-Warn "Could not auto-install OpenCode: $_"
    }
}

# 3. Kiro (kiro-cli)
Log-Info "Checking Kiro CLI..."
if (Get-Command "kiro-cli" -ErrorAction SilentlyContinue -or (Get-Command "kiro" -ErrorAction SilentlyContinue)) {
    Log-Ok "Kiro CLI is already installed"
} else {
    Log-Warn "Kiro CLI not found. Installing..."
    try {
        Invoke-RestMethod https://kiro.dev/install.ps1 | Invoke-Expression
    } catch {
        Log-Warn "Could not auto-install Kiro: $_"
    }
}

# 4. Copilot (copilot)
Log-Info "Checking GitHub Copilot CLI..."
if (Get-Command "copilot" -ErrorAction SilentlyContinue) {
    Log-Ok "GitHub Copilot CLI is already installed"
} else {
    Log-Warn "Copilot not found. Installing..."
    if (Get-Command "winget" -ErrorAction SilentlyContinue) {
        winget install GitHub.Copilot --accept-source-agreements --accept-package-agreements
    } elseif (Get-Command "npm" -ErrorAction SilentlyContinue) {
        npm install -g @github/copilot
    }
}

# 5. FreeBuff (freebuff)
Log-Info "Checking FreeBuff..."
if (Get-Command "freebuff" -ErrorAction SilentlyContinue) {
    Log-Ok "FreeBuff is already installed"
} else {
    Log-Warn "FreeBuff not found. Installing via npm..."
    if (Get-Command "npm" -ErrorAction SilentlyContinue) {
        npm install -g freebuff
    }
}

# 6. Cline (cline)
Log-Info "Checking Cline CLI..."
if (Get-Command "cline" -ErrorAction SilentlyContinue) {
    Log-Ok "Cline CLI is already installed"
} else {
    Log-Warn "Cline not found. Installing via npm..."
    if (Get-Command "npm" -ErrorAction SilentlyContinue) {
        npm install -g cline
    }
}

# 7. Kilo (kilo)
Log-Info "Checking Kilo..."
if (Get-Command "kilo" -ErrorAction SilentlyContinue) {
    Log-Ok "Kilo is already installed"
} else {
    Log-Warn "Kilo not found. Installing..."
    try {
        Invoke-RestMethod https://kilo.ai/cli/install.ps1 | Invoke-Expression
    } catch {
        Log-Warn "Could not auto-install Kilo: $_"
    }
}

# 8. Codex (codex)
Log-Info "Checking Codex CLI..."
if (Get-Command "codex" -ErrorAction SilentlyContinue) {
    Log-Ok "Codex CLI is already installed"
} else {
    Log-Warn "Codex CLI not found. Installing..."
    if (Get-Command "npm" -ErrorAction SilentlyContinue) {
        npm install -g @openai/codex
    }
}

# 9. Qoder (qoder)
Log-Info "Checking Qoder..."
if (Get-Command "qoder" -ErrorAction SilentlyContinue) {
    Log-Ok "Qoder is already installed"
} else {
    Log-Warn "Qoder not found. Installing..."
    try {
        Invoke-RestMethod https://qoder.com/install.ps1 | Invoke-Expression
    } catch {
        Log-Warn "Could not auto-install Qoder: $_"
    }
}

# 10. Letta (letta)
Log-Info "Checking Letta Code..."
if (Get-Command "letta" -ErrorAction SilentlyContinue) {
    Log-Ok "Letta Code is already installed"
} else {
    Log-Warn "Letta not found. Installing via npm..."
    if (Get-Command "npm" -ErrorAction SilentlyContinue) {
        npm install -g @letta-ai/letta-code
    }
}

# Install Launcher Scripts
Write-Host "`n--- Installing Launcher Scripts ---" -ForegroundColor DarkCyan

$ScriptContent = @'
function Resolve-Executable {
    param([string]$CmdName, [string[]]$Fallbacks)
    $cmd = Get-Command $CmdName -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }
    foreach ($fb in $Fallbacks) {
        $expanded = [System.Environment]::ExpandEnvironmentVariables($fb)
        if (Test-Path $expanded) { return $expanded }
    }
    return $CmdName
}

$AgyBin      = Resolve-Executable "agy" @("%LOCALAPPDATA%\Programs\antigravity\agy.exe", "$env:USERPROFILE\.local\bin\agy.cmd")
$OpenCodeBin = Resolve-Executable "opencode" @("$env:USERPROFILE\.opencode\bin\opencode.exe", "$env:USERPROFILE\.opencode\bin\opencode.cmd")
$KiroBin     = Resolve-Executable "kiro-cli" @("%ProgramFiles%\Kiro\kiro-cli.exe", "$env:USERPROFILE\.local\bin\kiro-cli.exe")
$CopilotBin  = Resolve-Executable "copilot" @("$env:LOCALAPPDATA%\GitHubCopilot\copilot.exe", "$env:USERPROFILE\.local\bin\copilot.exe", "$env:APPDATA\npm\copilot.cmd")
$FreeBuffBin = Resolve-Executable "freebuff" @("$env:APPDATA\npm\freebuff.cmd", "$env:USERPROFILE\.npm-global\freebuff.cmd")
$ClineBin    = Resolve-Executable "cline" @("$env:APPDATA\npm\cline.cmd", "$env:USERPROFILE\.npm-global\cline.cmd")
$KiloBin     = Resolve-Executable "kilo" @("$env:USERPROFILE\.kilo\bin\kilo.exe", "$env:USERPROFILE\.kilo\bin\kilo.cmd")
$CodexBin    = Resolve-Executable "codex" @("$env:APPDATA\npm\codex.cmd", "$env:LOCALAPPDATA\Programs\codex\codex.exe")
$QoderBin    = Resolve-Executable "qoder" @("$env:USERPROFILE\.qoder\entry\qoder.cmd", "$env:USERPROFILE\.qoder\bin\qodercli.exe")
$LettaBin    = Resolve-Executable "letta" @("$env:APPDATA\npm\letta.cmd", "$env:USERPROFILE\.npm-global\letta.cmd")

$menu = @(
    " 1) Antigravity"
    " 2) OpenCode"
    " 3) Kiro"
    " 4) Copilot"
    " 5) FreeBuff"
    " 6) Cline"
    " 7) Kilo"
    " 8) Codex"
    " 9) Qoder"
    "10) Letta"
    "11) Quit"
)

while ($true) {
    Write-Host ""
    $menu | ForEach-Object { Write-Host $_ }
    $choice = Read-Host "Select [1-11]"

    switch ($choice.Trim()) {
        "1"  { & $AgyBin --dangerously-skip-permissions; break }
        "2"  { & $OpenCodeBin --auto; break }
        "3"  { & $KiroBin chat --trust-all-tools --trust-workspace; break }
        "4"  { & $CopilotBin --yolo --allow-all; break }
        "5"  { & $FreeBuffBin --trust-agents; break }
        "6"  { & $ClineBin -i --yolo --auto-approve true; break }
        "7"  { & $KiloBin --auto; break }
        "8"  { & $CodexBin --dangerously-bypass-approvals-and-sandbox; break }
        "9"  { & $QoderBin --permission-mode bypass_permissions --dangerously-skip-permissions; break }
        "10" { & $LettaBin --yolo --permission-mode unrestricted --disable-memory-guard; break }
        "11" { exit 0 }
        default { Write-Host "Invalid option '$choice'. Enter a number between 1 and 11." -ForegroundColor Red }
    }
}
'@

$Ps1Path = Join-Path $InstallDir "ai-menu.ps1"
Set-Content -Path $Ps1Path -Value $ScriptContent -Force

$CmdContent = @"
@echo off
setlocal
where pwsh.exe >nul 2>nul
if %ERRORLEVEL% equ 0 (
    pwsh -NoProfile -ExecutionPolicy Bypass -File "$Ps1Path" %*
) else (
    powershell -NoProfile -ExecutionPolicy Bypass -File "$Ps1Path" %*
)
endlocal
"@

$CmdPath = Join-Path $InstallDir "ai.cmd"
Set-Content -Path $CmdPath -Value $CmdContent -Force
Log-Ok "Created $CmdPath and $Ps1Path"

# PATH integration
$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($UserPath -split ";" -notcontains $InstallDir) {
    [Environment]::SetEnvironmentVariable("Path", "$UserPath;$InstallDir", "User")
    $env:PATH = "$env:PATH;$InstallDir"
    Log-Ok "Added $InstallDir to User PATH"
}

# PowerShell Profile integration
if (-not (Test-Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force | Out-Null
}
$ProfileContent = Get-Content $PROFILE -Raw -ErrorAction SilentlyContinue
if ($ProfileContent -notmatch "function\s+ai\b") {
    Add-Content -Path $PROFILE -Value "`n# AI Menu`nfunction ai { & '$Ps1Path' }"
    Log-Ok "Added 'ai' function to $PROFILE"
}

Write-Host "`n====================================================" -ForegroundColor Green
Write-Host "            Installation Complete!                  " -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Green
Write-Host "Restart your terminal or run: ai`n" -ForegroundColor Cyan
