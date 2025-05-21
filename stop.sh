#!/bin/bash

PID_FILE="$HOME/ss-bootstrap-python-iot/pid"

# Detectar sistema operativo
OS_TYPE="$(uname)"

# Verificar si el servicio está instalado
if [[ "$OS_TYPE" == "Darwin" ]]; then
  if launchctl list | grep -q "com.slice.soft.ss-bootstrap"; then
    echo "🛑 Deteniendo servicio macOS..."
    "$HOME/ss-bootstrap-python-iot/stop-mac-service.sh"
    exit 0
  fi
elif [[ "$OS_TYPE" == "Linux" ]]; then
  if systemctl --user list-units --type=service | grep -q "ss-bootstrap.service"; then
    echo "🛑 Deteniendo servicio systemd de usuario en Linux..."
    "$HOME/ss-bootstrap-python-iot/stop-linux-service.sh"
    exit 0
  fi
fi