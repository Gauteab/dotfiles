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
  extract
  web-search
)

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/bashrc

# make CapsLock behave like Ctrl:
setxkbmap -option ctrl:nocaps
# make short-pressed Ctrl behave like Escape:
xcape -e 'Control_L=Escape'

# NASM helper
function nsm { nasm -felf64 $1.asm; gcc -no-pie $1.o; ./a.out; rm -rf $1.o a.out }
alias calc='java -jar ~/work/Calcula/out/jar/Calc.jar'

# Vi Mode
bindkey -v

export VIMRUNTIME='/usr/share/vim/vim80'
export PATH=$HOME/.cargo/bin:$PATH
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'
export PATH=$JAVA_HOME/bin:$PATH
