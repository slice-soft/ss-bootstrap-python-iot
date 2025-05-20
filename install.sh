#!/bin/bash

cd "$HOME"
git clone https://github.com/slice-soft/ss-bootstrap-python-iot
cd ss-bootstrap-python-iot
chmod +x *.sh
./run.sh
(crontab -l 2>/dev/null; echo "*/5 * * * * $HOME/ss-bootstrap-python-iot/updater.sh >> $HOME/ss-bootstrap-python-iot/update.log 2>&1") | crontab -