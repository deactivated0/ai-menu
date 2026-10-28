<div align="center">

# 🤖 AI Menu (`ai`)

### Universal Terminal Launcher & Auto-Installer for Top 10 AI Coding Agents
**Unrestricted Execution • Full Tool Auto-Approval • YOLO Mode • No Sandbox**

[![Platform: Linux | macOS | Windows](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20Windows-blue?style=for-the-badge&logo=linux&logoColor=white)](https://github.com/deactivated0/ai-menu)
[![Shell: Bash | Zsh | Fish | PowerShell](https://img.shields.io/badge/Shell-Bash%20%7C%20Zsh%20%7C%20Fish%20%7C%20PowerShell-success?style=for-the-badge&logo=gnubash&logoColor=white)](https://github.com/deactivated0/ai-menu)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/deactivated0/ai-menu?style=for-the-badge)](https://github.com/deactivated0/ai-menu/stargazers)
[![PRs Welcome](https://img.shields.io/badge/PRs-Welcome-brightgreen?style=for-the-badge)](https://github.com/deactivated0/ai-menu/pulls)

<p align="center">
  <b>Tired of remembering CLI commands, switching AI tools, and clicking "Allow" on every permission prompt?</b><br/>
  Type <code>ai</code> in your terminal on <b>Linux</b>, <b>macOS</b>, or <b>Windows</b> to launch an instant vertical picker running your favorite AI coding agents in full autonomous mode.
</p>

</div>

---

## ⚡ Quick Install

### 🐧 Linux & 🍎 macOS

Run in **Bash**, **Zsh**, or **Fish**:

```bash
curl -fsSL https://raw.githubusercontent.com/deactivated0/ai-menu/main/install.sh | bash
```

### 🪟 Windows (PowerShell / Windows Terminal)

Run in **PowerShell** (Run as User or Administrator):

```powershell
irm https://raw.githubusercontent.com/deactivated0/ai-menu/main/install.ps1 | iex
```

> **What the installer does:**
> 1. Scans your machine to check which of the 10 AI agents are already installed.
> 2. Auto-installs any missing agents via their official installation endpoints.
> 3. Configures the `ai` command into your default shell (`.bashrc`, `.zshrc`, `config.fish`, or PowerShell `$PROFILE`).
> 4. You can immediately launch the menu by typing **`ai`**!

---

## 📺 Interactive Terminal Interface

```text
 1) Antigravity
 2) OpenCode
 3) Kiro
 4) Copilot
 5) FreeBuff
 6) Cline
 7) Kilo
 8) Codex
 9) Qoder
10) Letta
11) Quit
Select [1-11]: 
```

Clean vertical layout designed for speed, keyboard navigation, and zero distractions.

---

## 🚀 Supported AI Coding Agents & Unrestricted Flags

Every AI assistant is configured to run with **maximum autonomy**: auto-approving edits, bypassing tool prompts, and disabling restrictive sandboxes so you can code without interruptions.

| # | AI Agent | Command | Autonomy & Permission Flags | Description |
|:---:|:---|:---:|:---|:---|
| **1** | **Antigravity** | `agy` | `--dangerously-skip-permissions` | Google DeepMind's agentic pair programmer |
| **2** | **OpenCode** | `opencode` | `--auto` | Open-source terminal agent with multi-provider routing |
| **3** | **Kiro** | `kiro-cli` | `chat --trust-all-tools --trust-workspace` | Terminal coding engine with trusted workspaces |
| **4** | **GitHub Copilot** | `copilot` | `--yolo --allow-all` | Official GitHub Copilot CLI with full tool access |
| **5** | **FreeBuff** | `freebuff` | `--trust-agents` | High-performance free AI coding agent |
| **6** | **Cline** | `cline` | `-i --yolo --auto-approve true` | Autonomous coding agent in terminal TUI |
| **7** | **Kilo** | `kilo` | `--auto` | Fast terminal agent with auto-approved permissions |
| **8** | **Codex** | `codex` | `--dangerously-bypass-approvals-and-sandbox` | OpenAI Codex CLI running with no sandbox |
| **9** | **Qoder** | `qoder` | `--permission-mode bypass_permissions --dangerously-skip-permissions` | Enterprise coding agent with full bypass permissions |
| **10** | **Letta** | `letta` | `--yolo --permission-mode unrestricted --disable-memory-guard` | Memory-first agentic coding environment |

---

## 💡 Why AI Menu?

- 🎯 **One Command to Rule Them All**: Replace 10 different CLI commands and syntax flags with just `ai`.
- ⚡ **Auto-Discovery & Auto-Healing**: If a tool is missing when installing, the installer automatically fetches and sets it up.
- 🔓 **True Autonomous "YOLO" Coding**: Skips annoying interactive approval dialogues (`[Y/n]` prompts) so your agent actually codes uninterrupted.
- 💻 **True Cross-Platform**: Works identically on **Ubuntu/Debian, Arch Linux, Fedora, macOS (Apple Silicon & Intel), and Windows 10/11**.
- 🐚 **Multi-Shell Native**: Auto-wires aliases and functions across **Bash, Zsh, Fish, and PowerShell**.

---

## 📦 Manual Installation (Git Clone)

### Linux / macOS
```bash
git clone https://github.com/deactivated0/ai-menu.git
cd ai-menu
chmod +x install.sh bin/ai-menu
./install.sh
```

### Windows
```powershell
git clone https://github.com/deactivated0/ai-menu.git
cd ai-menu
.\install.ps1
```

---

## ⚙️ How It Works Under the Hood

1. **Smart Binary Resolution**: The menu script doesn't just guess PATH variables; it resolves binaries against standard user locations:
   - Linux/macOS: `$PATH`, `~/.local/bin`, `~/.npm-global/bin`, `~/.opencode/bin`, `~/.kilo/bin`, `~/.qoder/entry`.
   - Windows: `$env:PATH`, `%LOCALAPPDATA%`, `$env:USERPROFILE\.local\bin`, `$env:APPDATA\npm`.
2. **Deterministic Vertical Formatting**: Uses POSIX `COLUMNS=1` or PowerShell array pipelines so the terminal menu stays vertical on any window size.
3. **Zero Overhead**: Pure lightweight shell and PowerShell scripts without heavy background daemons or runtime dependencies.

---

## 🤝 Contributing

Contributions, new AI agent integrations, and optimizations are welcome!
1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AddAgent`)
3. Commit your Changes (`git commit -m 'feat: add agent XYZ'`)
4. Push to the Branch (`git push origin feature/AddAgent`)
5. Open a Pull Request

---

## ⭐️ Show Your Support

If this saved you terminal keystrokes, give this repository a **⭐️ Star**!

---

## 📄 License

Distributed under the **MIT License**. See [`LICENSE`](LICENSE) for more information.
