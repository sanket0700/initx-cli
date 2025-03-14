#!/bin/bash

cat <<EOF


Usage:
  initx <command> [options]

Commands:
  new       Create a new project (e.g., \`initx new node my-app\`)
  list      Show available templates and supported technologies
  config    Manage InitX configurations (e.g., \`initx config set default_tech node\`)
  help      Show detailed help for a command (e.g., \`initx help new\`)
  version   Show InitX version

Options:
  -h, --help       Show this help menu
  -v, --version    Show the current InitX version

For more details on a specific command, run:
  initx help <command>

Example:
  initx new node my-app --typescript --docker


EOF
