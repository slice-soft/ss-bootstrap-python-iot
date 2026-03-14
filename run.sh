#!/bin/bash

cd "$HOME/ss-bootstrap-python-iot"
OS_TYPE="$(uname)"

if [[ "$OS_TYPE" == "Darwin" ]]; then
  PLIST_PATH="$HOME/Library/LaunchAgents/com.slice.soft.ss-bootstrap.plist"
  if [ ! -f "$PLIST_PATH" ]; then
    echo "🛠️ Configuring macOS service..."
    ./setup-mac-service.sh
  fi
  echo "🟢 macOS service is already installed. It is running or will start on login."
  exit 0
elif [[ "$OS_TYPE" == "Linux" ]]; then
  SERVICE_FILE="$HOME/.config/systemd/user/ss-bootstrap.service"
  if [ ! -f "$SERVICE_FILE" ]; then
    echo "🛠️ Configuring the Linux user systemd service..."
    ./setup-linux-service.sh
  fi
  echo "🟢 Linux service is already installed. It is running or will start with the system."
  exit 0
else
  echo "❌ Unsupported operating system: $OS_TYPE"
  exit 1
fi
