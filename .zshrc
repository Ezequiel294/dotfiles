bindkey -v

## Starship Prompt
eval "$(starship init zsh)"

## Zsh Enhancements
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

## Aliases
alias ll="ls -l"
alias tree="eza -T"
alias tmux="tmux -2"
alias grep="grep --color=auto"
alias cat="bat --color=always"
alias ls="eza --group-directories-first"
alias fzf='fzf --preview "bat --color=always --style=numbers {}"'
alias dotfiles="git --git-dir $HOME/.dotfiles/ --work-tree $HOME"
alias drive='cd /Users/ezequiel/Library/CloudStorage/ProtonDrive-ezequielbuckmartinez@proton.me-folder'
alias ttu='cd /Users/ezequiel/Library/CloudStorage/ProtonDrive-ezequielbuckmartinez@proton.me-folder/TTU'
alias pi5='ssh -i ~/Library/CloudStorage/ProtonDrive-ezequielbuckmartinez@proton.me-folder/SSH/Raspberry\ Pi/private-key ezequiel@186.159.146.215 -p 64712'

## Env Variables 
# Java
export JAVA_HOME="/opt/homebrew/opt/openjdk@26/libexec/openjdk.jdk/Contents/Home"
export PATH=$JAVA_HOME/bin:$PATH
# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
