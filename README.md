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

En tu Raspberry Pi (con Raspberry Pi OS Lite), ejecuta:

```bash
wget -O - https://raw.githubusercontent.com/tuusuario/ss-bootstrap-python-iot/main/install.sh | bash
```

🔧 Esto hará:
1. Clonar el repositorio en `/home/pi/app`
2. Dar permisos de ejecución a los scripts
3. Ejecutar el script `run.py`
4. Registrar el actualizador en `crontab` cada 5 minutos

---

## 🧠 ¿Qué hace el agente?

Cada minuto:
- Escribe una línea en `/home/pi/app/sistema.log`
- Simula actividad de un dispositivo conectado
- Puedes monitorear el log con:

```bash
tail -f /home/pi/app/sistema.log
```

---

## 📁 Archivos principales

| Archivo        | Propósito                                      |
|----------------|-----------------------------------------------|
| `run.py`       | Script principal con la lógica de ejecución    |
| `run.sh`       | Inicia el script y guarda el PID               |
| `stop.sh`      | Detiene el proceso si está en ejecución        |
| `updater.sh`   | Verifica cambios en el repositorio y reinicia |
| `install.sh`   | Script que automatiza todo el setup inicial    |
| `.gitignore`   | Ignora archivos de log y PID                   |

---

## 🛠️ Requisitos

- Raspberry Pi OS Lite (32-bit)
- Python 3
- Acceso a internet por Wi-Fi o Ethernet
- Git instalado (ya viene por defecto en la imagen oficial)

---

## ✅ Ejemplo de salida (`sistema.log`)

```
[2025-05-20 14:10:01] ✅ Sistema en ejecución
[2025-05-20 14:11:01] ✅ Sistema en ejecución
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