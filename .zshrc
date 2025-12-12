# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ezequiel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#

# Aliases
alias ll="ls -l"
alias tree="eza -T"
alias tmux="tmux -2"
alias grep="grep --color=auto"
alias ls="eza --group-directories-first"
alias cat="bat --color=always"
alias fzf='fzf --preview "bat --color=always --style=numbers {}"'
alias dotfiles="git --git-dir $HOME/.dotfiles/ --work-tree $HOME"

eval "$(starship init zsh)"
