# fzf config
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'
export FZF_ALT_C_OPTS='--select-1 --exit-0'

# env vars
export LESSHISTFILE="$HOME/.cache/.lesshst"
export READER="zathura"
export TERMINAL="alacritty"
export TERM="screen-256color"
export BROWSER="firefox"
export EDITOR="nvim"
export SSH_ASKPASS=ssh-askpass

# xdg vars
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# clean home
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GOPATH="$XDG_DATA_HOME"/go
export GOBIN="$XDG_DATA_HOME"/go/bin
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"

# charm client
# use the local charm instance instead of charm cloud
export CHARM_HOST=localhost

# PATH
export PATH="${PATH}:$HOME/AppImage:$HOME/.scripts/:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/bin:$HOME/.scripts/statusbar:$GOBIN"
