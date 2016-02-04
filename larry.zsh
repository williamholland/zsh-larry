happy_larry='( ͡° ͜ ͡°)'
grumpy_larry='( ͡°⏠ ͡°)'

function happy_larry() {
    return 0
}

function grumpy_larry() {
    return 1
}

# closing bracket character ) is escaped with %
grumpy_larry="$(echo $grumpy_larry | sed 's/)/%)/')"

# if exit zero then happy_larry else grumpy_larry
LARRY="%(?."$happy_larry"."$grumpy_larry")"
