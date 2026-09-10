# Numbers — Ruby

Implementación de la especificación [04_Numbers](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) en **Ruby**, utilizando **RSpec** como framework de pruebas unitarias y **Bundler** para la gestión de dependencias mediante `Gemfile`.

Tres enfoques de implementación para los mismos 5 algoritmos numéricos: **recursivo directo** (`_rec`), **recursivo con acumulador** (`_acc`) e **iterativo** (`_ite`).

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`src/numbers.rb`](src/numbers.rb) | Módulo `Numbers` — único archivo con las 15 funciones (3 enfoques × 5 algoritmos) + 4 helpers privados `_help`. |
| [`test/recursive_tests.rb`](test/recursive_tests.rb) | Suite recursiva con RSpec: 5 ejemplos agrupados por función (11 casos de prueba). |
| [`test/iterative_tests.rb`](test/iterative_tests.rb) | Suite iterativa con RSpec: 5 ejemplos agrupados por función (11 casos de prueba). |
| [`Gemfile`](Gemfile) | Dependencias del proyecto (gema `rspec`). |
| [`Gemfile.lock`](Gemfile.lock) | Versiones exactas resueltas por Bundler. |
| [`.rspec`](.rspec) | Configuración de RSpec (`--format documentation`, ruta `test/`, patrón `*_tests.rb`). |
| [`.gitignore`](.gitignore) | Ignora artefactos locales de Bundler (`.bundle/`, `vendor/bundle/`). |

**Estructura de directorios esperada:**

```text
numbers/
├── .gitignore                 # Ignora .bundle/ y vendor/bundle/
├── .rspec                     # Configuración de ejecución RSpec
├── Gemfile                    # Dependencias Bundler
├── Gemfile.lock               # Versiones fijadas de gemas
├── src/
│   └── numbers.rb             # Único archivo: 3 enfoques en 1 (15 métodos)
└── test/
    ├── recursive_tests.rb     # Tests: enfoque recursivo (5 ejemplos, 11 casos)
    └── iterative_tests.rb     # Tests: enfoque iterativo (5 ejemplos, 11 casos)
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este proyecto estructura las 15 funciones dentro de un módulo `Numbers` en `src/numbers.rb`. Las funciones se dividen en 3 enfoques:

**EN:** This project organizes the 15 functions within a `Numbers` module in `src/numbers.rb`. Functions are divided into 3 approaches:

| Enfoque | Sufijo | Ejemplo | ¿Tiene tests directos? |
| ------- | ------ | ------- | :---------------------: |
| Recursivo directo | `_rec` | `fibonacci_rec` | ✅ Sí |
| Recursivo con acumulador | `_acc` | `fibonacci_acc` | ❌ No (ver nota TCO) |
| Iterativo | `_ite` | `fibonacci_ite` | ✅ Sí |

**Combinación aplicada:** TCO ❌ + iteración ✅ → `_rec` + `_ite` = **2 suites × 5 ejemplos agrupados = 10 tests (22 casos de prueba)**.

**Applied combination:** No TCO + iteration ✅ → `_rec` + `_ite` = **2 suites × 5 grouped examples = 10 tests (22 test cases)**.

### Inicialización / Initialization

1. Crear la estructura de directorios:

   ```bash
   mkdir -p ruby/core/foundations/numbers/{src,test}
   ```

2. Escribir `src/numbers.rb`, las suites en `test/` y las configuraciones de Bundler y RSpec.

3. Instalar dependencias y ejecutar:

   ```bash
   bundle install
   bundle exec rspec
   ```

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `src/numbers.rb` — Implementación (3 enfoques en 1 archivo)

**ES:** Cada algoritmo cuenta con 3 métodos de clase (`_rec`, `_acc`, `_ite`). Los métodos auxiliares `_help` son privados mediante `private_class_method`. Por ejemplo, `fibonacci`:

**EN:** Each algorithm has 3 class methods (`_rec`, `_acc`, `_ite`). Auxiliary `_help` methods are private via `private_class_method`. For example, `fibonacci`:

```ruby
module Numbers
  # Recursión directa / Direct recursion
  def self.fibonacci_rec(n)
    return n if n <= 1

    fibonacci_rec(n - 1) + fibonacci_rec(n - 2)
  end

  # Recursión con acumulador / Accumulator recursion
  def self.fibonacci_acc(n)
    fibonacci_acc_help(n, 0, 1)
  end

  def self.fibonacci_acc_help(n, acc2, acc1)
    return acc2 if n <= 0
    return acc1 + acc2 if n <= 2

    fibonacci_acc_help(n - 1, acc1, acc1 + acc2)
  end

  # Iterativo / Iterative
  def self.fibonacci_ite(n)
    return n if n <= 1

    acc2 = 0
    acc1 = 1
    (2..n).each do
      temp = acc1 + acc2
      acc2 = acc1
      acc1 = temp
    end
    acc1
  end

  private_class_method :fibonacci_acc_help
end
```

| Algoritmo | `_rec` | `_acc` | `_ite` |
| --------- | ------ | ------ | ------ |
| `sum_of_first_n` | `n + sum_rec(n-1)` | helper con `n + acc` | `(1..n).each` |
| `factorial` | `n * fact_rec(n-1)` | helper con `n * acc` | `(2..n).each` |
| `fibonacci` | suma de dos llamadas recursivas | helper con `acc2, acc1` | bucle de intercambio con `temp` |
| `greatest_common_divisor` | Euclides recursivo (`a % b`) | helper (Euclides) | `while b != 0` |
| `least_common_multiple` | `(a * b) / gcd` | `(a * b) / gcd` | `(a * b) / gcd` |

### Suites de pruebas — RSpec

**ES:** Dos suites separadas (`recursive_tests.rb` e `iterative_tests.rb`). Cada suite agrupa las aserciones por función en un bloque `describe` con un `it` representativo (5 ejemplos por suite, cubriendo los 11 casos de prueba especificados en el pseudocódigo).

**EN:** Two separate suites (`recursive_tests.rb` and `iterative_tests.rb`). Each suite groups assertions by function into a `describe` block with a representative `it` (5 examples per suite, covering all 11 test cases from the pseudocode).

```ruby
require_relative '../src/numbers'

RSpec.describe 'Recursive' do
  describe '.fibonacci_rec' do
    it 'calculates the nth Fibonacci number' do
      expect(Numbers.fibonacci_rec(0)).to eq(0)
      expect(Numbers.fibonacci_rec(1)).to eq(1)
      expect(Numbers.fibonacci_rec(6)).to eq(8)
    end
  end
end
```

---

## 🚀 Compilación y ejecución / Build & Run

### Requisitos / Requirements

- **Ruby 3.0+** (`ruby`).
- **Bundler** (`bundle`).

```bash
# Verificar versiones instaladas
ruby -v
bundle -v
```

### Instalar dependencias / Install dependencies

```bash
cd ruby/core/foundations/numbers
bundle install
```

### Ejecutar las pruebas / Run tests

```bash
cd ruby/core/foundations/numbers
bundle exec rspec
```

> **ES:** Para ejecutar una única suite: `bundle exec rspec test/recursive_tests.rb`.  
> **EN:** To run a single suite: `bundle exec rspec test/recursive_tests.rb`.

### Salida esperada / Expected output

```text
Iterative
  .sum_of_first_n_ite
    calculates the sum of first n numbers
  .factorial_ite
    calculates the factorial of n
  .fibonacci_ite
    calculates the nth Fibonacci number
  .greatest_common_divisor_ite
    calculates the greatest common divisor
  .least_common_multiple_ite
    calculates the least common multiple

Recursive
  .sum_of_first_n_rec
    calculates the sum of first n numbers
  .factorial_rec
    calculates the factorial of n
  .fibonacci_rec
    calculates the nth Fibonacci number
  .greatest_common_divisor_rec
    calculates the greatest common divisor
  .least_common_multiple_rec
    calculates the least common multiple

Finished in 0.00178 seconds (files took 0.04464 seconds to load)
10 examples, 0 failures
```

> **ES:** `10 examples, 0 failures` (5 ejemplos por suite agrupando los 22 casos de prueba de la especificación, todos pasando).  
> **EN:** `10 examples, 0 failures` (5 examples per suite grouping all 22 test cases from the specification, all passing).

---

## 🔁 Sobre recursión con acumulador y Tail Call Optimization (TCO)

**ES:**
Tail recursion ocurre cuando la llamada recursiva es la última acción que ejecuta una función; después de la llamada no hay más instrucciones pendientes. La recursión con acumulador consigue esto pasando el estado acumulado como parámetro.

En Ruby (CRuby / YARV estándar), **no se garantiza TCO**: la optimización de llamadas de cola está deshabilitada por defecto en el runtime y llamadas recursivas profundas agotan la pila provocando `SystemStackError: stack level too deep`. Por lo tanto, las variantes `_acc` se conservan en el código fuente exclusivamente con fines educativos como puente conceptual hacia la versión iterativa (`_ite`). Al no aportar una ventaja de rendimiento en el intérprete estándar, **no se desarrollan pruebas unitarias dedicadas para las funciones `_acc`**; su correctitud queda validada a través de las suites recursiva e iterativa.

**EN:**
Tail recursion occurs when the recursive call is the last action executed by a function; after the call there are no pending instructions. Accumulator recursion achieves this by passing the accumulated state as a parameter.

In Ruby (standard CRuby / YARV), **TCO is not guaranteed**: tail-call optimization is disabled by default in the runtime, and deep recursion exhausts the call stack raising `SystemStackError: stack level too deep`. Therefore, `_acc` variants are kept in the source code purely for educational purposes as a conceptual bridge toward the iterative version (`_ite`). Since they provide no practical performance benefit in the standard interpreter, **no dedicated unit tests are written for `_acc` functions**; their correctness is validated through the recursive and iterative suites.

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** `Numbers` se implementa como un `module` sin estado, con métodos accesibles mediante `Numbers.metodo(...)`.
- **EN:** `Numbers` is implemented as a stateless `module`, with methods accessible via `Numbers.method(...)`.
- **ES:** Los helpers `_help` se ocultan del API público utilizando `private_class_method`.
- **EN:** The `_help` helpers are hidden from the public API using `private_class_method`.
- **ES:** En Ruby, los rangos `(1..0)` y `(2..0)` son vacíos (no producen iteraciones), permitiendo que `sum_of_first_n_ite(0)` y `factorial_ite(0)` retornen sus valores neutros esperados (`0` y `1` respectivamente).
- **EN:** In Ruby, ranges `(1..0)` and `(2..0)` are empty (produce no iterations), allowing `sum_of_first_n_ite(0)` and `factorial_ite(0)` to return their expected neutral values (`0` and `1` respectively).
- **ES:** La división de enteros con `/` en Ruby produce división entera exacta, por lo que `(a * b) / gcd` devuelve un `Integer`.
- **EN:** Integer division with `/` in Ruby produces exact integer division, so `(a * b) / gcd` returns an `Integer`.
- **ES:** En `greatest_common_divisor` se emplea `%` (operador de módulo de Ruby), permitido en este algoritmo conforme a la especificación.
- **EN:** In `greatest_common_divisor`, `%` (Ruby's modulus operator) is used, which is permitted in this algorithm according to the specification.

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
