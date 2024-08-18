#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias tree='exa -T'
alias tmux='tmux -2'
alias grep='grep --color=auto'
alias ls='exa --group-directories-first'
alias cat='bat --style=plain --paging=never'
alias fzf='fzf --preview "bat --color-always --style=numbers {}"'
alias dotfiles="git --git-dir $HOME/.dotfiles/ --work-tree $HOME"

PS1='[\u@\h \W]\$ '
