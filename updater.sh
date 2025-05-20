#!/bin/bash
cd /home/pi/app
OLD=$(git rev-parse HEAD)
git pull origin main
NEW=$(git rev-parse HEAD)

if [ "$OLD" != "$NEW" ]; then
  echo "🔁 Actualización detectada. Reiniciando..."
  ./stop.sh
  ./run.sh
else
  echo "✅ Sin cambios"
fi