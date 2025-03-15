#!/bin/bash

set -e  # Exit on error

# Define variables
REPO_URL="https://github.com/sanket0700/initx-cli.git"
INSTALL_DIR_USER="$HOME/.local/bin"
INSTALL_DIR_GLOBAL="/usr/local/bin"
INSTALL_DIR=""
CONFIG_DIR="$HOME/.config/initx"
REPO_CONFIG_FILE="$CONFIG_DIR/initx.conf"
PROJECTS_FILE="$CONFIG_DIR/projects.txt"

# Welcome message
clear
echo ""
echo "-----------------------------------------------"
echo "|            Welcome to InitX-CLI!            |"
echo "| InitX-CLI - Skip the setup, start building! |"
echo "-----------------------------------------------"
echo ""

# Determine install mode
echo "Install InitX-CLI for:"
echo "  1) Current user (Recommended)"
echo "  2) All users (Requires sudo)"
read -p "Enter choice [1/2]: " choice

if [[ "$choice" == "2" ]]; then
    INSTALL_DIR="$INSTALL_DIR_GLOBAL"
    SUDO="sudo"
else
    INSTALL_DIR="$INSTALL_DIR_USER"
    SUDO=""
fi

echo ""
echo "Installing to: $INSTALL_DIR..."
echo ""

# Ensure install directory exists
mkdir -p "$INSTALL_DIR"

# Clone or update the repository
if [[ -d "$INSTALL_DIR/initx-cli" ]]; then
    echo "- 🔄 Updating InitX-CLI..."
    cd "$INSTALL_DIR/initx-cli" && git pull
else
    echo "- Cloning InitX-CLI..."
    git clone "$REPO_URL" "$INSTALL_DIR/initx-cli"
fi

# Ensure correct permissions
$SUDO chmod +x "$INSTALL_DIR/initx-cli/bin/initx"

# Create a symlink in the install directory
$SUDO ln -sf "$INSTALL_DIR/initx-cli/bin/initx" "$INSTALL_DIR/initx"

# Ensure the install directory is in the PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$HOME/.bashrc"
    echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$HOME/.zshrc"
    echo "- Added InitX-CLI to PATH. Restart your terminal or run 'source ~/.bashrc'"
fi

# Setup config directory
mkdir -p "$CONFIG_DIR"
touch "$REPO_CONFIG_FILE"

# Ensure projects.txt exists
if [[ ! -f "$PROJECTS_FILE" ]]; then
    echo "- Creating projects tracking file..."
    touch "$PROJECTS_FILE"
fi

echo ""
echo "-----------------------------------------------"
echo "|      InitX-CLI installed successfully!      |"
echo "|      Run 'initx help' to get started..      |"
echo "-----------------------------------------------"
echo ""
