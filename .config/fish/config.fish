set fish_greeting ""

# Aliases
alias grep "grep --color=auto"
alias cat "bat"
alias ls "exa --group-directories-first"
alias tree "exa -T"
alias tmux "tmux -2"
alias dotfiles "git --git-dir $HOME/.dotfiles/ --work-tree $HOME"

# Zoxide
zoxide init --cmd cd fish | source

# Starship
starship init fish | source
