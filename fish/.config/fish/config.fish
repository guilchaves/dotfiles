if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

# theme
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

fish_add_path ~/.asdf/bin
fish_add_path ~/.asdf/shims
source ~/.asdf/asdf.fish

fish_add_path ~/.local/share/nvim/mason/bin

## Add Go binaries and GOPATH/bin to PATH
fish_add_path /home/guilherme/go/bin
fish_add_path $GOPATH/bin
fish_add_path $GOPROXY/bin
