# Aliases
alias dotfiles="git --git-dir $HOME/.dotfiles/ --work-tree $HOME"

# Starship Prompt
eval "$(starship init zsh)"

# Zsh Enhancements
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete
