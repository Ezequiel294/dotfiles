bindkey -v

# Aliases
alias ll="ls -l"
alias tree="eza -T"
alias tmux="tmux -2"
alias grep="grep --color=auto"
alias cat="bat --color=always"
alias ls="eza --group-directories-first"
alias pi5='ssh ezequiel@186.159.146.215 -p 2222'
alias fzf='fzf --preview "bat --color=always --style=numbers {}"'
alias ttu='cd /Users/ezequiel/Library/CloudStorage/ProtonDrive-ezequielbuckmartinez@proton.me-folder/TTU'
alias dotfiles="git --git-dir $HOME/.dotfiles/ --work-tree $HOME"

# Starship Prompt
eval "$(starship init zsh)"

# Zsh Enhancements
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete
