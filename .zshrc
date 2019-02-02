# == ZSH ==
export ZSH="/home/gaute/.oh-my-zsh"
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
export SCRIPTS="/home/gaute/ubuntu_env/scripts"
export VIM='~/.vim'
export VIMRUNTIME='/usr/share/vim/vim80'
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# == Source other scripts ==
source $ZSH/oh-my-zsh.sh
source <(cat $SCRIPTS/*.sh)

# == Aliases ==
alias zshrc='vim ~/.zshrc && source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias ls='ls -p --color'
alias lsa='ls -a'
alias get='sudo apt-get'
alias apt='sudo apt'
alias open='xdg-open'
alias version='lsb_release -a'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/gaute/.sdkman"
[[ -s "/home/gaute/.sdkman/bin/sdkman-init.sh" ]] && source "/home/gaute/.sdkman/bin/sdkman-init.sh"

