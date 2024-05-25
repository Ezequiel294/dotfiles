set fish_greeting ""

# Aliases

alias grep "grep --color=auto"
alias cat "bat"
alias ls "exa --group-directories-first"
alias tree "exa -T"
alias tmux "tmux -2"
alias dotfiles "git --git-dir $HOME/.dotfiles/ --work-tree $HOME"

zoxide init --cmd cd fish | source
starship init fish | source
