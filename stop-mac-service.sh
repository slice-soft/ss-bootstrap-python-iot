#!/bin/bash

PLIST_NAME="com.slice.soft.ss-bootstrap.plist"
PLIST_PATH="$HOME/Library/LaunchAgents/$PLIST_NAME"

# Unload and remove
launchctl unload "$PLIST_PATH" 2>/dev/null
rm -f "$PLIST_PATH"

echo "🛑 macOS service stopped and removed: $PLIST_PATH"