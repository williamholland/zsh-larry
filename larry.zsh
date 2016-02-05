happy_larry='( ͡° ͜ ͡°)'
grumpy_larry='( ͡°⏠ ͡°)'

function happy_larry() {
    return 0
}

function grumpy_larry() {
    return 1
}

function escape_str() {
    # closing bracket character ) is escaped with %
    echo "$1" | sed -r 's/[).]/%&/g'
}

function Larry() {
    grumpy_larry="$(escape_str $grumpy_larry)"
    # if exit zero then happy_larry else grumpy_larry
    LARRY="%(?."$happy_larry"."$grumpy_larry")"
}

Larry
