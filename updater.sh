#!/bin/bash
cd "$HOME/ss-bootstrap-python-iot"
OLD=$(git rev-parse HEAD)
git pull origin main >/dev/null 2>&1
NEW=$(git rev-parse HEAD)

timestamp="[$(date '+%Y-%m-%d %H:%M:%S')]"

if [ "$OLD" != "$NEW" ]; then
  echo "$timestamp 🔁 Actualización detectada."

  OS_TYPE="$(uname)"
  if [[ "$OS_TYPE" == "Darwin" ]]; then
    echo "$timestamp ♻️ Reiniciando servicio macOS..."
    launchctl stop com.slice.soft.ss-bootstrap
    launchctl start com.slice.soft.ss-bootstrap
  elif [[ "$OS_TYPE" == "Linux" ]]; then
    echo "$timestamp ♻️ Reiniciando servicio Linux..."
    # Evitar errores si no hay sesión activa (como en cron)
    export XDG_RUNTIME_DIR="/run/user/$(id -u)"
    if loginctl show-user "$USER" >/dev/null 2>&1; then
      systemctl --user restart ss-bootstrap || echo "$timestamp ⚠️ No se pudo reiniciar. Probablemente no hay sesión activa."
    else
      echo "$timestamp ⚠️ No hay sesión activa para $USER. Reinicio fallido."
    fi
  else
    echo "$timestamp ❌ Sistema no soportado para reinicio automático"
  fi
else
  echo "$timestamp ✅ Sin cambios"
fi