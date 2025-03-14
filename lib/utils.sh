#!/bin/bash

print() {
    MESSAGE=$1
    SEVERITY=$2

    if [ -z "$MESSAGE" ]; then
        print "ERROR" "There seems to be a broken link in the application."
    fi

    case "$SEVERITY" in
        # ERROR
        "ERROR")
            echo "[ERROR] $MESSAGE" ;;
        # WARNING
        "WARNING")
            echo "[WARNING] $MESSAGE" ;;
        "SUCCESS")
            echo "[SUCCESS] $MESSAGE" ;;
        *)
            echo "$MESSAGE" ;;
    esac
}