#!/bin/bash

cd "$HOME/ss-bootstrap-python-iot"
OS_TYPE="$(uname)"

if [[ "$OS_TYPE" == "Darwin" ]]; then
  PLIST_PATH="$HOME/Library/LaunchAgents/com.slice.soft.ss-bootstrap.plist"
  if [ ! -f "$PLIST_PATH" ]; then
    echo "🛠️ Configurando servicio macOS..."
    ./setup-mac-service.sh
  fi
  echo "🟢 Servicio macOS ya está instalado. Ejecutándose o se iniciará al reiniciar sesión."
  exit 0
elif [[ "$OS_TYPE" == "Linux" ]]; then
  SERVICE_FILE="$HOME/.config/systemd/user/ss-bootstrap.service"
  if [ ! -f "$SERVICE_FILE" ]; then
    echo "🛠️ Configurando servicio systemd de usuario en Linux..."
    ./setup-linux-service.sh
  fi
  echo "🟢 Servicio Linux ya está instalado. Ejecutándose o se iniciará con el sistema."
  exit 0
else
  echo "❌ Sistema operativo no soportado: $OS_TYPE"
  exit 1
fi