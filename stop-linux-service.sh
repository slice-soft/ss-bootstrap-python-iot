#!/bin/bash

SERVICE_NAME="ss-bootstrap"
SYSTEMD_USER_DIR="$HOME/.config/systemd/user"
SERVICE_FILE="$SYSTEMD_USER_DIR/$SERVICE_NAME.service"

systemctl --user stop "$SERVICE_NAME"
systemctl --user disable "$SERVICE_NAME"
rm -f "$SERVICE_FILE"

echo "🛑 Service stopped and removed: $SERVICE_FILE"