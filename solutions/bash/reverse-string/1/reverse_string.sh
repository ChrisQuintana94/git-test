#!/usr/bin/env bash

# This function reverses the input string.
main () {
    local input="$1"
    local len=${#input}
    local reversed_string=""

    for (( i=$len-1; i>=0; i-- )); do
        reversed_string+="${input:$i:1}"
    done

    echo "$reversed_string"
}

main "$@"
