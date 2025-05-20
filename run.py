from datetime import datetime
import time

while True:
    with open("/home/pi/app/sistema.log", "a") as f:
        f.write(f"[{datetime.now()}] ✅ Sistema en ejecución\n")
    time.sleep(60)