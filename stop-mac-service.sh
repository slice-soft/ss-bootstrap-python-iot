#!/bin/bash

PLIST_NAME="com.slice.soft.ss-bootstrap.plist"
PLIST_PATH="$HOME/Library/LaunchAgents/$PLIST_NAME"

# Descargar y eliminar
launchctl unload "$PLIST_PATH" 2>/dev/null
rm -f "$PLIST_PATH"

echo "🛑 Servicio macOS detenido y eliminado: $PLIST_PATH"