<#
.SYNOPSIS
    AI Menu - Terminal Launcher for Top AI Coding Agents on Windows (PowerShell)
    Auto-configured for unrestricted execution, YOLO mode, and no sandbox.
#>

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

$AgyBin      = Resolve-Executable "agy" @("%LOCALAPPDATA%\Programs\antigravity\agy.exe", "$env:USERPROFILE\.local\bin\agy.cmd", "$env:USERPROFILE\.local\bin\agy.exe")
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
