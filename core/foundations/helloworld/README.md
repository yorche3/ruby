# Hello, World! — Ruby

Implementación de la especificación [01_Hello_World](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) en **Ruby**, con un enfoque manual y minimalista.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`helloworld.rb`](helloworld.rb) | Código fuente: imprime `"Hello, World! from Ruby"` en la salida estándar. |

**Estructura de directorios esperada:**

```text
helloworld/
├── helloworld.rb    # Código fuente
└── README.md        # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto se creó manualmente, sin herramientas de scaffolding. Un único archivo `.rb` es suficiente: Ruby es un lenguaje interpretado, por lo que no requiere compilación previa para ejecutarse.

**EN:** The project was created manually, without scaffolding tools. A single `.rb` file is enough: Ruby is an interpreted language, so no prior compilation is required to run it.

### Inicialización / Initialization

1. Crear la estructura de directorios:

   ```bash
   mkdir -p ruby/core/foundations/helloworld
   ```

2. Escribir el archivo `helloworld.rb` con el código fuente.

3. No se necesita ningún paso adicional de construcción o vinculación de dependencias.

---

## 📄 Archivos de configuración clave / Key Configuration Files

No se requieren archivos de configuración de build. El programa se ejecuta directamente con el intérprete `ruby`.

```ruby
puts "Hello, World! from Ruby"
```

| Elemento | Propósito |
|----------|-----------|
| `puts` | Método del módulo `Kernel` que escribe su argumento en `stdout` añadiendo automáticamente un salto de línea (`\n`). |
| `"Hello, World! from Ruby"` | Argumento: la cadena a imprimir. |

> **ES:** `puts` añade un salto de línea al final; si no se desea salto de línea se utiliza `print`. Los paréntesis son opcionales en las llamadas a métodos en Ruby cuando no hay ambigüedad.
> **EN:** `puts` appends a newline at the end; if no newline is desired, `print` is used. Parentheses are optional in method calls in Ruby when there is no ambiguity.

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener Ruby instalado

```bash
# Verificar instalación
ruby -v
```

### Ejecutar directamente / Run directly

```bash
cd ruby/core/foundations/helloworld
ruby helloworld.rb
```

### Comprobar sintaxis sin ejecutar (opcional) / Check syntax without running (optional)

```bash
ruby -c helloworld.rb
```

### Salida esperada / Expected output

```text
Hello, World! from Ruby
```

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** Ruby no requiere una función `main`: el script se ejecuta secuencialmente de arriba a abajo.
- **EN:** Ruby does not require a `main` function: the script executes sequentially from top to bottom.
- **ES:** `puts` convierte automáticamente el objeto a cadena invocando su método `to_s` y añade un salto de línea si la cadena no termina en uno.
- **EN:** `puts` automatically converts the object to a string by invoking its `to_s` method and adds a newline if the string does not end with one.

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
