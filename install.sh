#!/usr/bin/env bash
# AI Menu Installer - Installs AI CLI tools and sets up terminal "ai" menu
set -e

# Terminal colors
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BOLD}${CYAN}====================================================${NC}"
echo -e "${BOLD}${CYAN}            AI CLI Menu - Universal Installer       ${NC}"
echo -e "${BOLD}${CYAN}====================================================${NC}"
echo -e "${BLUE}Configuring interactive terminal menu for 10 AI agents${NC}\n"

# Helper functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_ok() {
    echo -e "${GREEN}[✓]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[!]${NC} $1"
}

log_err() {
    echo -e "${RED}[✗]${NC} $1"
}

# Ensure destination directories exist
INSTALL_DIR="$HOME/.local/bin"
mkdir -p "$INSTALL_DIR" "$HOME/bin"

# Check prerequisite: curl
if ! command -v curl >/dev/null 2>&1; then
    log_err "curl is required. Please install curl and re-run."
    exit 1
fi

# Ensure npm global bin is in PATH if node/npm exists
if command -v npm >/dev/null 2>&1; then
    NPM_BIN="$(npm config get prefix 2>/dev/null)/bin"
    if [ -d "$NPM_BIN" ] && [[ ":$PATH:" != *":$NPM_BIN:"* ]]; then
        export PATH="$NPM_BIN:$PATH"
    fi
fi
if [ -d "$HOME/.npm-global/bin" ] && [[ ":$PATH:" != *":$HOME/.npm-global/bin:"* ]]; then
    export PATH="$HOME/.npm-global/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# 1. Antigravity (agy)
check_and_install_agy() {
    log_info "Checking Antigravity CLI (agy)..."
    if command -v agy >/dev/null 2>&1 || [ -x "$HOME/.local/bin/agy" ] || [ -x "$HOME/.gemini/antigravity-cli/bin/agy" ]; then
        log_ok "Antigravity CLI is already installed"
    else
        log_warn "Antigravity not found. Installing..."
        curl -fsSL https://antigravity.google/install.sh | bash || true
    fi
}

# 2. OpenCode (opencode)
check_and_install_opencode() {
    log_info "Checking OpenCode..."
    if command -v opencode >/dev/null 2>&1 || [ -x "$HOME/.opencode/bin/opencode" ]; then
        log_ok "OpenCode is already installed"
    else
        log_warn "OpenCode not found. Installing..."
        curl -fsSL https://opencode.ai/install | bash || true
    fi
}

# 3. Kiro (kiro-cli)
check_and_install_kiro() {
    log_info "Checking Kiro CLI..."
    if command -v kiro-cli >/dev/null 2>&1 || [ -x "/usr/bin/kiro-cli" ] || [ -x "$HOME/.local/bin/kiro-cli" ]; then
        log_ok "Kiro CLI is already installed"
    else
        log_warn "Kiro CLI not found. Installing..."
        curl -fsSL https://kiro.dev/install.sh | bash || true
    fi
}

# 4. Copilot (copilot)
check_and_install_copilot() {
    log_info "Checking GitHub Copilot CLI..."
    if command -v copilot >/dev/null 2>&1 || [ -x "$HOME/.local/bin/copilot" ]; then
        log_ok "GitHub Copilot CLI is already installed"
    else
        log_warn "Copilot not found. Installing..."
        curl -fsSL https://gh.io/copilot-install | bash || true
    fi
}

# 5. FreeBuff (freebuff)
check_and_install_freebuff() {
    log_info "Checking FreeBuff..."
    if command -v freebuff >/dev/null 2>&1 || [ -x "$HOME/.npm-global/bin/freebuff" ] || [ -x "/usr/local/bin/freebuff" ]; then
        log_ok "FreeBuff is already installed"
    else
        log_warn "FreeBuff not found. Installing via npm..."
        npm install -g freebuff || true
    fi
}

# 6. Cline (cline)
check_and_install_cline() {
    log_info "Checking Cline CLI..."
    if command -v cline >/dev/null 2>&1 || [ -x "$HOME/.npm-global/bin/cline" ] || [ -x "/usr/local/bin/cline" ]; then
        log_ok "Cline CLI is already installed"
    else
        log_warn "Cline not found. Installing via npm..."
        npm install -g cline || true
    fi
}

# 7. Kilo (kilo)
check_and_install_kilo() {
    log_info "Checking Kilo..."
    if command -v kilo >/dev/null 2>&1 || [ -x "$HOME/.kilo/bin/kilo" ]; then
        log_ok "Kilo is already installed"
    else
        log_warn "Kilo not found. Installing..."
        curl -fsSL https://kilo.ai/cli/install | bash || true
    fi
}

# 8. Codex (codex)
check_and_install_codex() {
    log_info "Checking Codex CLI..."
    if command -v codex >/dev/null 2>&1 || [ -x "$HOME/.local/bin/codex" ]; then
        log_ok "Codex CLI is already installed"
    else
        log_warn "Codex CLI not found. Installing..."
        curl -fsSL https://chatgpt.com/codex/install.sh | sh || npm install -g @openai/codex || true
    fi
}

# 9. Qoder (qoder)
check_and_install_qoder() {
    log_info "Checking Qoder..."
    if command -v qoder >/dev/null 2>&1 || [ -x "$HOME/.qoder/entry/qoder" ]; then
        log_ok "Qoder is already installed"
    else
        log_warn "Qoder not found. Installing..."
        curl -fsSL https://qoder.com/install | bash || true
    fi
}

# 10. Letta (letta)
check_and_install_letta() {
    log_info "Checking Letta Code..."
    if command -v letta >/dev/null 2>&1 || [ -x "$HOME/.npm-global/bin/letta" ] || [ -x "/usr/local/bin/letta" ]; then
        log_ok "Letta Code is already installed"
    else
        log_warn "Letta not found. Installing via npm..."
        npm install -g @letta-ai/letta-code || true
    fi
}

echo -e "\n${BOLD}--- Checking & Installing 10 AI CLIs ---${NC}"
check_and_install_agy
check_and_install_opencode
check_and_install_kiro
check_and_install_copilot
check_and_install_freebuff
check_and_install_cline
check_and_install_kilo
check_and_install_codex
check_and_install_qoder
check_and_install_letta

# Create the menu script
echo -e "\n${BOLD}--- Installing AI Terminal Menu Script ---${NC}"
MENU_TARGET="$INSTALL_DIR/ai-menu"

cat << 'EOF' > "$MENU_TARGET"
#!/usr/bin/env bash
# AI Menu - Terminal Launcher for Top AI Coding Agents
# Auto-configured for unrestricted execution, YOLO mode, and no sandbox.

export COLUMNS=1

resolve_bin() {
    local cmd="$1"
    shift
    if command -v "$cmd" >/dev/null 2>&1; then
        command -v "$cmd"
        return 0
    fi
    for p in "$@"; do
        if [ -x "$p" ]; then
            echo "$p"
            return 0
        fi
    done
    echo "$cmd"
}

AGY_BIN=$(resolve_bin agy "$HOME/.local/bin/agy" "$HOME/.gemini/antigravity-cli/bin/agy")
OPENCODE_BIN=$(resolve_bin opencode "$HOME/.opencode/bin/opencode")
KIRO_BIN=$(resolve_bin kiro-cli "/usr/bin/kiro-cli" "$HOME/.local/bin/kiro-cli")
COPILOT_BIN=$(resolve_bin copilot "$HOME/.local/bin/copilot")
FREEBUFF_BIN=$(resolve_bin freebuff "$HOME/.npm-global/bin/freebuff" "/usr/local/bin/freebuff")
CLINE_BIN=$(resolve_bin cline "$HOME/.npm-global/bin/cline" "/usr/local/bin/cline")
KILO_BIN=$(resolve_bin kilo "$HOME/.kilo/bin/kilo")
CODEX_BIN=$(resolve_bin codex "$HOME/.local/bin/codex")
QODER_BIN=$(resolve_bin qoder "$HOME/.qoder/entry/qoder")
LETTA_BIN=$(resolve_bin letta "$HOME/.npm-global/bin/letta" "/usr/local/bin/letta")

PS3="Select [1-11]: "
select opt in Antigravity OpenCode Kiro Copilot FreeBuff Cline Kilo Codex Qoder Letta Quit; do
case $REPLY in
1) "$AGY_BIN" --dangerously-skip-permissions ;;
2) "$OPENCODE_BIN" --auto ;;
3) "$KIRO_BIN" chat --trust-all-tools --trust-workspace ;;
4) "$COPILOT_BIN" --yolo --allow-all ;;
5) "$FREEBUFF_BIN" --trust-agents ;;
6) "$CLINE_BIN" -i --yolo --auto-approve true ;;
7) "$KILO_BIN" --auto ;;
8) "$CODEX_BIN" --dangerously-bypass-approvals-and-sandbox ;;
9) "$QODER_BIN" --permission-mode bypass_permissions --dangerously-skip-permissions ;;
10) "$LETTA_BIN" --yolo --permission-mode unrestricted --disable-memory-guard ;;
11) exit 0 ;;
*) echo "Invalid option $REPLY" ;;
esac
done
EOF

chmod +x "$MENU_TARGET"
cp -f "$MENU_TARGET" "$INSTALL_DIR/ai"
chmod +x "$INSTALL_DIR/ai"
cp -f "$MENU_TARGET" "$HOME/bin/ai-menu.sh" 2>/dev/null || true
log_ok "Installed launcher to $MENU_TARGET and $INSTALL_DIR/ai"

# Shell configuration
echo -e "\n${BOLD}--- Configuring Shell Integrations ---${NC}"

# Bash
if [ -f "$HOME/.bashrc" ]; then
    if ! grep -q "alias ai=" "$HOME/.bashrc"; then
        echo -e "\n# AI Terminal Menu\nalias ai='bash $MENU_TARGET'" >> "$HOME/.bashrc"
        log_ok "Configured alias in ~/.bashrc"
    else
        log_ok "Alias already present in ~/.bashrc"
    fi
fi

# Zsh
if [ -f "$HOME/.zshrc" ]; then
    if ! grep -q "alias ai=" "$HOME/.zshrc"; then
        echo -e "\n# AI Terminal Menu\nalias ai='bash $MENU_TARGET'" >> "$HOME/.zshrc"
        log_ok "Configured alias in ~/.zshrc"
    else
        log_ok "Alias already present in ~/.zshrc"
    fi
fi

# Fish
FISH_CONFIG="$HOME/.config/fish/config.fish"
if [ -f "$FISH_CONFIG" ]; then
    if ! grep -q "function ai" "$FISH_CONFIG"; then
        cat << 'FISHEOF' >> "$FISH_CONFIG"

# AI Terminal Menu
function ai
    bash ~/.local/bin/ai-menu
end
FISHEOF
        log_ok "Configured function ai in ~/.config/fish/config.fish"
    else
        log_ok "Function ai already present in fish config"
    fi
fi

echo -e "\n${BOLD}${GREEN}====================================================${NC}"
echo -e "${BOLD}${GREEN}            Installation Complete!                  ${NC}"
echo -e "${BOLD}${GREEN}====================================================${NC}"
echo -e "You can now run: ${BOLD}${CYAN}ai${NC} in your terminal to open the AI menu.\n"
