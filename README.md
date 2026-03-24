# Dotfiles

This repository contains my personal dotfiles and configuration files for a complete Linux development environment. These configurations are optimized for productivity with Neovim, Fish shell, and Hyprland on Wayland.

## Overview

This dotfiles repository includes configurations for:

- **Neovim** - Modern Vim-based text editor with LSP support
- **Fish Shell** - User-friendly command line shell
- **Tmux** - Terminal multiplexer for managing multiple sessions
- **Hyprland** - Dynamic tiling Wayland compositor
- **Waybar** - Highly customizable Wayland bar
- **Wofi** - Application launcher for Wayland
- **Kitty** - Fast, feature-rich, GPU-based terminal emulator
- **Git** - Version control with custom aliases

## Requirements

### System Prerequisites

- **OS**: Linux (tested on Arch Linux and similar distributions)
- **Display Server**: Wayland
- **Compositor**: Hyprland

### Tool Versions

| Tool | Minimum Version | Notes |
|------|-----------------|-------|
| Neovim | 0.11.2 | Must be built with LuaJIT |
| Fish | 3.6+ | Interactive shell |
| Tmux | 3.3+ | Terminal multiplexer |
| Git | 2.34.1+ | Version control |
| Hyprland | 0.35+ | Wayland compositor |
| Kitty | 0.30+ | GPU terminal emulator |

## Installation

### Quick Setup

```bash
# Clone the repository
git clone https://github.com/guilchaves/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Install configurations using stow
stow nvim fish kitty tmux hyprland waybar wofi git
```

### Manual Installation

If you prefer to set up configurations manually:

```bash
# Create config directories
mkdir -p ~/.config/{nvim,fish,kitty,hypr,waybar,wofi}

# Symlink configurations
ln -sf ~/.dotfiles/nvim/.config/nvim/* ~/.config/nvim/
ln -sf ~/.dotfiles/fish/.config/fish/* ~/.config/fish/
ln -sf ~/.dotfiles/kitty/.config/kitty/* ~/.config/kitty/
ln -sf ~/.dotfiles/tmux/.tmux.conf ~/
ln -sf ~/.dotfiles/hyprland/.config/hypr/* ~/.config/hypr/
ln -sf ~/.dotfiles/waybar/.config/waybar/* ~/.config/waybar/
ln -sf ~/.dotfiles/wofi/.config/wofi/* ~/.config/wofi/
ln -sf ~/.dotfiles/.gitconfig ~/
```

## Component Details

### Neovim

A modern Neovim configuration built on [LazyVim](https://www.lazyvim.org/) with extensive customizations.

**Key Features:**
- LSP support for 15+ languages (TypeScript, Go, Rust, Python, Ruby, Elixir, and more)
- TreeSitter for syntax highlighting
- Telescope for fuzzy finding
- Oil.nvim for file management
- Copilot integration for AI-assisted coding
- Custom color schemes (Rose Pine, Catppuccin, Kanagawa)

**Required Dependencies:**
```bash
# Telescope.nvim requirements
# For live grep:
sudo pacman -S ripgrep
# For find files:
sudo pacman -S fd
```

**Post-Installation:**
Launch Neovim and run `:Lazy` to install all plugins automatically.

### Fish Shell

Fish shell with enhanced prompt and productivity plugins.

**Plugins Installed:**
- [Fisher](https://github.com/jorgebucaran/fisher) - Plugin manager
- [Tide](https://github.com/IlanCosman/tide) v5 - Shell theme (use: `fisher install ilancosman/tide@v5`)
- [z for fish](https://github.com/jethrokuan/z) - Directory jumping
- [fzf](https://github.com/PatrickF1/fzf.fish) - Interactive filtering
- [nvm.fish](https://github.com/jorgebucaran/nvm.fish) - Node version manager
- [rose-pine/fish](https://github.com/rose-pine/fish) - Color theme

**Installation Steps:**
```bash
# Install Fish
sudo pacman -S fish

# Install Fisher (plugin manager)
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install all plugins from fish_plugins file
fisher update

# Set Fish as default shell
chsh -s /usr/bin/fish
```

### Tmux

Tmux configuration optimized for Neovim and Wayland.

**Key Bindings:**
- `Ctrl+s` - Prefix key (instead of Ctrl+b)
- `Prefix + r` - Reload config
- `Prefix + h/j/k/l` - Navigate panes (vim-style)
- Mouse support enabled

**Setup:**
```bash
# Install Tmux
sudo pacman -S tmux

# Install Tmux Plugin Manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Start tmux and press `Prefix + I` to install plugins
```

**True Color Support:**
This configuration includes fixes for Neovim true colors in Tmux based on [this guide](https://www.cyfyifanchen.com/blog/neovim-true-color).

### Hyprland

Dynamic tiling Wayland compositor with custom keybindings and workspace management.

**Configuration Highlights:**
- Dual monitor support (eDP-1 and DP-1)
- Workspaces 1-5 on primary monitor, 6-10 on secondary
- GTK dark theme (Catppuccin Mocha)
- Custom animations and window rules

### Waybar

Customizable status bar with system monitoring.

**Features:**
- Clock and calendar
- CPU, memory, and disk usage
- Network status
- Audio volume control
- System tray
- Hyprland workspace indicators
- Application launcher integration (Wofi)

### Wofi

Application launcher styled with Catppuccin Mocha color scheme.

**Features:**
- Custom CSS styling with rosewater, pink, and mauve accents
- Nerd Font icons support
- Keyboard-driven navigation

### Kitty Terminal

GPU-accelerated terminal with beautiful themes.

**Configuration:**
- Font: JetBrainsMono Nerd Font Mono (size 12)
- Theme: Rose Pine
- Background blur and opacity (0.8)
- True color support

### Git

Comprehensive Git configuration with useful aliases.

**Notable Aliases:**
- `git st` - Short status
- `git co` - Checkout
- `git cm` - Checkout main
- `git cb` - Create and checkout new branch
- `git ca` - Amend commit
- `git ps` - Push current branch to origin
- `git pl` - Pull current branch from origin
- `git hist` - Pretty history graph with relative dates
- `git rollback` - Soft reset to previous commit

**Configuration:**
- Default editor: Neovim
- Diff tool: nvimdiff
- GitHub user: guilchaves
- Case-sensitive file matching

## Theme Information

This configuration primarily uses the **Rose Pine** and **Catppuccin Mocha** color schemes across all applications for a consistent visual experience.

## Troubleshooting

### Neovim

**Issue**: LSP not working
- Run `:Mason` to ensure language servers are installed
- Check `:LspInfo` for active clients

**Issue**: Colors not displaying correctly
- Ensure terminal supports true color (256color)
- Check `TERM` environment variable

### Tmux

**Issue**: Colors look wrong in Neovim
- Verify `default-terminal` is set to `xterm-256color`
- Ensure terminal-overrides includes `Tc` flag

### Fish

**Issue**: Tide prompt not loading
- Run `fisher install ilancosman/tide@v5`
- Configure with `tide configure`

## License

Feel free to use these configurations as inspiration for your own setup. This is a personal configuration repository, so modify as needed for your workflow.

## Credits

- [LazyVim](https://www.lazyvim.org/) - Neovim configuration framework
- [Catppuccin](https://catppuccin.com/) - Soothing color scheme
- [Rose Pine](https://rosepinetheme.com/) - All-natural pine, faux fur and a bit of soho vibes
