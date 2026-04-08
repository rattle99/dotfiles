# Dotfiles

Personal dotfiles managed with raw git and symlinks. Repo structure follows [GNU Stow](https://www.gnu.org/software/stow/) conventions for future compatibility.

## Setup

One-liner (clones the repo and runs setup):

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/rattle99/dotfiles/main/setup.sh)
```

Or manually:

```bash
git clone https://github.com/rattle99/dotfiles ~/Projects/Rattle/dotfiles
cd ~/Projects/Rattle/dotfiles
chmod +x setup.sh
./setup.sh
```

`setup.sh` will:
1. Install tools via Homebrew (macOS) or apt/dnf (Linux)
2. Install oh-my-zsh + plugins, vim-plug
3. Symlink configs to the correct locations
4. Install vim/nvim plugins headlessly

The script is idempotent — safe to re-run. Existing files are backed up to `~/.dotfiles-backup/` before overwriting.

## Structure

Each top-level directory is a "package" mirroring `$HOME`:

```
<tool>/
  .config/
    <tool>/
      <config files>
```

For example, `nvim/.config/nvim/init.lua` symlinks to `~/.config/nvim/init.lua`.

## Configs

| Package | Machines | Description |
|---|---|---|
| zsh | All | Shell config (.zshrc, .zprofile) |
| ssh | macOS | SSH host config |
| kitty | All | Terminal emulator |
| zellij | All | Terminal multiplexer |
| nvim | All | Neovim (Lua config + Lazy.nvim plugins) |
| vim | All | Vim (vimrc + vim-plug plugins) |
| aerospace | macOS | Tiling window manager |
| i3 | Linux | Tiling window manager (TODO) |
| polybar | Linux | Status bar (TODO) |
| picom | Linux | Compositor (TODO) |
| dunst | Linux | Notification daemon (TODO) |
| rofi | Linux | Application launcher (TODO) |

## Adding a new tool

Follow the Stow convention — mirror the path from `$HOME`:

```bash
# Example: adding yazi config
mkdir -p yazi/.config/yazi
cp ~/.config/yazi/yazi.toml yazi/.config/yazi/
```

Then add the symlink to `setup.sh`.
