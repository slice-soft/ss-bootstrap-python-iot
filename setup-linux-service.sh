#!/bin/bash

SERVICE_NAME="ss-bootstrap"
SYSTEMD_USER_DIR="$HOME/.config/systemd/user"
SERVICE_FILE="$SYSTEMD_USER_DIR/$SERVICE_NAME.service"
RUN_SCRIPT="$HOME/ss-bootstrap-python-iot/run.sh"
LOG_PATH="$HOME/ss-bootstrap-python-iot/log.txt"

mkdir -p "$SYSTEMD_USER_DIR"

cat > "$SERVICE_FILE" <<EOF
[Unit]
Description=SliceSoft Bootstrap IoT Service
After=network.target

[Service]
ExecStart=$RUN_SCRIPT
WorkingDirectory=$HOME/ss-bootstrap-python-iot
StandardOutput=append:$LOG_PATH
StandardError=append:$LOG_PATH
Restart=always

[Install]
WantedBy=default.target
EOF

# Activar e iniciar servicio como usuario
systemctl --user daemon-reload
systemctl --user enable "$SERVICE_NAME"
systemctl --user start "$SERVICE_NAME"

echo "✅ Servicio de usuario creado y activado: $SERVICE_FILE"