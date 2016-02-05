happy_larry='( ͡° ͜ ͡°)'
neutral_larry='( ͡°_ ͡°)'
grumpy_larry='( ͡°⏠ ͡°)'
very_grumpy_larry='( ͡°Д ͡°)'

function happy_larry() {
    larry_happiness=$(($larry_happiness+1))
}

function grumpy_larry() {
    larry_happiness=$(($larry_happiness-1))
}

function escape_str() {
    # closing bracket character ) is escaped with %
    echo "$1" | sed -r 's/[).]/%&/g'
}

function init_larry() {
    larry_happiness=0
}

function precmd() {
    if [[ "$?" == 0 ]]; then
        if [[ $larry_happiness -gt 0 ]]; then
            larry_happiness=$(($larry_happiness+1))
        else
            larry_happiness=1
        fi
    else
        if [[ $larry_happiness -le 0 ]]; then
            larry_happiness=$(($larry_happiness-1))
        else
            larry_happiness=0
        fi
    fi
    Larry
}

function Larry() {
    if [[ $larry_happiness -gt 0 ]]; then
        LARRY="$(escape_str $happy_larry)"
    elif [[ $larry_happiness -lt "-4" ]]; then
        LARRY="$(escape_str $very_grumpy_larry)"
    else
        LARRY="$(escape_str $grumpy_larry)"
    fi
    PROMPT="%{$fg_bold[yellow]%}$LARRY %{$reset_color%}%# "
}

init_larry
