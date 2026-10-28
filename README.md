# ai-menu 🚀

> Instant vertical terminal menu for top 10 AI coding agents with unrestricted permissions, YOLO mode, and no sandbox.

Auto-checks if each tool is available on your machine. If any tool is missing, the installer automatically installs it before configuring the terminal launcher.

---

## ⚡ Quick Install

Run this single command in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/deactivated0/ai-menu/main/install.sh | bash
```

Or clone and run locally:

```bash
git clone https://github.com/deactivated0/ai-menu.git
cd ai-menu
./install.sh
```

Once installed, simply type:

```bash
ai
```

---

## 📋 Interactive Terminal Menu

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

---

## 🤖 Included AI Coding Agents & Flags

Each agent is launched with maximum autonomy: all permission prompts bypassed, auto-approval enabled, sandboxing disabled, and YOLO mode engaged where applicable:

| # | Agent | CLI Binary | Autonomy & Permission Flags |
|---|-------|------------|-----------------------------|
| 1 | **Antigravity** | `agy` | `--dangerously-skip-permissions` |
| 2 | **OpenCode** | `opencode` | `--auto` |
| 3 | **Kiro** | `kiro-cli` | `chat --trust-all-tools --trust-workspace` |
| 4 | **GitHub Copilot** | `copilot` | `--yolo --allow-all` |
| 5 | **FreeBuff** | `freebuff` | `--trust-agents` |
| 6 | **Cline** | `cline` | `-i --yolo --auto-approve true` |
| 7 | **Kilo** | `kilo` | `--auto` |
| 8 | **Codex** | `codex` | `--dangerously-bypass-approvals-and-sandbox` |
| 9 | **Qoder** | `qoder` | `--permission-mode bypass_permissions --dangerously-skip-permissions` |
| 10 | **Letta** | `letta` | `--yolo --permission-mode unrestricted --disable-memory-guard` |

---

## 🔍 How Auto-Discovery & Installation Works

When `install.sh` runs:
1. **Checks each agent**: Searches `$PATH`, `~/.local/bin`, `~/.npm-global/bin`, and application directories.
2. **Installs missing agents**: Automatically runs each agent's official installation method (CURL scripts / NPM packages).
3. **Installs `ai` launcher**: Copies executable to `~/.local/bin/ai` and `~/.local/bin/ai-menu`.
4. **Configures Shells**: Auto-adds `ai` alias/function to:
   - **Fish**: `~/.config/fish/config.fish`
   - **Bash**: `~/.bashrc`
   - **Zsh**: `~/.zshrc`

---

## 🛠 Manual Execution

If you prefer to run the menu script directly without installing:

```bash
bash bin/ai-menu
```

---

## 📄 License

MIT License. See [LICENSE](LICENSE) for details.
