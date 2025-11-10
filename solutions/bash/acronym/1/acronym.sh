#!/usr/bin/env bash

main () {
    local phrase="$*"
    
    # 1. Replace hyphens (-) and underscores (_) with spaces to use them as word delimiters
    phrase="${phrase//-/_}"
    phrase="${phrase//_/ }"

    # 2. Remove all remaining punctuation from the string using POSIX character
    local clean_phrase="${phrase//[[:punct:]]/}"
    
    local acronym=""
    # 3. Iterate over the words in the clean phrase (using default word splitting IFS)
    for word in $clean_phrase; do
        # Append the first character of each word to the acronym variable
        acronym+="${word:0:1}"
    done

    # 4. Print the final acronym in uppercase
    echo "${acronym^^}"
}

main "$@"
