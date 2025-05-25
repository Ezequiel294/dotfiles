set fish_greeting ""

# Aliases
alias tree "exa -T"
alias tmux "tmux -2"
alias grep "grep --color=auto"
alias pi5 "ssh ezequiel@186.159.146.215"
alias ls "exa --group-directories-first"
alias cat "bat --color=always --style=numbers"
alias fzf='fzf --preview "bat --color=always --style=numbers {}"'
alias dotfiles "git --git-dir $HOME/.dotfiles/ --work-tree $HOME"

# Zoxide
zoxide init --cmd cd fish | source

# Starship
starship init fish | source

