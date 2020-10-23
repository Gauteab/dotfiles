#!/bin/bash

function elm-run {
    echo -e "import Main exposing (..)\n\"--- OK ---\"\n$1" | elm repl
}

function elm-deamon {
    clear
    elm-run $1
    fswatch -o --event Updated src | while read _
    do
        clear
        elm-run $1
    done
}
