#!/bin/bash

# Base Directory - The directory that contains all files for the CLI tool
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Sourcing utils.sh for utilities
source "$BASE_DIR/../lib/utils.sh"

# Commands Directory - The directory that contains all supported commands of the CLI tool
COMMANDS_DIR="$BASE_DIR/../commands"

SUPPORTED_TECH_FILE="$(dirname "${BASH_SOURCE[0]}")/../config/supported_tech"

TECHNOLOGY_OPTION=$1

# If no TECHNOLOGY OPTION is provided, show CLI version and help menu
if [ -z "$TECHNOLOGY_OPTION" ]; then
    # Show CLI version and prompt to navigate help menu for "new" command
    sh "$COMMANDS_DIR/version.sh"
    print "Run 'initx help new' for a list of available options.\n\n"
    exit 1
fi

# Check if the technology exists in supported_tech
if ! grep -Fxq "$TECHNOLOGY_OPTION" "$SUPPORTED_TECH_FILE"; then
    print "'$TECHNOLOGY_OPTION' is not a supported technology." "ERROR"
    print "Run 'initx list tech' to see supported technologies."
    exit 1
fi

case "$TECHNOLOGY_OPTION" in
    # node
    "node")
        sh "$COMMANDS_DIR/new/node.sh" "${@:2}" ;;
    *)
        print "Unsupported tech : $TECHNOLOGY_OPTION for 'initx new'." "ERROR"
        print "Run 'initx list tech' to see supported technologies." ;;
esac