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
  fzf-z
)

source $ZSH/oh-my-zsh.sh
source ~/dotfiles/elm-cli-extra.sh

# Vi Mode
bindkey -v

# Aliases
alias vi="nvim"
alias vim="nvim"
alias x="vim \$(fzf)"
alias gitit="git add --all && git commit && git push"
alias tu="cd ~/.talon/user/"
alias zshrc='vim ~/dotfiles/zshrc && source ~/.zshrc'
alias vimrc='vim ~/dotfiles/vimrc'

alias timel='python3 ~/uio/Timelisteskript/timeliste.py Gaute Berge IN2000 16-11-1996'
alias pdfviewer='open -a "Google Chrome" -n --args "chrome-extension://gfbliohnnapiefjpjlpjnehglfpaknnc/pages/pdf_viewer.html"'

function hie-fix {
    rm -rf .stack-work
    stack build
}
