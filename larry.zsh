# TODO very_* should go to neutral on state switch
very_happy_larry='(  ͡ ͜  ͡)'
happy_larry='( ͡° ͜ ͡°)'
neutral_larry='( ͡°_ ͡°)'
grumpy_larry='( ͡°⏠ ͡°)'
very_grumpy_larry='( ͡°Д ͡°)'

LARRY_MARKER="{{LARRY}}"

function happy_larry() {
    larry_happiness=$(($larry_happiness+4))
}

function grumpy_larry() {
    larry_happiness=$(($larry_happiness-5))
    return 1
}

function escape_str() {
    # closing bracket character ) is escaped with %
    echo "$1" | sed -r 's/[).]/%&/g'
}


function larry_prompt_interp(){
    declare -r local to_parse="$1"
    declare -r local larry="$2"
    echo "$to_parse" | sed s/"$LARRY_MARKER"/"$larry"/
}

function Larry() {
    if [[ $larry_happiness -gt 4 ]]; then
        LARRY="$(escape_str $very_happy_larry)"
    elif [[ $larry_happiness -gt 0 ]]; then
        LARRY="$(escape_str $happy_larry)"
    elif [[ $larry_happiness -lt "-4" ]]; then
        LARRY="$(escape_str $very_grumpy_larry)"
    else
        LARRY="$(escape_str $grumpy_larry)"
    fi
    PROMPT="$(larry_prompt_interp $LARRY_BKUP_PROMPT $LARRY)"
    RPROMPT="$(larry_prompt_interp $LARRY_BKUP_RPROMPT $LARRY)"
}

function larry_precmd() {
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

# add larry precmd to precmds to be executed
typeset -a precmd_functions
precmd_functions+=larry_precmd

function init_larry() {
    larry_happiness=0
    LARRY_BKUP_PROMPT="$PROMPT"
    LARRY_BKUP_RPROMPT="$RPROMPT"
}

init_larry
