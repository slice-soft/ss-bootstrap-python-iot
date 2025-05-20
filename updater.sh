#!/bin/bash
cd "$HOME/ss-bootstrap-python-iot"
OLD=$(git rev-parse HEAD)
git pull origin main
NEW=$(git rev-parse HEAD)

timestamp="[$(date '+%Y-%m-%d %H:%M:%S')]"

if [ "$OLD" != "$NEW" ]; then
  echo "$timestamp 🔁 Actualización detectada. Reiniciando..."
  ./stop.sh
  ./run.sh
else
  echo "$timestamp ✅ Sin cambios"
fi