
alias kc='kotlinc'
alias kt='kotlin'

alias ks='kscript'
function kaw {
	x="lines.$1.also(::println)"
	kscript -t $x $2
}
