export TERM="xterm-256color"

# == ZSH ==
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

# == ZSH Plugins ==
plugins=(
  git
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages
)

# == Change CAPS to ESC ==
setxkbmap -option caps:escape

# == Environment Configuration ==
export SCRIPTS="/$HOME/ubuntu_env/scripts"
export VIM='~/.vim'
export VIMRUNTIME='/usr/share/vim/vim80'
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

set -o vi

# == Source other scripts ==
source $ZSH/oh-my-zsh.sh
source <(cat $SCRIPTS/*.sh)

# == Aliases ==
alias zshrc='vim ~/.zshrc && source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias get='sudo apt-get'
alias apt='sudo apt'
alias open='xdg-open'
alias version='lsb_release -a'

## -- LS --
alias ls='ls -p --color'
alias la='ls -a'
alias l='ls -l'
alias ll='ls -la'

# SDKMAN
export SDKMAN_DIR="/home/gaute/.sdkman"
[[ -s "/home/gaute/.sdkman/bin/sdkman-init.sh" ]] && source "/home/gaute/.sdkman/bin/sdkman-init.sh"
