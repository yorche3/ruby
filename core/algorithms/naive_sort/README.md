# Naive Sort — Ruby

Implementación de la especificación [05_Naive_Sort](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/) en **Ruby**, utilizando **RSpec** como framework de pruebas unitarias y **Bundler** para la gestión de dependencias mediante `Gemfile`.

Los tres algoritmos elementales de ordenamiento $O(n^2)$ — **selection sort**, **bubble sort** e **insertion sort** — ordenan **in-place** el array recibido y lo devuelven, sin invocar ninguna biblioteca de ordenamiento del sistema.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`src/naive_sort.rb`](src/naive_sort.rb) | Módulo `NaiveSort` — único archivo con los 3 métodos del contrato. |
| [`test/naive_sort_tests.rb`](test/naive_sort_tests.rb) | Suite RSpec: 3 ejemplos (uno por algoritmo) con los 8 casos de prueba. |
| [`Gemfile`](Gemfile) | Dependencias del proyecto (gema `rspec`). |
| [`.rspec`](.rspec) | Configuración de RSpec (`--format documentation`, ruta `test/`, patrón `**/*_tests.rb`). |
| [`.gitignore`](.gitignore) | Ignora artefactos locales de Bundler (`.bundle/`, `vendor/bundle/`, `Gemfile.lock`). |

**Estructura de directorios / Directory structure:**

```text
naive_sort/
├── .gitignore                 # Ignora .bundle/, vendor/bundle/ y Gemfile.lock
├── .rspec                     # Configuración de ejecución RSpec
├── Gemfile                    # Dependencias Bundler
├── src/
│   └── naive_sort.rb          # Módulo NaiveSort: 3 algoritmos
└── test/
    └── naive_sort_tests.rb    # Suite RSpec: 3 ejemplos × 8 casos (24 aserciones)
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Estructura creada manualmente (`mkdir -p src test` + `bundle init`), como indica la guía de inicialización para Ruby, y el mismo patrón que `core/foundations/numbers/`: un módulo con métodos de módulo (`def self.*`) en `src/` y una suite RSpec en `test/`, sin clase ni instancias. Los tres algoritmos son iterativos e in-place: reciben el array, lo modifican y devuelven la misma referencia.

**EN:** Structure created by hand (`mkdir -p src test` + `bundle init`), as the initialization guide states for Ruby, following the same pattern as `core/foundations/numbers/`: a module with module methods (`def self.*`) in `src/` and an RSpec suite in `test/`, with no class or instances. All three algorithms are iterative and in-place: they take the array, modify it, and return the same reference.

### Inicialización / Initialization

```bash
mkdir -p src test
bundle init
bundle install
```

---

## 📄 Configuración clave / Key Configuration

### `Gemfile` — dependencias

```ruby
source 'https://rubygems.org'

gem 'rspec', '~> 3.13'
```

### `.rspec` — ejecución de las pruebas

```text
--format documentation
--default-path test
--pattern "**/*_tests.rb"
```

**ES:** RSpec descubre la suite con `--pattern "**/*_tests.rb"`, el sufijo en plural que ya usa `numbers/`; no hay script `run_tests.rb` porque `bundle exec rspec` es el punto de entrada del ecosistema y el comando que marca la guía (✅).

**EN:** RSpec discovers the suite with `--pattern "**/*_tests.rb"`, the plural suffix already used by `numbers/`; there is no `run_tests.rb` script because `bundle exec rspec` is the ecosystem entry point and the command marked by the guide (✅).

### `src/naive_sort.rb` — contrato e implementación

**ES:** El contrato se expone como los tres métodos del módulo. `nil` es el indicador de fallo (distinguible del array vacío) y las entradas con menos de dos elementos se devuelven sin cambios.

**EN:** The contract is exposed as the three module methods. `nil` is the failure indicator (distinguishable from the empty array) and inputs with fewer than two elements are returned unchanged.

```ruby
module NaiveSort
  def self.selection_sort(arr)
    return nil if arr.nil?
    n = arr.length
    return arr if n < 2
    (0...n-1).each do |i|
      min_index = i
      (i+1...n).each do |j|
        min_index = j if arr[j] < arr[min_index]
      end
      if min_index != i
        arr[i], arr[min_index] = arr[min_index], arr[i]
      end
    end
    arr
  end
```

| Elemento del contrato | Representación en Ruby |
| --------------------- | ---------------------- |
| Array de enteros | `[5, 2, 9, 1, 5, 6]` (índices 0-based) |
| Caso nulo | `nil` (indicador de fallo) |
| Array vacío | `[]` |
| Orden | in-place, devuelve la misma referencia |
| Nombres de la especificación | `selection_sort`, `bubble_sort`, `insertion_sort` (snake_case, idénticos a la especificación y a la convención de Ruby) |

### Suite de pruebas / Test suite

**ES:** La suite define una constante congelada por entrada y salida, una tabla `CASES` con las 8 descripciones y un helper compartido que recibe el nombre del algoritmo y la función a probar. Cada caso ordena una copia (`dup`) del fixture, porque el orden es in-place.

**EN:** The suite defines one frozen constant per input and output, a `CASES` table with the 8 descriptions, and a shared helper that receives the algorithm name and the function under test. Each case sorts a copy (`dup`) of the fixture, because sorting happens in-place.

```ruby
# Helper compartido: recibe el nombre del algoritmo y la función a probar, y
# ejecuta todos los casos con el mensaje descriptivo del contrato.
def assert_sorts_all_cases(algorithm, function)
  CASES.each do |test_case|
    input = test_case[:input]&.dup

    expect(function.call(input)).to eq(test_case[:expected]),
      "#{algorithm} should sort #{test_case[:description]}"
  end
end
```

---

## 🚀 Compilación y ejecución / Build & Run

### Requisitos / Requirements

- **Ruby** 3.0+ (en este entorno, 3.4.3 gestionado con RVM).
- **Bundler** y la gema **RSpec** declarada en el `Gemfile`.

```bash
# Verificar la instalación
ruby -v
bundle -v
```

### Ejecutar las pruebas / Run tests

```bash
cd ruby/core/algorithms/naive_sort
bundle install
bundle exec rspec
```

**Salida real / Actual output:**

```text
naive_sort
  .selection_sort
    sorts every case of the specification
  .bubble_sort
    sorts every case of the specification
  .insertion_sort
    sorts every case of the specification

Finished in 0.00142 seconds (files took 0.04696 seconds to load)
3 examples, 0 failures
```

> **ES:** 3 ejemplos, uno por algoritmo; cada uno ejecuta los 8 casos de la tabla = 24 aserciones. La verificación estática es `ruby -w -c src/naive_sort.rb` y `ruby -w -c test/naive_sort_tests.rb` → `Syntax OK` en ambos, sin warnings (Ruby no compila a un artefacto previo y el módulo no declara un linter).
> **EN:** 3 examples, one per algorithm; each one runs the 8 cases of the table = 24 assertions. Static verification is `ruby -w -c src/naive_sort.rb` and `ruby -w -c test/naive_sort_tests.rb` → `Syntax OK` for both, with no warnings (Ruby does not compile to a prior artefact and the module declares no linter).

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

| Función / Algorithm | Enfoque / Approach | Descripción / Description |
| ------------------- | ------------------ | ------------------------- |
| `selection_sort(arr)` | iterativo, in-place | Busca el mínimo del tramo no ordenado con `min_index` y lo intercambia al inicio con asignación paralela. $O(n^2)$ siempre. |
| `bubble_sort(arr)` | iterativo, in-place, con bandera | Compara adyacentes e intercambia; sale antes con `break unless swapped` cuando no hubo intercambios. $O(n^2)$ peor/promedio, $O(n)$ mejor. |
| `insertion_sort(arr)` | iterativo, in-place | Guarda `key`, desplaza el sub-array ordenado con `while` y lo inserta en su posición. $O(n^2)$ peor/promedio, $O(n)$ mejor. |

| Caso (descripción en la suite) | Entrada | Salida esperada |
| ------------------------------ | ------- | --------------- |
| an unsorted array | `[5, 2, 9, 1, 5, 6]` | `[1, 2, 5, 5, 6, 9]` |
| an already sorted array | `[1, 2, 3, 4, 5]` | `[1, 2, 3, 4, 5]` |
| a reverse ordered array | `[5, 4, 3, 2, 1]` | `[1, 2, 3, 4, 5]` |
| an array of identical elements | `[7, 7, 7, 7]` | `[7, 7, 7, 7]` |
| an array with negative numbers | `[3, -1, 4, -5, 0]` | `[-5, -1, 0, 3, 4]` |
| a single element array | `[42]` | `[42]` |
| an empty array | `[]` | `[]` |
| a null input | `nil` | `nil` |

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** El módulo se llama `NaiveSort` y expone tres métodos de módulo (`def self.selection_sort`, `def self.bubble_sort`, `def self.insertion_sort`): no se instancia nada. Es el mismo patrón de `core/foundations/numbers/`, donde `Numbers` también es un módulo con métodos `self.*`.
- **EN:** The module is named `NaiveSort` and exposes three module methods (`def self.selection_sort`, `def self.bubble_sort`, `def self.insertion_sort`): nothing is instantiated. This is the same pattern as `core/foundations/numbers/`, where `Numbers` is also a module with `self.*` methods.
- **ES:** Divergencia idiomática aceptada: los tres algoritmos ordenan **in-place** el array recibido y devuelven esa misma referencia, variante que la especificación permite explícitamente. Por eso la suite ordena una copia con `dup` en cada caso, para no contaminar los fixtures congelados.
- **EN:** Accepted idiomatic divergence: all three algorithms sort the received array **in-place** and return that same reference, a variant the specification explicitly allows. That is why the suite sorts a `dup` copy per case, so the frozen fixtures are not polluted.
- **ES:** Caso nulo incluido: en Ruby un array puede ser `nil`, así que el indicador de fallo del contrato es `nil` y se comprueba como octavo caso, distinguible del array vacío (`[]`). Ninguna función lanza excepciones.
- **EN:** Null case included: in Ruby an array can be `nil`, so the contract's failure indicator is `nil`, checked as the eighth case and distinguishable from the empty array (`[]`). No function raises exceptions.
- **ES:** `bubble_sort` conserva la optimización de salida temprana: la bandera `swapped` y `break unless swapped` reproducen el `if not swapped: break` del pseudocódigo (mejor caso $O(n)$). La bandera no es observable en la salida, así que su presencia se verifica contra el pseudocódigo.
- **EN:** `bubble_sort` keeps the early-exit optimization: the `swapped` flag and `break unless swapped` reproduce the pseudocode's `if not swapped: break` (best case $O(n)$). The flag is not observable in the output, so its presence is verified against the pseudocode.
- **ES:** El bucle interior de `bubble_sort` es `(0...n-i-1)`, el rango exclusivo equivalente al `for j = 0 to n - 2 - i` del pseudocódigo, con los bordes ajustados por el índice 0-based de Ruby.
- **EN:** The inner loop of `bubble_sort` is `(0...n-i-1)`, the exclusive range equivalent to the pseudocode's `for j = 0 to n - 2 - i`, with the bounds adjusted for Ruby's 0-based indexing.
- **ES:** `insertion_sort` usa la condición `j >= 0 && arr[j] > key`; `&&` evalúa en cortocircuito, así que la guarda `j >= 0` protege el acceso `arr[j]` cuando `j` llega a `-1`. La comparación es estricta, lo que mantiene el algoritmo estable.
- **EN:** `insertion_sort` uses the condition `j >= 0 && arr[j] > key`; `&&` short-circuits, so the `j >= 0` guard protects the `arr[j]` access when `j` reaches `-1`. The comparison is strict, which keeps the algorithm stable.
- **ES:** Ninguno de los tres algoritmos invoca `sort`, `sort_by`, `min` ni ninguna otra ayuda de ordenamiento o selección de la biblioteca estándar: solo comparaciones, índices e intercambios.
- **EN:** None of the three algorithms calls `sort`, `sort_by`, `min`, or any other standard-library sorting or selection helper: only comparisons, indexes, and swaps.
- **ES:** Nota de desviación respecto a la ubicación esperada: se conserva `src/naive_sort.rb` (solo cambia la extensión) y la suite se llama `test/naive_sort_tests.rb`, con el sufijo en plural que ya usa `numbers/`; no se añade `run_tests.rb` porque `bundle exec rspec` descubre la suite con el patrón de `.rspec`. Tampoco hay clase envolvente, siguiendo el patrón de módulo del repositorio.
- **EN:** Deviation note from the expected location: `src/naive_sort.rb` is kept (only the extension changes) and the suite is named `test/naive_sort_tests.rb`, with the plural suffix already used by `numbers/`; no `run_tests.rb` is added because `bundle exec rspec` discovers the suite with the `.rspec` pattern. There is no wrapper class either, following the repository's module pattern.

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*[← Volver a Algoritmos Puros](../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
