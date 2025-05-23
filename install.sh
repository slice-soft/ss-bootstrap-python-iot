#!/bin/bash

REPO_URL="https://github.com/slice-soft/ss-bootstrap-python-iot"
INSTALL_DIR="$HOME/ss-bootstrap-python-iot"

# Clonar el repositorio solo si no existe
if [ ! -d "$INSTALL_DIR" ]; then
  cd "$HOME"
  git clone "$REPO_URL"
else
  echo "📁 El repositorio ya existe en $INSTALL_DIR. Se omitió la clonación."
fi

find "$INSTALL_DIR" -maxdepth 1 -name "*.sh" -exec chmod +x {} \;
"$INSTALL_DIR/run.sh"
CRON_JOB="*/5 * * * * bash $INSTALL_DIR/updater.sh >> $INSTALL_DIR/ss-bootstrap-events.log 2>&1"
(crontab -l 2>/dev/null | grep -F "bash $INSTALL_DIR/updater.sh") >/dev/null 2>&1 || (
  (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
  echo "🕔 Cron registrado para updater.sh cada 5 minutos"
)