#!/bin/bash

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Read version from the VERSION file
VERSION_FILE="$BASE_DIR/../VERSION"
echo "\n"
echo "InitX-CLI : Skip the setup, start building!"
if [[ -f "$VERSION_FILE" ]]; then
    VERSION=$(cat "$VERSION_FILE")
    echo "\n"
    echo "-------------------------------------"
    echo "│  InitX-CLI                        │"
    echo "│  Skip the setup, start building!  │"
    echo "│  Version: v$VERSION                  │"
    echo "-------------------------------------"
    echo "\n"
else
    echo "\n"
    echo "Version file not found!"
    echo "\n"
    exit 1
fi