#!/bin/bash

OS_TYPE="$(uname)"

if [[ "$OS_TYPE" == "Darwin" ]]; then
  if launchctl list | grep -q "com.slice.soft.ss-bootstrap"; then
    echo "🛑 Stopping macOS service..."
    "$HOME/ss-bootstrap-python-iot/stop-mac-service.sh"
  fi
elif [[ "$OS_TYPE" == "Linux" ]]; then
  if systemctl --user list-units --type=service | grep -q "ss-bootstrap.service"; then
    echo "🛑 Stopping Linux user systemd service..."
    "$HOME/ss-bootstrap-python-iot/stop-linux-service.sh"
  fi
fi

CRON_LINE="$HOME/ss-bootstrap-python-iot/updater.sh"
crontab -l 2>/dev/null | grep -v "$CRON_LINE" | crontab -
echo "🧼 Crontab entry for updater.sh removed"
