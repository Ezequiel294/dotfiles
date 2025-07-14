#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias tree='exa -T'
alias tmux='tmux -2'
alias grep='grep --color=auto'
alias ls='exa --group-directories-first'
alias pi5='ssh ezequiel@186.159.146.215'
alias cat='bat --style=plain --paging=never'
alias fzf='fzf --preview "bat --color-always --style=numbers {}"'
alias dotfiles="git --git-dir $HOME/.dotfiles/ --work-tree $HOME"

# Enable colored prompt if supported
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
*) color_prompt=no ;;
esac

# Force colored prompt if possible
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if command -v tput >/dev/null 2>&1 && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=no
    fi
fi

# Set the prompt based on color support
if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

tmux
