from datetime import datetime
import time
import os
VERSION = "V0.0.4"

log_path = os.path.join(os.environ["HOME"], "ss-bootstrap-python-iot", "ss-bootstrap.log")

while True:
    with open(log_path, "a") as f:
        f.write(f"[{datetime.now()}] ✅ System running {VERSION}\n")
    time.sleep(60)
