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