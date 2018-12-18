export ZSH="/home/gaute/.oh-my-zsh"
export SCRIPTS="/home/gaute/ubuntu_env/scripts"

ZSH_THEME="robbyrussell"

plugins=(
  git
  z
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh
alias zshrc='vim ~/.zshrc && source ~/.zshrc'
alias ls='ls -p --color'

setxkbmap -option caps:escape
source <(cat $SCRIPTS/*.sh)
