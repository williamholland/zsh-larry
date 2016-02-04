happy_larry='( ͡° ͜ ͡°)'
grumpy_larry='( ͡°⏠ ͡°)'

function happy_larry() {
    return 0
}

function grumpy_larry() {
    return 1
}

# if exit zero then happy_larry else grumpy_larry
LARRY="%(?."$happy_larry"."$grumpy_larry")"

toggle=false
function precmd() {
    if $toggle; then
        grumpy_larry='( ͡°Д ͡°)'
        toggle=false
    else
        grumpy_larry='( ͡°⏠ ͡°)'
        toggle=true
    fi
    grumpy_larry="$(echo $grumpy_larry | sed 's/)/%)/')"
    LARRY="%(?."$happy_larry"."$grumpy_larry")"
    PROMPT="%{$fg_bold[yellow]%}$LARRY %{$reset_color%}%# "
}
