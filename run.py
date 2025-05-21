from datetime import datetime
import time
import os
VERSION = "V1.2.0"

log_path = os.path.join(os.environ["HOME"], "ss-bootstrap-python-iot", "log.txt")

while True:
    with open(log_path, "a") as f:
        f.write(f"[{datetime.now()}] ✅ Sistema en ejecución {VERSION}\n")
    time.sleep(60)