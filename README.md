# 🧮 Operaciones Aritméticas en Ensamblador (TASM/MASM)

Este proyecto contiene una serie de programas en lenguaje ensamblador que permiten realizar operaciones aritméticas básicas entre dos dígitos introducidos por el usuario. Cada operación se ejecuta en un entorno compatible con DOS utilizando herramientas como **TASM/MASM** y **jsDOS** para facilitar pruebas rápidas desde Visual Studio Code.

## 📌 Operaciones implementadas

1. ✅ Suma
2. ✅ Resta
3. ✅ Multiplicación
4. ✅ División (con manejo de división por cero)

---

## 🚀 Ejecución rápida en entorno DOS

Estos programas fueron pensados para ser ejecutados fácilmente desde un entorno DOS simulado con herramientas como:

- 💾 [jsDOS](https://js-dos.com/)
- 🧰 [DOSBox](https://www.dosbox.com/)
- 🖥️ Extensiones de ensamblador en VS Code para `MASM/TASM`

El archivo ejecutable se genera con:

```sh
tasm archivo.asm
tlink archivo.obj
```

Luego puedes correr el archivo `.exe` con:

```sh
D:\> test
```

---

## 🧠 Detalles técnicos

- El código usa **modo real de 16 bits**.
- El registro `ah` con `int 21h` se utiliza para:
  - `09h`: Mostrar cadenas (`$`-terminadas)
  - `01h`: Leer caracteres del teclado
  - `02h`: Imprimir caracteres
  - `4Ch`: Terminar el programa

- Cada dígito ingresado se convierte restando `30h` al valor ASCII.
- Las operaciones convierten el resultado a formato decimal dividiendo entre 10 y mostrando las cifras decena/unidad por separado.

### ⚠️ División entre cero

En el programa de división se incluye la validación para evitar errores fatales, mostrando el mensaje:

```
¡Con que quieres trollearme!
```

cuando el segundo dígito ingresado es cero.

---

## 📂 Estructura del proyecto

```
├── suma.asm           ; Programa de suma
├── resta.asm          ; Programa de resta
├── multiplicacion.asm ; Programa de multiplicación
├── division.asm       ; Programa de división con manejo de error
└── README.md          ; Este archivo
```

---

## 🤓 Créditos

Este proyecto hace parte de una serie de ejercicios educativos para explorar el lenguaje ensamblador desde cero, utilizando herramientas modernas como Visual Studio Code y entornos DOS virtuales.

---

## 🗨️ Comentarios y aportes

Si tienes sugerencias o mejoras para estos programas, ¡no dudes en abrir un issue o enviar un pull request!
