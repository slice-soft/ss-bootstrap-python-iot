# ss-bootstrap-python-iot

Sistema de arranque automático para Raspberry Pi Zero W y otros dispositivos embebidos, desarrollado por [SliceSoft](https://github.com/slicesoft) como base para pruebas de automatización, actualización remota y ejecución continua de lógica IoT en Python.

---

## 📦 Descripción

Este repositorio contiene un agente simple que:

- Ejecuta una tarea periódica (registro en log)
- Se puede iniciar automáticamente con un solo comando
- Incluye lógica de actualización automática vía `git pull`

---

## 🚀 Instalación rápida

En tu Raspberry Pi (con Raspberry Pi OS Lite) o cualquier sistema Linux, ejecuta:

```bash
wget -O - https://raw.githubusercontent.com/slice-soft/ss-bootstrap-python-iot/main/install.sh | bash
```

🔧 Esto hará:
1. Clonar el repositorio en tu carpeta de usuario (`$HOME/ss-bootstrap-python-iot`)
2. Dar permisos de ejecución a los scripts
3. Ejecutar el script `run.py` como servicio
4. Registrar el actualizador en `crontab` cada 5 minutos

> ⚠️ **Nota:** El soporte para macOS está en desarrollo y no es prioritario, ya que el enfoque principal es Raspberry Pi y sistemas Linux.

---

## 🧠 ¿Qué hace el agente?

Cada minuto:
- Escribe una línea en `$HOME/ss-bootstrap-python-iot/ss-bootstrap.log`
- Simula actividad de un dispositivo conectado
- Puedes monitorear el log con:

```bash
tail -f ~/ss-bootstrap-python-iot/ss-bootstrap.log
```

---

## 📁 Archivos principales

| Archivo                  | Propósito                                             |
|--------------------------|------------------------------------------------------|
| `run.py`                 | Script principal con la lógica de ejecución          |
| `run.sh`                 | Inicia el script y configura el servicio             |
| `stop.sh`                | Detiene el proceso si está en ejecución              |
| `updater.sh`             | Verifica cambios en el repositorio y reinicia        |
| `install.sh`             | Script que automatiza todo el setup inicial          |
| `setup-mac-service.sh`   | Configura el servicio de agente en macOS             |
| `setup-linux-service.sh` | Configura el servicio de agente en Linux (systemd)   |
| `stop-mac-service.sh`    | Detiene y elimina el servicio macOS                  |
| `stop-linux-service.sh`  | Detiene y elimina el servicio systemd en Linux       |
| `.gitignore`             | Ignora archivos de log y PID                         |

---

## 🛠️ Requisitos

- Raspberry Pi OS Lite (32-bit) o cualquier distribución Linux moderna
- Python 3
- Acceso a internet por Wi-Fi o Ethernet
- Git instalado (ya viene por defecto en la imagen oficial)

---

## ✅ Ejemplo de salida (`ss-bootstrap.log`)

```
[2025-05-20 14:10:01] ✅ Sistema en ejecución V0.0.3
[2025-05-20 14:11:01] ✅ Sistema en ejecución V0.0.3
```

---

## 🧪 Próximos pasos

Este repositorio está diseñado para ser extendido con:
- Lectura de sensores reales (GPS, temperatura, movimiento)
- Envío de datos a un backend vía HTTP o MQTT
- Indicaciones físicas (LEDs, zumbadores, pantallas)

---

## 📄 Licencia

MIT — este proyecto es libre de usar, modificar y compartir.

---

## 🛠️ Scripts opcionales de mantenimiento

Estos scripts pueden ser útiles durante pruebas manuales:

- `stop.sh`: Detiene el proceso principal si fue iniciado manualmente
- `stop-mac-service.sh`: Elimina el servicio en macOS (`launchctl`)
- `stop-linux-service.sh`: Elimina el servicio de usuario en Linux (`systemctl --user`)

⚠️ En producción no suelen usarse, ya que `updater.sh` reinicia correctamente el servicio al detectar cambios.