# fzf config
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'
export LESSHISTFILE="~/.cache/.lesshst"
export READER="zathura"
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/AppImage:$HOME/.scripts/:$HOME/.config/nvim/plugged/vim-live-latex-preview/bin:$GOPATH/bin:$HOME/.java/graalvm/bin:$HOME/.java/bin/:$HOME/.local/bin:/home/ktz/.cargo/bin:$HOME/bin
