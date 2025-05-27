#!/bin/bash

check_dependency() {
    local cmd="$1"
    local install_msg="$2"

    if ! command -v "$cmd" &> /dev/null; then
        echo "$cmd is not installed."
        echo "  - $install_msg"
        return 1
    else
        echo "$cmd is installed: $($cmd --version 2>/dev/null | head -n 1)"
        return 0
    fi
}

check_prerequisites() {
    echo "Checking system pre-requisites..."
    
    local missing=0

    check_dependency "git" "Install Git: sudo apt install git (Linux) | brew install git (macOS) | https://git-scm.com/" || missing=1
    check_dependency "docker" "Install Docker: https://docs.docker.com/get-docker/" || missing=1
    check_dependency "python3" "Install Python3: sudo apt install python3 (Linux) | brew install python3 (macOS) | https://python.org/downloads/" || missing=1

    if [[ "$missing" -eq 1 ]]; then
        echo "Some dependencies are missing. Please install them before proceeding."
        exit 1
    fi

    echo "All dependencies are installed. Proceeding..."
}
