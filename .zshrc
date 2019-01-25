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
alias get='sudo apt-get'
alias apt='sudo apt'

setxkbmap -option caps:escape
source <(cat $SCRIPTS/*.sh)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'
export VIM='~/.vim'
export VIMRUNTIME='/usr/share/vim/vim80'
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/gaute/.sdkman"
[[ -s "/home/gaute/.sdkman/bin/sdkman-init.sh" ]] && source "/home/gaute/.sdkman/bin/sdkman-init.sh"
