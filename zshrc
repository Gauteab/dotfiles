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
alias gitit="git add --all && git commit && git push"
alias zshrc='vim ~/dotfiles/zshrc && source ~/.zshrc'
alias vimrc='vim ~/dotfiles/vimrc'
alias l='clear; exa -la --group-directories-first'
alias ls='exa'
alias tree='exa -l -T'
alias skim='open -a "Skim" thesis.pdf'

alias timel='python3 ~/uio/Timelisteskript/timeliste.py Gaute Berge IN2000 16-11-1996'
alias pdfviewer='open -a "Google Chrome" -n --args "chrome-extension://gfbliohnnapiefjpjlpjnehglfpaknnc/pages/pdf_viewer.html"'

function hie-fix {
    rm -rf .stack-work
    stack build
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

source ~/.fzf.zsh
bindkey '^X' fzf-cd-widget
export FZF_DEFAULT_COMMAND='fd --type f '
# export FZF_DEFAULT_COMMAND='fd --hidden --type f --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --hidden --type d"

DISABLE_AUTO_TITLE="true"
set_title() {
    echo -e "\033];$@\007"
}

tw() {
    echo "file type: $1"
    echo "watching $2"
    fswatch -0 --event Updated $2 | while read -d "" event 
    do
        echo "changed: $event"
        python ./extract_functions.py $1 $event
    done
}
