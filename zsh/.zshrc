# # Add colors
# autoload -U colors && colors

# # Custom PS1
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# # Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# # Add fzf support
[ -f "/usr/share/fzf/completion.zsh" ] && source /usr/share/fzf/completion.zsh
[ -f "/usr/share/fzf/key-bindings.zsh" ] && source /usr/share/fzf/key-bindings.zsh

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# # Load completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Last Word with Alt+.
bindkey '\e.' insert-last-word

# Arrow keys
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Delete
bindkey '^[[P' delete-char

# # Home/End
bindkey '^[[H'  beginning-of-line
bindkey '^[[4~'  end-of-line

# Ctrl+Arrows to move through words
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
# Ctrl+Backspace deletes previous word
bindkey '^H' backward-kill-word

# Alt+Backspace - delete last word up to /
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir


# Alt+Left - moves through words up to /
backward-word-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-word
}
zle -N backward-word-dir
bindkey "^[[1;3C" forward-word-dir

# Alt+Right - moves through words up to /
forward-word-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle forward-word
}
zle -N forward-word-dir
bindkey "^[[1;3D" backward-word-dir

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# Use lf (https://github.com/gokcehan/lf) to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

bindkey -s '^o' 'lfcd\n'  # zsh

# Edit command line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey "^e" edit-command-line

# nvm
[ -f "/usr/share/nvm/init-nvm.sh" ] && source /usr/share/nvm/init-nvm.sh

# wal sequence
# [ -f "$HOME/.cache/wal/sequences" ] && (/usr/bin/cat ~/.cache/wal/sequences &)

# Load profile
source /home/ktz/.profile
# Load zsh-pure-prompt if installed
autoload -U promptinit; promptinit
prompt pure

# Load zsh-autosuggestions if installed
[ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load zsh-syntax-highlighting; should be last. Needs to be installed (zsh-syntax-highlighting AUR)
[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# theme.sh https://github.com/lemnos/theme.sh
theme.sh hemisu-dark
