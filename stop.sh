#!/bin/bash
PID_FILE="$HOME/ss-bootstrap-python-iot/pid"
[ -f "$PID_FILE" ] && kill $(cat "$PID_FILE") && rm "$PID_FILE"