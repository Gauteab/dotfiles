
alias kc='kotlinc'
alias kt='kotlin'

alias ks='kscript'
function kaw {	
	kscript -t "lines.$1.also(::println)" $2
}
