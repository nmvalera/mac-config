install_claude_code() {
    if command -v claude &>/dev/null || [[ -f "$HOME/.local/bin/claude" ]]; then
        echo "Claude Code already installed"
        return
    fi
    curl -fsSL https://claude.ai/install.sh | bash
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc && source ~/.zshrc
}

install_tilt() {
    if command -v tilt &>/dev/null; then
        echo "Tilt already installed"
        return
    fi
    curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash
}

install_k3d_ctlptl() {
    if command -v k3d &>/dev/null && command -v ctlptl &>/dev/null; then
        echo "k3d and ctlptl already installed"
        return
    fi
    brew tap tilt-dev/tap
    brew install k3d tilt-dev/tap/ctlptl
}

install_claude_code
install_tilt
install_k3d_ctlptl