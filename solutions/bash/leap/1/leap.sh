#!/usr/bin/env bash

# Function checks if the input year is a leap year
main () {
    if (( $# != 1 )) || ! [[ "$1" =~ ^[0-9]+$ ]]; then
        echo "Usage: leap.sh <year>"
        exit 1
    fi

    # Assign the input year
    local year=$1

    # Check the leap year
    if (( (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) )); then
        echo "true"
    else
        echo "false"
    fi
}

main "$@"
