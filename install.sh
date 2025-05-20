#!/bin/bash

cd ~
git clone https://github.com/tuusuario/raspi-vehiculo-bootstrap app
cd app
chmod +x *.sh
./run.sh
(crontab -l 2>/dev/null; echo "*/5 * * * * /home/pi/app/updater.sh >> /home/pi/app/update.log 2>&1") | crontab -