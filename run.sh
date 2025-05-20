#!/bin/bash

cd "$HOME/ss-bootstrap-python-iot"

# Verificar si ya hay un proceso corriendo
if [ -f pid ] && ps -p $(cat pid) > /dev/null 2>&1; then
  echo "⚠️  El proceso ya está en ejecución con PID $(cat pid)."
  exit 1
fi

# Ejecutar el script y guardar el nuevo PID
python3 run.py &
echo $! > pid
echo "✅ run.py iniciado con PID $(cat pid)"