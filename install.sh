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
# ejecutar el script de instalación
"$INSTALL_DIR/run.sh"
(crontab -l 2>/dev/null; echo "*/5 * * * * $HOME/ss-bootstrap-python-iot/updater.sh >> $HOME/ss-bootstrap-python-iot/update.log 2>&1") | crontab -