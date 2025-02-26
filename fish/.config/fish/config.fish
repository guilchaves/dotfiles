if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

source ~/.asdf/asdf.fish

# Set GOPATH (default is ~/go)
set -x GOPATH $HOME/go
set -x PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Add Go binaries and GOPATH/bin to PATH
fish_add_path /home/guilherme/go/bin
fish_add_path $GOPATH/bin
