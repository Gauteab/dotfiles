
# == Change CAPS to ESC ==
setxkbmap -option caps:escape

# == Environment Configuration ==
export DOTFILES="$HOME/dotfiles"
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

alias ifi='ssh -X gauteab@login.ifi.uio.no'
alias e='echo'

# == Tools ==
alias pdf='libreoffice --headless --invisible --convert-to pdf'

function tgz { 
  tar -cvzf ${1%/}.tgz $1 
}

function xtgz {
  tar -xvzf $1
}

# == LS ==
alias ls='ls -p --color'
alias la='ls -a'
alias l='ls -l'
alias ll='ls -la'

