#!/usr/bin/env bash


main () {
    # 1. Convert the entire input string to lowercase
    local sentence_lower="${1,,}"

    # 2. Loop through 'a' to 'z'
    for letter in {a..z}; do
        
        if [[ ! "$sentence_lower" =~ "$letter" ]]; then
            echo "false"
            return 0 
        fi
    done

    # 3. If the loop finishes, all letters were found.
    echo "true"
}

main "$@"
