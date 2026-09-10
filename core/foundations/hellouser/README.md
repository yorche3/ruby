# Hello, User! — Ruby

Implementación de la especificación [02_Hello_User](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) en **Ruby**, con un enfoque manual y minimalista.

Solicita un nombre al usuario por la entrada estándar (estilo prompt) y saluda.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`hellouser.rb`](hellouser.rb) | Código fuente: solicita un nombre al usuario y saluda. |

**Estructura de directorios esperada:**

```text
hellouser/
├── hellouser.rb     # Código fuente
└── README.md        # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este programa introduce tres conceptos nuevos respecto a `helloworld`:

1. **Lectura de entrada estándar** — `gets` lee una línea desde `stdin` (incluyendo el salto de línea delimitador).
2. **Mutación de cadenas in-place** — `chomp!` elimina el salto de línea final (`\n` o `\r\n`) directamente sobre la variable `name`.
3. **Variables locales y concatenación** — asignación de variables sin palabras clave especiales y concatenación mediante el operador `+`.

**EN:** This program introduces three new concepts compared to `helloworld`:

1. **Standard input reading** — `gets` reads a line from `stdin` (including the terminating newline).
2. **In-place string mutation** — `chomp!` strips the trailing newline (`\n` or `\r\n`) directly on the `name` variable.
3. **Local variables and concatenation** — variable assignment without special keywords and string concatenation using the `+` operator.

### Inicialización / Initialization

1. Crear la estructura de directorios:

   ```bash
   mkdir -p ruby/core/foundations/hellouser
   ```

2. Escribir el archivo `hellouser.rb` con el código fuente.

3. No se necesita ningún paso adicional de construcción o vinculación de dependencias.

---

## 📄 Archivos de configuración clave / Key Configuration Files

No se requieren archivos de configuración de build. El programa se ejecuta directamente con el intérprete `ruby`.

**ES:** El flujo del programa es:

1. Imprimir `"Enter your name: "` con `puts`.
2. Leer una línea desde `stdin` con `gets` y asignarla a `name`.
3. Eliminar el salto de línea final con `name.chomp!`.
4. Imprimir `"Hello, <nombre>!"` concatenando con `+`.

**EN:** Program flow:

1. Print `"Enter your name: "` with `puts`.
2. Read a line from `stdin` with `gets` and assign it to `name`.
3. Strip the trailing newline with `name.chomp!`.
4. Print `"Hello, <name>!"` concatenating with `+`.

```ruby
# coding: utf-8
puts "Enter your name: "
name = gets
name.chomp!
puts "Hello, "+ name +"!"
```

| Elemento | Propósito |
|----------|-----------|
| `# coding: utf-8` | Comentario mágico que especifica explícitamente la codificación UTF-8 del archivo fuente. |
| `puts "Enter your name: "` | Muestra el prompt en la salida estándar con un salto de línea. |
| `name = gets` | Lee una línea completa desde `stdin` (incluye el salto de línea al presionar Enter). |
| `name.chomp!` | Método mutador (convención `!` en Ruby) que modifica la cadena in-place removiendo el delimitador final. |
| `puts "Hello, "+ name +"!"` | Concatena las cadenas con `+` e imprime el saludo resultante. |

> **ES:** En Ruby, los métodos que terminan con `!` (como `chomp!`) señalan mutación in-place o comportamiento destructivo sobre el receptor.
> **EN:** In Ruby, methods ending with `!` (such as `chomp!`) indicate in-place mutation or destructive behavior on the receiver.

---

## 🚀 Compilación y ejecución / Build & Run

### Requisito: Tener Ruby instalado

```bash
# Verificar instalación
ruby -v
```

### Ejecutar / Run

```bash
cd ruby/core/foundations/hellouser
ruby hellouser.rb
```

**ES:** El programa muestra el prompt y espera a que escribas tu nombre y presiones Enter.  
**EN:** The program shows the prompt and waits for you to type your name and press Enter.

### Salida esperada / Expected output

```text
Enter your name: 
Ada
Hello, Ada!
```

> **ES:** También admite entrada redirigida: `printf 'Ada\n' | ruby hellouser.rb` produce el mismo saludo.  
> **EN:** It also accepts redirected input: `printf 'Ada\n' | ruby hellouser.rb` produces the same greeting.

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** Ruby no requiere declarar variables ni indicar su tipo; una variable local nace al ser asignada (ej. `name = ...`).
- **EN:** Ruby does not require declaring variables or specifying their type; a local variable is created upon assignment (e.g. `name = ...`).
- **ES:** La alternativa no mutadora es `name = gets.chomp`, común en código Ruby idiomático.
- **EN:** The non-mutating alternative is `name = gets.chomp`, commonly seen in idiomatic Ruby code.

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
