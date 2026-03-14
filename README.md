# ss-bootstrap-python-iot

Automatic bootstrap system for Raspberry Pi Zero W and other embedded devices, built by [SliceSoft](https://github.com/slicesoft) as a base for automation testing, remote updates, and continuous execution of IoT logic in Python.

---

## Description

This repository contains a simple agent that:

- Runs a periodic task (logged to a file)
- Can be started automatically with a single command
- Includes automatic update logic via `git pull`

---

## Quick Installation

On your Raspberry Pi (running Raspberry Pi OS Lite) or any Linux system, run:

```bash
wget -O - https://raw.githubusercontent.com/slice-soft/ss-bootstrap-python-iot/main/install.sh | bash
```

🔧 This will:
1. Clone the repository into your home directory (`$HOME/ss-bootstrap-python-iot`)
2. Grant execute permissions to the scripts
3. Run `run.py` as a service
4. Register the updater in `crontab` every 5 minutes

> ⚠️ **Note:** macOS support is still under development and is not a priority, since the main target is Raspberry Pi and Linux systems.

---

## What Does the Agent Do?

Every minute it:
- Writes a line to `$HOME/ss-bootstrap-python-iot/ss-bootstrap.log`
- Simulates activity from a connected device
- Can be monitored with:

```bash
tail -f ~/ss-bootstrap-python-iot/ss-bootstrap.log
```

---

## Main Files

| File                     | Purpose                                               |
|--------------------------|------------------------------------------------------|
| `run.py`                 | Main script containing the runtime logic             |
| `run.sh`                 | Starts the script and configures the service         |
| `stop.sh`                | Stops the process if it is running                   |
| `updater.sh`             | Checks for repository changes and restarts the app   |
| `install.sh`             | Automates the full initial setup                     |
| `setup-mac-service.sh`   | Configures the agent service on macOS                |
| `setup-linux-service.sh` | Configures the agent service on Linux (systemd)      |
| `stop-mac-service.sh`    | Stops and removes the macOS service                  |
| `stop-linux-service.sh`  | Stops and removes the Linux systemd service          |
| `.gitignore`             | Ignores log and PID files                            |

---

## Requirements

- Raspberry Pi OS Lite (32-bit) or any modern Linux distribution
- Python 3
- Internet access through Wi-Fi or Ethernet
- Git installed (included by default in the official image)

---

## Example Output (`ss-bootstrap.log`)

```
[2025-05-20 14:10:01] ✅ System running V0.0.3
[2025-05-20 14:11:01] ✅ System running V0.0.3
```

---

## Next Steps

This repository is designed to be extended with:
- Real sensor readings (GPS, temperature, motion)
- Data delivery to a backend over HTTP or MQTT
- Physical indicators (LEDs, buzzers, displays)

---

## License

MIT — this project is free to use, modify, and share.

---

## Optional Maintenance Scripts

These scripts can be useful during manual testing:

- `stop.sh`: Stops the main process if it was started manually
- `stop-mac-service.sh`: Removes the macOS service (`launchctl`)
- `stop-linux-service.sh`: Removes the Linux user service (`systemctl --user`)

⚠️ In production these are usually unnecessary, since `updater.sh` restarts the service correctly when it detects changes.
