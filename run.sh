#!/bin/bash
cd "$HOME/ss-bootstrap-python-iot"
python3 run.py &
echo $! > "$HOME/ss-bootstrap-python-iot/pid"