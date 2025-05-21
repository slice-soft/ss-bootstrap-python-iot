from datetime import datetime
import time
import os
VERSION = "V0.0.1"

log_path = os.path.join(os.environ["HOME"], "ss-bootstrap-python-iot", "ss-bootstrap.log")

while True:
    with open(log_path, "a") as f:
        f.write(f"[{datetime.now()}] ✅ Sistema en ejecución {VERSION}\n")
    time.sleep(60)