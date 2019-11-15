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

# Vi Mode
bindkey -v

# Aliases
alias vi="nvim"
alias vim="nvim"
alias x="vim \$(fzf)"
alias gitit="git add --all && git commit && git push"
