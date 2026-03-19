# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ezequiel/.zshrc'
# Initialize the completion system
autoload -U compinit && compinit
setopt menu_complete                     # Automatically list the menu on ambiguous completion
zstyle ':completion:*' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' insert-tab false  # Don't insert a literal tab if no match
# End of lines added by compinstall

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias ll="ls -l"
alias tree="eza -T"
alias tmux="tmux -2"
alias ani-cli="ani-cli -v"
alias grep="grep --color=auto"
alias cat="bat --color=always"
alias ttu="cd /home/ezequiel/Drive/TTU"
alias ls="eza --group-directories-first"
alias pi5='ssh ezequiel@186.159.146.215 -p 2222'
alias fzf='fzf --preview "bat --color=always --style=numbers {}"'
alias dotfiles="git --git-dir $HOME/.dotfiles/ --work-tree $HOME"

# Start nvm
. /usr/share/nvm/init-nvm.sh

# Enable miniconda3
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# Start starship prompt
eval "$(starship init zsh)"

# Start windows ssh conection
eval "$(/usr/sbin/wsl2-ssh-agent)"

# GPU settings
export GALLIUM_DRIVER=d3d12
export LIBVA_DRIVER_NAME=d3d12
