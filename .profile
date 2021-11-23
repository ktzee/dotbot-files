# fzf config
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'
export FZF_ALT_C_OPTS='--select-1 --exit-0'

export TERM=alacritty
export LESSHISTFILE="~/.cache/.lesshst"
export READER="zathura"
export TERMINAL="st"
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/AppImage:$HOME/.scripts/:$HOME/.config/nvim/plugged/vim-live-latex-preview/bin:$GOPATH/bin:$HOME/.java/graalvm/bin:$HOME/.java/bin/:$HOME/.local/bin:/home/ktz/.cargo/bin:$HOME/bin:$HOME/.scripts/statusbar/
