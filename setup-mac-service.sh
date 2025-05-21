#!/bin/bash

PLIST_NAME="com.slice.soft.ss-bootstrap.plist"
PLIST_PATH="$HOME/Library/LaunchAgents/$PLIST_NAME"
RUN_SCRIPT="$HOME/ss-bootstrap-python-iot/run.sh"
LOG_PATH="$HOME/ss-bootstrap-python-iot/log.txt"

# Crear el .plist
cat > "$PLIST_PATH" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN"
 "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.slice.soft.ss-bootstrap</string>

  <key>ProgramArguments</key>
  <array>
    <string>$RUN_SCRIPT</string>
  </array>

  <key>WorkingDirectory</key>
  <string>$HOME/ss-bootstrap-python-iot</string>

  <key>StandardOutPath</key>
  <string>$LOG_PATH</string>
  <key>StandardErrorPath</key>
  <string>$LOG_PATH</string>

  <key>RunAtLoad</key>
  <true/>

  <key>KeepAlive</key>
  <true/>
</dict>
</plist>
EOF

# Dar permisos de ejecución por si acaso
chmod +x "$RUN_SCRIPT"

# Recargar y cargar el agente
launchctl unload "$PLIST_PATH" 2>/dev/null
launchctl load "$PLIST_PATH"

echo "✅ Servicio macOS creado y cargado: $PLIST_PATH"