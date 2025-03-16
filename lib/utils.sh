#!/bin/bash

print() {
    MESSAGE=$1
    SEVERITY=$2

    if [ -z "$MESSAGE" ]; then
        print "There seems to be a broken link in the application." "ERROR"
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