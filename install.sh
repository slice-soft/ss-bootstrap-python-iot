#!/bin/bash

cd "$HOME"
git clone git clone https://github.com/slice-soft/ss-bootstrap-python-iot
cd ss-bootstrap-python-iot
chmod +x *.sh
./run.sh
(crontab -l 2>/dev/null; echo "*/5 * * * * $HOME/app/updater.sh >> $HOME/app/update.log 2>&1") | crontab -