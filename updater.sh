#!/bin/bash
cd "$HOME/ss-bootstrap-python-iot"

git reset --hard HEAD >/dev/null 2>&1
git clean -fd >/dev/null 2>&1

OLD=$(git rev-parse HEAD)
git pull origin main >/dev/null 2>&1
NEW=$(git rev-parse HEAD)

timestamp="[$(date '+%Y-%m-%d %H:%M:%S')]"

if [ "$OLD" != "$NEW" ]; then
  echo "$timestamp 🔁 Update detected."

  OS_TYPE="$(uname)"
  if [[ "$OS_TYPE" == "Darwin" ]]; then
    echo "$timestamp ♻️ Restarting macOS service..."
    launchctl stop com.slice.soft.ss-bootstrap
    launchctl start com.slice.soft.ss-bootstrap
  elif [[ "$OS_TYPE" == "Linux" ]]; then
    echo "$timestamp ♻️ Restarting Linux service..."
    export XDG_RUNTIME_DIR="/run/user/$(id -u)"
    USERNAME=$(id -un)
    if loginctl show-user "$USERNAME" >/dev/null 2>&1; then
      systemctl --user restart ss-bootstrap || echo "$timestamp ⚠️ Could not restart. There is probably no active session."
    else
      echo "$timestamp ⚠️ No active session found for $USERNAME. Restart failed."
    fi
  else
    echo "$timestamp ❌ Automatic restart is not supported on this system"
  fi
else
  echo "$timestamp ✅ No changes"
fi
