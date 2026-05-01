#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/rattle99/dotfiles"
DOTFILES_DIR="$HOME/Projects/Rattle/dotfiles"

# Clone repo if not already present (supports curl | sh usage)
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repo..."
    git clone "$REPO_URL" "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
elif [ -f "$0" ] && [ "$(cd "$(dirname "$0")" && pwd)" = "$DOTFILES_DIR" ]; then
    DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
fi
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d_%H%M%S)"
OS="$(uname -s)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

backup_and_link() {
    local src="$1"
    local dest="$2"

    if [ ! -e "$src" ]; then
        error "Source does not exist: $src"
        return 1
    fi

    # If destination already points to the correct source, skip
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        info "Already linked: $dest"
        return 0
    fi

    # Backup existing file/dir/symlink
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        mkdir -p "$BACKUP_DIR"
        warn "Backing up $dest -> $BACKUP_DIR/"
        mv "$dest" "$BACKUP_DIR/"
    fi

    # Create parent directory if needed
    mkdir -p "$(dirname "$dest")"

    ln -sf "$src" "$dest"
    info "Linked: $dest -> $src"
}

# ============================================================
# Phase 1: Install tools
# ============================================================

info "Detecting OS: $OS"

install_packages() {
    if [ "$OS" = "Darwin" ]; then
        # Install Homebrew if missing
        if ! command -v brew &>/dev/null; then
            info "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi

        local packages=(zsh neovim vim kitty zellij yazi git-delta lsd fzf fd bat cava pyright)
        local casks=(nikitabobko/tap/aerospace claude-code font-jetbrains-mono-nerd-font)

        for pkg in "${packages[@]}"; do
            if ! brew list "$pkg" &>/dev/null; then
                info "Installing $pkg..."
                brew install "$pkg"
            else
                info "$pkg already installed"
            fi
        done

        for cask in "${casks[@]}"; do
            if ! brew list "$cask" &>/dev/null; then
                info "Installing $cask..."
                brew install "$cask"
            else
                info "$cask already installed"
            fi
        done

    elif [ "$OS" = "Linux" ]; then
        local packages=(zsh neovim vim kitty zellij yazi git-delta lsd fzf fd-find bat cava)

        if command -v apt &>/dev/null; then
            for pkg in "${packages[@]}"; do
                if ! dpkg -l "$pkg" &>/dev/null 2>&1 && ! command -v "$pkg" &>/dev/null; then
                    info "Installing $pkg..."
                    if ! sudo apt install -y "$pkg" 2>/dev/null; then
                        warn "$pkg not found in apt. Install it manually (e.g. via snap, cargo, or binary)."
                        read -rp "Press Enter once $pkg is installed (or to skip)..."
                    fi
                else
                    info "$pkg already installed"
                fi
            done
        elif command -v dnf &>/dev/null; then
            for pkg in "${packages[@]}"; do
                if ! rpm -q "$pkg" &>/dev/null 2>&1 && ! command -v "$pkg" &>/dev/null; then
                    info "Installing $pkg..."
                    if ! sudo dnf install -y "$pkg" 2>/dev/null; then
                        warn "$pkg not found in dnf. Install it manually."
                        read -rp "Press Enter once $pkg is installed (or to skip)..."
                    fi
                else
                    info "$pkg already installed"
                fi
            done
        else
            warn "Unsupported package manager. Install manually: ${packages[*]}"
        fi
    fi
}

install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        info "Installing oh-my-zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    else
        info "oh-my-zsh already installed"
    fi

    local custom_plugins="$HOME/.oh-my-zsh/custom/plugins"

    if [ ! -d "$custom_plugins/zsh-autosuggestions" ]; then
        info "Installing zsh-autosuggestions..."
        git clone https://github.com/zsh-users/zsh-autosuggestions "$custom_plugins/zsh-autosuggestions"
    else
        info "zsh-autosuggestions already installed"
    fi

    if [ ! -d "$custom_plugins/zsh-syntax-highlighting" ]; then
        info "Installing zsh-syntax-highlighting..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting "$custom_plugins/zsh-syntax-highlighting"
    else
        info "zsh-syntax-highlighting already installed"
    fi

    local custom_themes="$HOME/.oh-my-zsh/custom/themes"
    if [ ! -d "$custom_themes/powerlevel10k" ]; then
        info "Installing powerlevel10k..."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$custom_themes/powerlevel10k"
    else
        info "powerlevel10k already installed"
    fi
}

install_vim_plug() {
    local plug_path="$HOME/.config/vim/autoload/plug.vim"
    if [ ! -f "$plug_path" ]; then
        info "Installing vim-plug..."
        curl -fLo "$plug_path" --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        info "vim-plug already installed"
    fi
}

# ============================================================
# Phase 2: Symlink configs
# ============================================================

link_configs() {
    info "Symlinking configs..."

    # Home-level symlinks
    backup_and_link "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    backup_and_link "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"
    backup_and_link "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
    # macOS only
    if [ "$OS" = "Darwin" ]; then
        backup_and_link "$DOTFILES_DIR/ssh/.ssh/config" "$HOME/.ssh/config"
        backup_and_link "$DOTFILES_DIR/aerospace/.aerospace.toml" "$HOME/.aerospace.toml"
    fi

    # Directory-level symlinks (entire dir is hand-written)
    backup_and_link "$DOTFILES_DIR/kitty/.config/kitty" "$HOME/.config/kitty"
    backup_and_link "$DOTFILES_DIR/zellij/.config/zellij" "$HOME/.config/zellij"
    backup_and_link "$DOTFILES_DIR/nvim/.config/nvim" "$HOME/.config/nvim"

    # Linux only
    if [ "$OS" = "Linux" ]; then
        backup_and_link "$DOTFILES_DIR/dunst/.config/dunst" "$HOME/.config/dunst"
        backup_and_link "$DOTFILES_DIR/i3/.config/i3" "$HOME/.config/i3"
        backup_and_link "$DOTFILES_DIR/polybar/.config/polybar" "$HOME/.config/polybar"
        backup_and_link "$DOTFILES_DIR/picom/.config/picom.conf" "$HOME/.config/picom.conf"
        backup_and_link "$DOTFILES_DIR/dmenu/.config/dmenu" "$HOME/.config/dmenu"
        chmod +x "$HOME/.config/dmenu/run.sh"
    fi

    # All platforms
    mkdir -p "$HOME/.config/micro"
    backup_and_link "$DOTFILES_DIR/micro/.config/micro/bindings.json" "$HOME/.config/micro/bindings.json"
    backup_and_link "$DOTFILES_DIR/micro/.config/micro/settings.json" "$HOME/.config/micro/settings.json"

    # File-level symlinks (dir has generated data too)
    mkdir -p "$HOME/.config/vim/colors"
    backup_and_link "$DOTFILES_DIR/vim/.config/vim/vimrc" "$HOME/.config/vim/vimrc"
    backup_and_link "$DOTFILES_DIR/vim/.config/vim/colors/colorice.vim" "$HOME/.config/vim/colors/colorice.vim"
    mkdir -p "$HOME/.config/vim/autoload/airline/themes"
    backup_and_link "$DOTFILES_DIR/vim/.config/vim/autoload/airline/themes/colorice.vim" "$HOME/.config/vim/autoload/airline/themes/colorice.vim"

    backup_and_link "$DOTFILES_DIR/cava/.config/cava/config" "$HOME/.config/cava/config"
}

# ============================================================
# Phase 3: Post-install
# ============================================================

post_install() {
    info "Vim plugins: open vim and run :PlugInstall"
    info "Nvim plugins: open nvim — Lazy.nvim will auto-install on first launch"
}

# ============================================================
# Optional: Pull SSH keys from Bitwarden
# ============================================================

pull_ssh_keys() {
    if command -v bw &>/dev/null; then
        read -p "Pull SSH keys from Bitwarden? (y/N) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            info "Login to Bitwarden first: bw login && bw unlock"
            info "Then run:"
            info "  bw get attachment id_ed25519_work --itemid <item-id> --output ~/.ssh/id_ed25519_work"
            info "  bw get attachment id_ed25519_personal --itemid <item-id> --output ~/.ssh/id_ed25519_personal"
            info "  chmod 600 ~/.ssh/id_ed25519_*"
        fi
    fi
}

# ============================================================
# Run
# ============================================================

info "Starting dotfiles setup..."
echo

install_packages
install_oh_my_zsh
install_vim_plug
echo

link_configs
echo

post_install
echo

pull_ssh_keys
echo

info "Done! Restart your shell or run: source ~/.zshrc"
if [ -d "$BACKUP_DIR" ]; then
    warn "Backups saved to: $BACKUP_DIR"
fi
