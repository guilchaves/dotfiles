# Dotfiles

Personal dotfiles for Linux development environment with Neovim, Fish, Tmux, and Hyprland.

## Versions

| Tool | Version | Notes |
|------|---------|-------|
| Neovim | 0.11.2+ | Built with LuaJIT |
| Fish | 3.6+ | Interactive shell |
| Tmux | 3.3+ | Terminal multiplexer |
| Kitty | 0.30+ | GPU terminal |
| Hyprland | 0.35+ | Wayland compositor |
| Git | 2.34.1+ | Version control |

## Installation

### Quick Install (Stow)

```bash
git clone https://github.com/guilchaves/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow nvim fish kitty tmux hyprland waybar wofi git opencode
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
| `waybar/.config/waybar/` | `~/.config/waybar/` |
| `wofi/.config/wofi/` | `~/.config/wofi/` |
| `opencode/.config/opencode/` | `~/.config/opencode/` |
| `.gitconfig` | `~/.gitconfig` |

```bash
# Create directories
mkdir -p ~/.config/{nvim,fish,kitty,hypr,waybar,wofi,opencode}

# Symlink configs
ln -sf ~/.dotfiles/nvim/.config/nvim/* ~/.config/nvim/
ln -sf ~/.dotfiles/fish/.config/fish/* ~/.config/fish/
ln -sf ~/.dotfiles/kitty/.config/kitty/* ~/.config/kitty/
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/
ln -sf ~/.dotfiles/hyprland/.config/hypr/* ~/.config/hypr/
ln -sf ~/.dotfiles/hypridle/.config/hypr/* ~/.config/hypr/
ln -sf ~/.dotfiles/hyprlock/.config/hypr/* ~/.config/hypr/
ln -sf ~/.dotfiles/hyprpaper/.config/hypr/* ~/.config/hypr/
ln -sf ~/.dotfiles/waybar/.config/waybar/* ~/.config/waybar/
ln -sf ~/.dotfiles/wofi/.config/wofi/* ~/.config/wofi/
ln -sf ~/.dotfiles/opencode/.config/opencode/* ~/.config/opencode/
ln -sf ~/.dotfiles/.gitconfig ~/
```

## Post-Install

- **Neovim**: Run `:Lazy` to install plugins
- **Tmux**: Install TPM (`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`), then press `Ctrl+s` followed by `I`
- **Fish**: Install Fisher (`curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher`), then run `fisher update`

## License

Free to use and modify.
