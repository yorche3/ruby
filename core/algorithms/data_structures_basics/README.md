# Data Structures Basics — Ruby

Implementación de la especificación [06_Data_Structures_Basics](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics/) en **Ruby**, utilizando **RSpec** como framework de pruebas unitarias y empaquetado estándar como gema con **Bundler**.

**ES:** Cuatro estructuras de datos construidas desde cero sobre una única celda enlazada `Node`: `Node`, `LinkedList`, `Stack` y `Queue`. Cada estructura gestiona sus propios punteros e invariantes sin delegar en `LinkedList` ni en tipos de colección de la biblioteca estándar de Ruby.

**EN:** Four data structures built from scratch over a single shared `Node` linked cell: `Node`, `LinkedList`, `Stack`, and `Queue`. Each structure directly manages its own pointers and invariants without delegating to `LinkedList` or standard library Ruby collection types.

---

## 📂 Archivos y estructura / Files & Structure

Describe la estructura del proyecto y el propósito de cada archivo.

| Archivo / Directory | Propósito / Purpose |
|---|---|
| [`data_structures_basics.gemspec`](data_structures_basics.gemspec) | Manifiesto de la gema: metadatos, dependencias de desarrollo y rutas. / Gem specification: metadata, development dependencies, and paths. |
| [`Gemfile`](Gemfile) | Configuración de Bundler vinculada al `.gemspec`. / Bundler configuration referencing the `.gemspec`. |
| [`Gemfile.lock`](Gemfile.lock) | Versiones exactas resueltas por Bundler. / Locked gem dependency versions resolved by Bundler. |
| [`Rakefile`](Rakefile) | Tareas de automatización Rake (`spec` y default). / Rake automation tasks (`spec` and default). |
| [`.rspec`](.rspec) | Opciones de ejecución de RSpec (`--require spec_helper`). / RSpec CLI options (`--require spec_helper`). |
| [`lib/data_structures_basics.rb`](lib/data_structures_basics.rb) | Punto de entrada principal de la biblioteca que carga los componentes. / Main library entry point loading all components. |
| [`lib/data_structures_basics/version.rb`](lib/data_structures_basics/version.rb) | Declaración de versión del módulo (`VERSION = "0.1.0"`). / Module version declaration (`VERSION = "0.1.0"`). |
| [`lib/data_structures_basics/node.rb`](lib/data_structures_basics/node.rb) | Celda enlazada compartida con `value`, `next` y mutador `next=`. / Shared linked cell with `value`, `next`, and mutator `next=`. |
| [`lib/data_structures_basics/linked_list.rb`](lib/data_structures_basics/linked_list.rb) | Lista enlazada con `head`, `tail`, `count`, inserción y borrado. / Singly linked list with `head`, `tail`, `count`, insertion, and deletion. |
| [`lib/data_structures_basics/stack.rb`](lib/data_structures_basics/stack.rb) | Pila LIFO independiente sobre `Node` (`push`, `pop`, `peek`). / Independent LIFO stack over `Node` (`push`, `pop`, `peek`). |
| [`lib/data_structures_basics/queue.rb`](lib/data_structures_basics/queue.rb) | Cola FIFO independiente sobre `Node` (`enqueue`, `dequeue`, `peek`). / Independent FIFO queue over `Node` (`enqueue`, `dequeue`, `peek`). |
| [`spec/spec_helper.rb`](spec/spec_helper.rb) | Configuración de RSpec y carga de la gema. / RSpec helper configuration and gem loading. |
| [`spec/node_spec.rb`](spec/node_spec.rb) | Pruebas de inicialización, enlace y recorrido de `Node`. / Unit tests for `Node` initialization, linking, and traversal. |
| [`spec/linked_list_spec.rb`](spec/linked_list_spec.rb) | Pruebas de operaciones sobre `LinkedList`. / Unit tests for `LinkedList` operations. |
| [`spec/stack_spec.rb`](spec/stack_spec.rb) | Pruebas de contrato LIFO y reutilización sobre `Stack`. / Unit tests for `Stack` LIFO contract and reuse. |
| [`spec/queue_spec.rb`](spec/queue_spec.rb) | Pruebas de contrato FIFO y reutilización sobre `Queue`. / Unit tests for `Queue` FIFO contract and reuse. |
| [`src/data_structures_basics.rb`](src/data_structures_basics.rb) | Puente de compatibilidad que redirige a `lib/data_structures_basics.rb`. / Compatibility bridge redirecting to `lib/data_structures_basics.rb`. |

**Estructura de directorios / Directory structure:**

```text
data_structures_basics/
├── .rspec
├── Gemfile
├── Gemfile.lock
├── Rakefile
├── data_structures_basics.gemspec
├── lib/
│   ├── data_structures_basics.rb
│   └── data_structures_basics/
│       ├── linked_list.rb
│       ├── node.rb
│       ├── queue.rb
│       ├── stack.rb
│       └── version.rb
├── spec/
│   ├── linked_list_spec.rb
│   ├── node_spec.rb
│   ├── queue_spec.rb
│   ├── spec_helper.rb
│   └── stack_spec.rb
└── src/
    └── data_structures_basics.rb
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto sigue el layout estándar de gemas en Ruby (`lib/` para código fuente estructurado en submódulos, `spec/` para pruebas unitarias con RSpec y archivo `data_structures_basics.gemspec` para dependencias). Para mantener compatibilidad con las herramientas del monorepo que buscan `src/data_structures_basics.rb`, se mantiene un puente mínimo que carga la biblioteca real desde `lib/`.

**EN:** The project follows standard Ruby gem conventions (`lib/` for structured source code, `spec/` for unit tests with RSpec, and `data_structures_basics.gemspec` for dependencies). For compatibility with monorepo tooling expecting `src/data_structures_basics.rb`, a thin bridge file in `src/` requires the main library entry point in `lib/`.

### Inicialización / Initialization

```bash
bundle install
```

---

## 📄 Configuración clave / Key Configuration

### `data_structures_basics.gemspec`

```ruby
# frozen_string_literal: true

require_relative "lib/data_structures_basics/version"

Gem::Specification.new do |spec|
  spec.name          = "data_structures_basics"
  spec.version       = DataStructuresBasics::VERSION
  spec.authors       = ["yorche3"]
  spec.email         = ["hyaoki123@gmail.com"]
  spec.summary       = "Basic linked data structures built from scratch"
  spec.license       = "GPL-3.0-or-later"
  spec.required_ruby_version = ">= 3.0"
  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.13"
end
```

---

## 🚀 Compilación y ejecución / Build & Run

```bash
# Verificación de sintaxis / Syntax check
ruby -w -c lib/data_structures_basics.rb lib/data_structures_basics/*.rb

# Ejecución de pruebas con RSpec / Run tests with RSpec
bundle exec rspec --format documentation
```

**Salida real / Actual output:**

```text
DataStructuresBasics::LinkedList
  executes the linked-list scenarios

DataStructuresBasics::Node
  observes initialized and linked nodes

DataStructuresBasics::Queue
  executes the queue scenarios

DataStructuresBasics::Stack
  executes the stack scenarios

Finished in 0.00179 seconds (files took 0.05848 seconds to load)
4 examples, 0 failures
```

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

### `Node`

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Node.new(value)` | `Integer → Node` | $O(1)$ | Constructor (`init(value)`); asigna valor y deja `next` en `nil`. / Constructor (`init(value)`); assigns value and sets `next` to `nil`. |
| `node.value` | `→ Integer` | $O(1)$ | Lector observador (`get_value`). / Observer reader (`get_value`). |
| `node.next` | `→ Node \| nil` | $O(1)$ | Lector observador (`get_next`); `nil` cuando ausente. / Observer reader (`get_next`); `nil` when absent. |
| `node.next = other` | `Node \| nil → Node \| nil` | $O(1)$ | Mutador de enlace (`set_next`). / Link mutator (`set_next`). |

### `LinkedList`

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `LinkedList.new` | `→ LinkedList` | $O(1)$ | Constructor (`init()`); cabeza y cola en `nil`, contador en 0. / Constructor (`init()`); head and tail `nil`, count 0. |
| `list.head` | `→ Integer` | $O(1)$ | Observa valor de cabeza (`get_head`); `-1` si está vacía. / Observes head value (`get_head`); `-1` if empty. |
| `list.insert_head(value)` | `Integer → Integer` | $O(1)$ | Inserta celda al inicio y actualiza punteros. / Inserts cell at front and updates pointers. |
| `list.insert_tail(value)` | `Integer → Integer` | $O(1)$ | Inserta celda al final y actualiza punteros. / Inserts cell at end and updates pointers. |
| `list.delete(value)` | `Integer → bool` | $O(n)$ | Elimina primera aparición; `true` en éxito, `false` si ausente. / Deletes first occurrence; `true` on success, `false` if absent. |
| `list.empty?` | `→ bool` | $O(1)$ | Predicado de vacío (`is_empty`); consulta si el contador es 0. / Emptiness predicate (`is_empty`); queries if count is 0. |
| `list.size` / `list.count` | `→ Integer` | $O(1)$ | Retorna el número de elementos. / Returns the number of elements. |

### `Stack`

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Stack.new` | `→ Stack` | $O(1)$ | Constructor (`init()`); cima en `nil`, contador en 0. / Constructor (`init()`); top `nil`, count 0. |
| `stack.push(value)` | `Integer → Integer` | $O(1)$ | Apila nuevo nodo en la cima y actualiza `top`. / Pushes new node onto top and updates `top`. |
| `stack.pop` | `→ Integer` | $O(1)$ | Desapila y retorna valor de la cima; `-1` si vacía. / Pops and returns top value; `-1` if empty. |
| `stack.peek` | `→ Integer` | $O(1)$ | Observa la cima sin desapilar; `-1` si vacía. / Peeks top without popping; `-1` if empty. |
| `stack.empty?` | `→ bool` | $O(1)$ | Predicado de vacío (`is_empty`). / Emptiness predicate (`is_empty`). |
| `stack.size` | `→ Integer` | $O(1)$ | Retorna el número de elementos en la pila. / Returns the number of elements in stack. |

### `Queue`

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Queue.new` | `→ Queue` | $O(1)$ | Constructor (`init()`); frente/final en `nil`, contador en 0. / Constructor (`init()`); front/rear `nil`, count 0. |
| `queue.enqueue(value)` | `Integer → Integer` | $O(1)$ | Encola nuevo nodo por el final. / Enqueues new node at rear. |
| `queue.dequeue` | `→ Integer` | $O(1)$ | Desencola y retorna valor del frente; `-1` si vacía. / Dequeues and returns front value; `-1` if empty. |
| `queue.peek` | `→ Integer` | $O(1)$ | Observa el frente sin desencolar; `-1` si vacía. / Peeks front without dequeueing; `-1` if empty. |
| `queue.empty?` | `→ bool` | $O(1)$ | Predicado de vacío (`is_empty`). / Emptiness predicate (`is_empty`). |
| `queue.size` | `→ Integer` | $O(1)$ | Retorna el número de elementos en la cola. / Returns the number of elements in queue. |

---

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| Empaquetado como gema estándar (`lib/`, `.gemspec`, `spec/`) | Archivo único plano en `src/` | Permite estructurar cada clase en un archivo independiente bajo su espacio de nombres idiomático en Ruby, facilitando mantenimiento y aislamiento. / Follows idiomatic Ruby gem structure with separate files per class within its namespace, improving maintenance and isolation. |
| Nomenclatura idiomática (`empty?`, `size`/`count`, `initialize`) | Métodos literales `is_empty`, `get_head`, `init` | En Ruby los predicados booleanos terminan idiomáticamente en `?`, los constructores se invocan con `new` (`initialize`) y los accesores no usan el prefijo `get_`. / Ruby idiomatically uses `?` for predicates, `new` (`initialize`) for constructors, and bare accessors without `get_`. |
| Indicador de fallo numérico `-1` para lecturas enteras vacías | Devolver `nil` o lanzar excepciones | Se alinea con la política del roadmap para esta fase, permitiendo distinguir un resultado entero no válido sin recurrir a excepciones y manteniendo `nil` exclusivamente para enlaces de nodos ausentes. / Aligns with roadmap policy for this phase, distinguishing invalid integer results without exceptions while keeping `nil` strictly for absent node links. |

---

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| `init()` / `init(value)` | Métodos `initialize` llamados vía `Class.new` | Mecanismo idiomático estándar de inicialización de instancias en Ruby. / Standard idiomatic instance initialization mechanism in Ruby. |
| `get_value()`, `get_next()`, `set_next(next)` | Métodos accesores `value`, `next` y mutador `next=` | Convención estándar en Ruby para accesores y mutadores sin prefijos `get_`/`set_`. / Standard Ruby convention for accessors and mutators avoiding `get_`/`set_` prefixes. |
| `is_empty()` | Método predicado `empty?` | Convención obligatoria de estilo en Ruby para métodos que retornan un booleano de consulta de estado. / Mandatory Ruby convention for predicate methods returning boolean state queries. |
| `get_head()` | Método accesor `head` | Convención de nombres idiomática para consulta de atributo/valor en Ruby. / Idiomatic naming convention for attribute/value query in Ruby. |
| Ubicación esperada: `src/data_structures_basics.ext` | `lib/data_structures_basics/*.rb` y puente `src/` | Estructura estándar de gema Ruby con múltiples archivos modularizados y puente en `src/` para compatibilidad de herramientas. / Standard Ruby gem layout with modularized files and bridge in `src/` for toolchain compatibility. |
| Ubicación esperada: `test/run_tests.ext` | `spec/*_spec.rb` ejecutado con `rspec` | RSpec es el framework estándar de pruebas en el ecosistema Ruby y resuelve la ejecución mediante su CLI nativa o `rake spec`. / RSpec is the standard Ruby test framework and handles test running via its CLI or `rake spec`. |

---

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `node.next` | Enlace ausente | `nil` | `DataStructuresBasics::Node.new(10).next` → `nil` |
| `list.head` | Lista vacía | `-1` | `DataStructuresBasics::LinkedList.new.head` → `-1` |
| `list.delete(value)` | Valor ausente en la lista | `false` | `DataStructuresBasics::LinkedList.new.delete(99)` → `false` |
| `stack.peek` | Pila vacía | `-1` | `DataStructuresBasics::Stack.new.peek` → `-1` |
| `stack.pop` | Pila vacía | `-1` | `DataStructuresBasics::Stack.new.pop` → `-1` |
| `queue.peek` | Cola vacía | `-1` | `DataStructuresBasics::Queue.new.peek` → `-1` |
| `queue.dequeue` | Cola vacía | `-1` | `DataStructuresBasics::Queue.new.dequeue` → `-1` |

---

## ✅ Cobertura de pruebas / Test coverage

### `Node`

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| Inicializar y observar valor/enlace<br>Initialize and observe value/link | Sí | `spec/node_spec.rb:18-23` | Comprueba `value == 10` y `next == nil`. / Checks `value == 10` and `next == nil`. |
| Inicializar otro nodo, enlazar y recorrer<br>Initialize another node, link and traverse | Sí | `spec/node_spec.rb:24-31` | Enlaza con segundo nodo y verifica recorrido `first_node.next.value == 20` y `second_node.next == nil`. / Links with second node and verifies traversal `first_node.next.value == 20` and `second_node.next == nil`. |

### `LinkedList`

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| Estado vacío<br>Empty state | Sí | `spec/linked_list_spec.rb:22-29` | Verifica `empty? == true`, `size == 0` y `head == -1`. / Verifies `empty? == true`, `size == 0`, and `head == -1`. |
| Insertar por ambos extremos<br>Insert at both ends | Sí | `spec/linked_list_spec.rb:30-40` | Inserta 10 (cola), 20 (cola), 5 (cabeza), 10 (cola); verifica `size == 4` y `head == 5`. / Inserts 10 (tail), 20 (tail), 5 (head), 10 (tail); verifies `size == 4` and `head == 5`. |
| Eliminar primera aparición<br>Delete first occurrence | Sí | `spec/linked_list_spec.rb:41-48` | Elimina primera aparición de 10; verifica retorno `true`, `size == 3` y preservación de `head == 5`. / Deletes first occurrence of 10; verifies `true` return, `size == 3`, and `head == 5`. |
| Valor ausente<br>Absent value | Sí | `spec/linked_list_spec.rb:49-56` | Intenta eliminar 99; verifica retorno `false` y estado inalterado (`size == 3`, `head == 5`). / Deletes 99; verifies `false` return and unchanged state (`size == 3`, `head == 5`). |
| Vaciar<br>Empty the list | Sí | `spec/linked_list_spec.rb:57-74` | Elimina sucesivamente 5, 20, 10; verifica retornos `true`, orden intermedio y vaciado final (`empty? == true`, `size == 0`, `head == -1`). / Deletes 5, 20, 10; verifies `true` returns, intermediate order, and final empty state (`empty? == true`, `size == 0`, `head == -1`). |

### `Stack`

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| Estado vacío y extracción fallida<br>Empty state and failed removal | Sí | `spec/stack_spec.rb:21-30` | Verifica `empty? == true`, `size == 0`, `peek == -1` y `pop == -1`. / Verifies `empty? == true`, `size == 0`, `peek == -1`, and `pop == -1`. |
| LIFO y `peek` no mutante<br>LIFO and non-mutating `peek` | Sí | `spec/stack_spec.rb:31-40` | Apila 10, 20, 30; verifica `peek == 30` y `size == 3`. / Pushes 10, 20, 30; verifies `peek == 30` and `size == 3`. |
| Extracción y reutilización<br>Removal and reuse | Sí | `spec/stack_spec.rb:41-56` | Desapila 30, apila 40, desapila 40, 20, 10; verifica orden LIFO y vaciado final (`empty? == true`, `size == 0`). / Pops 30, pushes 40, pops 40, 20, 10; verifies LIFO order and final empty state (`empty? == true`, `size == 0`). |
| Vacío tras extracción<br>Empty after removal | Sí | `spec/stack_spec.rb:57-62` | Intenta `pop` en pila vacía; verifica retorno `-1` y preservación de `empty? == true`. / Calls `pop` on empty stack; verifies `-1` return and preserved `empty? == true`. |

### `Queue`

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| Estado vacío y extracción fallida<br>Empty state and failed removal | Sí | `spec/queue_spec.rb:21-30` | Verifica `empty? == true`, `size == 0`, `peek == -1` y `dequeue == -1`. / Verifies `empty? == true`, `size == 0`, `peek == -1`, and `dequeue == -1`. |
| FIFO y `peek` no mutante<br>FIFO and non-mutating `peek` | Sí | `spec/queue_spec.rb:31-40` | Encola 10, 20, 30; verifica `peek == 10` y `size == 3`. / Enqueues 10, 20, 30; verifies `peek == 10` and `size == 3`. |
| Extracción y reutilización<br>Removal and reuse | Sí | `spec/queue_spec.rb:41-56` | Desencola 10, encola 40, desencola 20, 30, 40; verifica orden FIFO y vaciado final (`empty? == true`, `size == 0`). / Dequeues 10, enqueues 40, dequeues 20, 30, 40; verifies FIFO order and final empty state (`empty? == true`, `size == 0`). |
| Vacío tras extracción<br>Empty after removal | Sí | `spec/queue_spec.rb:57-62` | Intenta `dequeue` en cola vacía; verifica retorno `-1` y preservación de `empty? == true`. / Calls `dequeue` on empty queue; verifies `-1` return and preserved `empty? == true`. |

---

## ⚠️ Limitaciones conocidas / Known limitations

| Limitación / Limitation | Impacto / Impact | Alternativa o plan / Workaround or plan |
|---|---|---|
| Dominio restringido por centinela `-1` | Las colecciones que almacenen `-1` no distinguirán el valor almacenado del indicador de fallo en `head`, `peek`, `pop` o `dequeue`. / Collections storing `-1` cannot distinguish the stored value from failure indicators on `head`, `peek`, `pop`, or `dequeue`. | Conforme a la especificación, los valores de prueba pertenecen al dominio de enteros positivos. Futuras fases o módulos avanzados pueden emplear tipos suma o `nil` con excepciones controladas. / In accordance with the specification, test values use positive integers. Future phases or advanced modules may use sum types or `nil` with controlled exceptions. |

---

## 📝 Notas de implementación / Implementation Notes

- **Celda única compartida:** `DataStructuresBasics::Node` es la única entidad de enlace del módulo. Tanto `LinkedList` como `Stack` y `Queue` reutilizan esta clase directamente.
- **Independencia de punteros:** Ni `Stack` ni `Queue` heredan ni contienen instancias de `LinkedList`. `Stack` gestiona su propio puntero `@top` y `@count`, mientras que `Queue` gestiona sus propios punteros `@front`, `@rear` y `@count`.
- **Manejo de nulos y ausencias:** En Ruby, la ausencia nativa de referencia a objeto es `nil`. Se utiliza exclusivamente para el puntero `@next` de un nodo cuando no hay celda enlazada posterior, y para los punteros de inicialización/vaciado de cabeza, cola, tope o frente.
- **Valores de retorno en fallo:** Para mantener estricta coherencia con las pruebas del roadmap de algoritmos básicos, las consultas de extracción y observación sobre estructuras vacías (`head`, `peek`, `pop`, `dequeue`) retornan `-1` en lugar de lanzar excepciones como `KeyError` o `IndexError`. La operación `delete` retorna un booleano (`true` si eliminó un nodo coincidente, `false` si no lo encontró).

**ES:** Este proyecto también está implementado en otros lenguajes. Explora el repositorio principal para consultar las demás versiones.

**EN:** This project is also implemented in other languages. Explore the main repository to see the other versions.

---

## 🔍 Checklist de validación / Validation checklist

- [x] La suite nativa se ejecutó y su salida real está copiada en este README.
- [x] Cada caso de la especificación tiene su fila en _Cobertura de pruebas_ (o `Omitido` con razón).
- [x] Cada desviación del pseudocódigo o de la ubicación esperada está en _Adaptaciones idiomáticas_.
- [x] Cada operación con fallo posible está en _Indicadores de fallo_.
- [x] No hay rutas absolutas del autor, credenciales ni salidas inventadas.
- [x] Los enlaces relativos resuelven dentro del repositorio y el documento es bilingüe.
- [x] Ninguna sección repite lo que ya dice la especificación.

---

## 📚 Referencias / References

| Tipo / Kind | Referencia / Reference |
|---|---|
| Especificación / Specification | [`06_Data_Structures_Basics.md`](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics/) |
| Módulo homologado del lenguaje / Homologated module | [`ruby/core/foundations/numbers/`](../../foundations/numbers/README.md) |
| Guía de inicialización / Initialisation guide | [`core/00_Project_Initialization_Guide.md`](../../../docs/core/00_Project_Initialization_Guide.md) |
| Adaptaciones idiomáticas / Idiomatic adaptations | [`AGENT_Template.md`](../../../docs/AGENT_Template.md) |
| Validación de la documentación / Documentation validation | [`WORKFLOW.md`](../../../docs/WORKFLOW.md) |
| Documentación oficial del lenguaje / Language official docs | [Ruby Documentation](https://www.ruby-lang.org/en/documentation/) |
