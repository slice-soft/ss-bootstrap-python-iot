#!/bin/bash

PLIST_NAME="com.slice.soft.ss-bootstrap.plist"
PLIST_PATH="$HOME/Library/LaunchAgents/$PLIST_NAME"
PYTHON_EXEC="/usr/bin/python3"
PYTHON_SCRIPT="$HOME/ss-bootstrap-python-iot/run.py"
LOG_PATH="$HOME/ss-bootstrap-python-iot/log.txt"

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
    <string>$PYTHON_EXEC</string>
    <string>$PYTHON_SCRIPT</string>
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

launchctl unload "$PLIST_PATH" 2>/dev/null
launchctl load "$PLIST_PATH"

echo "✅ Servicio macOS creado y cargado: $PLIST_PATH"