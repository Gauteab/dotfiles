
# == Change CAPS to ESC ==
setxkbmap -option caps:escape

# == Environment Configuration ==
export DOTFILES="$HOME/ubuntu_env"
export SCRIPTS="/$DOTFILES/scripts"
export VIM="~/.vim"

# == Source other scripts ==
source <(cat $SCRIPTS/*.sh)

# == Aliases ==
alias zshrc='vim ~/.zshrc && source ~/.zshrc'
alias bashrc='vim ~/.bashrc && source ~/.bashrc'
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

