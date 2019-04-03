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

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/bashrc

# Vi Mode
bindkey -v

export VIMRUNTIME='/usr/share/vim/vim80'
export PATH=$HOME/.cargo/bin:$PATH
export JAVA_HOME='/usr/lib/jvm/jdk-u8191'
export PATH=$JAVA_HOME/bin:$PATH

# SDKMAN
export SDKMAN_DIR="/home/gaute/.sdkman"
[[ -s "/home/gaute/.sdkman/bin/sdkman-init.sh" ]] && source "/home/gaute/.sdkman/bin/sdkman-init.sh"
