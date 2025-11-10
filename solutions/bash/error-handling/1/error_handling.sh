#!/usr/bin/env bash

main() {
    # Positional arguments passed to the script
    if [ "$#" -ne 1 ]; then
        echo "Usage: error_handling.sh <person>"
        # Exit with a non-zero
        exit 1
    else
        echo "Hello, $1"
    fi
}

main "$@"
