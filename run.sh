#!/bin/bash
cd /home/pi/app
python3 run.py &
echo $! > /tmp/app.pid