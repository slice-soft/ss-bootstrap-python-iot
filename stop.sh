#!/bin/bash

PID_FILE="$HOME/ss-bootstrap-python-iot/pid"

OS_TYPE="$(uname)"

if [[ "$OS_TYPE" == "Darwin" ]]; then
  if launchctl list | grep -q "com.slice.soft.ss-bootstrap"; then
    echo "🛑 Deteniendo servicio macOS..."
    "$HOME/ss-bootstrap-python-iot/stop-mac-service.sh"
  fi
elif [[ "$OS_TYPE" == "Linux" ]]; then
  if systemctl --user list-units --type=service | grep -q "ss-bootstrap.service"; then
    echo "🛑 Deteniendo servicio systemd de usuario en Linux..."
    "$HOME/ss-bootstrap-python-iot/stop-linux-service.sh"
  fi
fi

CRON_LINE="$HOME/ss-bootstrap-python-iot/updater.sh"
crontab -l 2>/dev/null | grep -v "$CRON_LINE" | crontab -
echo "🧼 Entrada de crontab para updater.sh eliminada"