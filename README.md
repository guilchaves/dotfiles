# Dotfiles

Personal dotfiles for Linux development environment with Neovim, Fish, Tmux, Kitty, Hyprland, herdr, OpenCode, and GitHub Copilot.

## Versions

| Tool | Version | Notes |
|------|---------|-------|
| Neovim | 0.11.2+ | Built with LuaJIT |
| Fish | 3.6+ | Interactive shell |
| Tmux | 3.3+ | Terminal multiplexer |
| Kitty | 0.30+ | GPU terminal |
| Hyprland | 0.35+ | Wayland compositor |
| Git | 2.34.1+ | Version control |
| herdr | 0.8.2+ | Terminal workspace for agents (keys mirror Tmux) |
| OpenCode | 1.18+ | AI coding agent (agents, skills, themes) |
| GitHub Copilot | - | AI coding assistant (agents, skills, instructions) |

## What's Inside

| Package | Contents |
|---------|----------|
| `nvim` | Neovim config (lazy.nvim, LSP servers, per-language ftplugins) |
| `fish` | Fish config, Fisher plugins (tide, fzf, nvm, z) |
| `kitty` | Kitty config and themes |
| `tmux` | `.tmux.conf` (prefix `Ctrl+s`) |
| `hyprland`, `hypridle`, `hyprlock`, `hyprpaper`, `hyprmocha` | Hyprland compositor, idle, lock screen, wallpaper and Catppuccin Mocha colors |
| `waybar`, `wofi` | Status bar and launcher |
| `herdr` | herdr `config.toml` (only the config; logs, sockets and sessions stay local) |
| `opencode` | OpenCode agents, skills and themes |
| `copilot` | GitHub Copilot agents, instructions and MCP config |
| `.gitconfig` | Git config |

## Installation

### Quick Install (Stow)

```bash
git clone https://github.com/guilchaves/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow nvim fish kitty tmux hyprland hypridle hyprlock hyprpaper hyprmocha waybar wofi opencode copilot herdr
ln -sf ~/.dotfiles/.gitconfig ~/
```

### Manual Install

Copy files to their respective directories:

| Source | Destination |
|--------|-------------|
| `nvim/.config/nvim/` | `~/.config/nvim/` |
| `fish/.config/fish/` | `~/.config/fish/` |
| `kitty/.config/kitty/` | `~/.config/kitty/` |
| `tmux/.tmux.conf` | `~/.tmux.conf` |
| `hyprland/.config/hypr/` | `~/.config/hypr/` |
| `hypridle/.config/hypr/` | `~/.config/hypr/` |
| `hyprlock/.config/hypr/` | `~/.config/hypr/` |
| `hyprpaper/.config/hypr/` | `~/.config/hypr/` |
| `hyprmocha/.config/hypr/` | `~/.config/hypr/` |
| `waybar/.config/waybar/` | `~/.config/waybar/` |
| `wofi/.config/wofi/` | `~/.config/wofi/` |
| `opencode/.config/opencode/` | `~/.config/opencode/` |
| `herdr/.config/herdr/config.toml` | `~/.config/herdr/config.toml` |
| `copilot/.github/` | `~/.github/` |
| `.gitconfig` | `~/.gitconfig` |

```bash
# Create directories
mkdir -p ~/.config/{nvim,fish,kitty,hypr,waybar,wofi,opencode,herdr} ~/.github

# Symlink configs
ln -sf ~/.dotfiles/nvim/.config/nvim/* ~/.config/nvim/
ln -sf ~/.dotfiles/fish/.config/fish/* ~/.config/fish/
ln -sf ~/.dotfiles/kitty/.config/kitty/* ~/.config/kitty/
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/
ln -sf ~/.dotfiles/hyprland/.config/hypr/* ~/.config/hypr/
ln -sf ~/.dotfiles/hypridle/.config/hypr/* ~/.config/hypr/
ln -sf ~/.dotfiles/hyprlock/.config/hypr/* ~/.config/hypr/
ln -sf ~/.dotfiles/hyprpaper/.config/hypr/* ~/.config/hypr/
ln -sf ~/.dotfiles/hyprmocha/.config/hypr/* ~/.config/hypr/
ln -sf ~/.dotfiles/waybar/.config/waybar/* ~/.config/waybar/
ln -sf ~/.dotfiles/wofi/.config/wofi/* ~/.config/wofi/
ln -sf ~/.dotfiles/opencode/.config/opencode/* ~/.config/opencode/
ln -sf ~/.dotfiles/herdr/.config/herdr/config.toml ~/.config/herdr/
ln -sf ~/.dotfiles/copilot/.github/* ~/.github/
ln -sf ~/.dotfiles/.gitconfig ~/
```

## Post-Install

- **Neovim**: Run `:Lazy` to install plugins
- **Tmux**: Install TPM (`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`), then press `Ctrl+s` followed by `I`
- **Fish**: Install Fisher (`curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher`), then run `fisher update`

## License

Free to use and modify.
