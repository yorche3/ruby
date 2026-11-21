# Data Structures Advanced — Ruby

Implementación de la especificación [07_Data_Structures_Advanced](https://yorche3.github.io/programming_languages/core/algorithms/07_Data_Structures_Advanced/) en **Ruby**, utilizando **RSpec** como framework de pruebas unitarias y empaquetado estándar como gema con **Bundler**.

**ES:** Dos estructuras de datos construidas desde cero con múltiples enlaces por celda: un árbol binario de búsqueda (`BinaryTree` sobre `TreeNode`) y un grafo dirigido (`Graph` sobre `GraphNode`). Ambos tipos de nodo derivan mediante herencia de una clase base común `Node` que contiene exclusivamente el valor o etiqueta, sin validaciones ni enlaces propios.

**EN:** Two data structures built from scratch with multiple links per cell: a binary search tree (`BinaryTree` over `TreeNode`) and a directed graph (`Graph` over `GraphNode`). Both node types derive via inheritance from a common base class `Node` that encapsulates strictly the value or label, without validations or links of its own.

---

## 📂 Archivos y estructura / Files & Structure

Describe la estructura del proyecto y el propósito de cada archivo.

| Archivo / Directory | Propósito / Purpose |
|---|---|
| [`data_structures_advanced.gemspec`](data_structures_advanced.gemspec) | Manifiesto de la gema: metadatos, dependencias de desarrollo y rutas. / Gem specification: metadata, development dependencies, and paths. |
| [`Gemfile`](Gemfile) | Configuración de Bundler vinculada al `.gemspec`. / Bundler configuration referencing the `.gemspec`. |
| [`Gemfile.lock`](Gemfile.lock) | Versiones exactas resueltas por Bundler. / Locked gem dependency versions resolved by Bundler. |
| [`Rakefile`](Rakefile) | Tareas de automatización Rake (`spec` y default). / Rake automation tasks (`spec` and default). |
| [`.rspec`](.rspec) | Opciones de ejecución de RSpec. / RSpec CLI options. |
| [`.gitignore`](.gitignore) | Archivos y artefactos ignorados por Git. / Git ignored files and build artifacts. |
| [`lib/data_structures_advanced.rb`](lib/data_structures_advanced.rb) | Punto de entrada principal de la biblioteca que carga los componentes. / Main library entry point loading all components. |
| [`lib/data_structures_advanced/node.rb`](lib/data_structures_advanced/node.rb) | Clase base `Node` con valor, sin enlaces ni validaciones. / Base `Node` class with value, without links or validations. |
| [`lib/data_structures_advanced/tree_node.rb`](lib/data_structures_advanced/tree_node.rb) | Nodo de árbol `TreeNode` derivado de `Node`, con punteros mutables `left` y `right`. / Tree node `TreeNode` deriving from `Node`, with mutable `left` and `right` links. |
| [`lib/data_structures_advanced/binary_tree.rb`](lib/data_structures_advanced/binary_tree.rb) | Árbol binario de búsqueda con inserción, pertenencia e invariantes BST. / Binary search tree with insertion, membership, and BST invariants. |
| [`lib/data_structures_advanced/graph_node.rb`](lib/data_structures_advanced/graph_node.rb) | Nodo de grafo `GraphNode` derivado de `Node`, con lista de vecinos y puntero al registro enlazado `next_vertex`. / Graph node `GraphNode` deriving from `Node`, with neighbor sequence and `next_vertex` link. |
| [`lib/data_structures_advanced/graph.rb`](lib/data_structures_advanced/graph.rb) | Grafo dirigido con registro enlazado canónico de vértices y adyacencia ordenada. / Directed graph with canonical linked vertex registry and sorted adjacency. |
| [`spec/spec_helper.rb`](spec/spec_helper.rb) | Configuración de RSpec (`disable_monkey_patching!`). / RSpec helper configuration. |
| [`spec/tree_node_spec.rb`](spec/tree_node_spec.rb) | Pruebas unitarias para `TreeNode` (enlaces, recorrido, desenlace). / Unit tests for `TreeNode` (links, traversal, unlinking). |
| [`spec/binary_tree_spec.rb`](spec/binary_tree_spec.rb) | Pruebas unitarias para `BinaryTree` (inserción, duplicados, pertenencia). / Unit tests for `BinaryTree` (insertion, duplicates, membership). |
| [`spec/graph_spec.rb`](spec/graph_spec.rb) | Pruebas unitarias para `Graph` (vértices, aristas, vecinos ordenados, aislamiento). / Unit tests for `Graph` (vertices, edges, sorted neighbors, isolation). |
| [`src/data_structures_advanced.rb`](src/data_structures_advanced.rb) | Puente de compatibilidad que redirige a `lib/data_structures_advanced.rb`. / Compatibility bridge redirecting to `lib/data_structures_advanced.rb`. |

**Estructura de directorios / Directory structure:**

```text
data_structures_advanced/
├── .gitignore
├── .rspec
├── Gemfile
├── Gemfile.lock
├── Rakefile
├── data_structures_advanced.gemspec
├── lib/
│   ├── data_structures_advanced.rb
│   └── data_structures_advanced/
│       ├── binary_tree.rb
│       ├── graph.rb
│       ├── graph_node.rb
│       ├── node.rb
│       └── tree_node.rb
├── spec/
│   ├── binary_tree_spec.rb
│   ├── graph_spec.rb
│   ├── spec_helper.rb
│   └── tree_node_spec.rb
└── src/
    └── data_structures_advanced.rb
```

**Nota de desviación de ubicación / Location deviation note:**

**ES:** La especificación propone un único archivo `src/data_structures_advanced.ext` y un runner `test/run_tests.ext`. En Ruby, la convención estándar y mantenible es estructurar las clases en módulos bajo `lib/`, usar `data_structures_advanced.gemspec` para metadatos y dependencias, y ubicar las suites RSpec en `spec/*_spec.rb`. Se mantiene un archivo puente mínimo `src/data_structures_advanced.rb` para compatibilidad con herramientas del monorepo.

**EN:** The specification suggests a single source file `src/data_structures_advanced.ext` and a runner `test/run_tests.ext`. In Ruby, the idiomatic convention organizes classes within modules under `lib/`, uses `data_structures_advanced.gemspec` for metadata and dependencies, and places RSpec suites under `spec/*_spec.rb`. A minimal bridge file `src/data_structures_advanced.rb` is retained for monorepo tooling compatibility.

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** El proyecto sigue el layout estándar de gemas en Ruby (`lib/` para código fuente estructurado en módulos, `spec/` para pruebas unitarias con RSpec y archivo `data_structures_advanced.gemspec` para dependencias). Para mantener compatibilidad con las herramientas del monorepo que buscan `src/data_structures_advanced.rb`, se mantiene un puente mínimo que carga la biblioteca real desde `lib/`.

**EN:** The project follows standard Ruby gem conventions (`lib/` for structured source code, `spec/` for unit tests with RSpec, and `data_structures_advanced.gemspec` for dependencies). For compatibility with monorepo tooling expecting `src/data_structures_advanced.rb`, a thin bridge file in `src/` requires the main library entry point in `lib/`.

### Inicialización / Initialization

```bash
bundle install
```

---

## 📄 Configuración clave / Key Configuration

### `data_structures_advanced.gemspec`

```ruby
# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "data_structures_advanced"
  spec.version       = "0.1.0"
  spec.authors       = ["yorche3"]
  spec.email         = ["hyaoki123@gmail.com"]
  spec.summary       = "Advanced data structures: Binary Search Tree and Directed Graph"
  spec.license       = "GPL-3.0-or-later"
  spec.required_ruby_version = ">= 3.0"
  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.13"
end
```

### `Rakefile`

```ruby
# frozen_string_literal: true

require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec
```

---

## 🚀 Compilación y ejecución / Build & Run

```bash
# Verificación de sintaxis / Syntax check
ruby -w -c lib/data_structures_advanced.rb lib/data_structures_advanced/*.rb

# Ejecución de pruebas con RSpec / Run tests with RSpec
bundle exec rspec --format documentation
```

**Salida real / Actual output:**

```text
DataStructuresAdvanced::BinaryTree
  Create empty
  Insert the root
  Insert lower and higher
  Multilevel branches
  Missing value in nonempty tree
  Idempotent duplicate
  Ordered insertions

DataStructuresAdvanced::Graph
  Create empty
  Isolated vertex
  Nonconsecutive labels and directed edge
  Duplicate vertex preserves adjacency
  Duplicate edge
  Missing endpoint without mutation
  Sorted neighbours and counts
  Missing-edge query
  Neighbours of missing vertex
  Self-loop and duplicate
  Neighbour-result isolation

DataStructuresAdvanced::TreeNode
  Create a tree node
  Absent initial links
  Link two children
  Traverse each link
  Unlink children

Finished in 0.00311 seconds (files took 0.04338 seconds to load)
23 examples, 0 failures
```

---

## 🧠 Algoritmos y operaciones / Algorithms & Operations

### `Node`

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Node.new(value)` | `Integer → Node` | $O(1)$ | Constructor (`init(value)`); base que solo almacena `@value`, sin enlaces ni validaciones. / Constructor (`init(value)`); base storing only `@value`, without links or validations. |
| `node.value` | `→ Integer` | $O(1)$ | Lector observador (`get_value`). / Observer reader (`get_value`). |

### `TreeNode`

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `TreeNode.new(value)` | `Integer → TreeNode` | $O(1)$ | Constructor (`init(value)`); invoca `super(value)`, inicializa `left` y `right` en `nil`. / Constructor (`init(value)`); calls `super(value)`, initializes `left` and `right` to `nil`. |
| `node.value` | `→ Integer` | $O(1)$ | Lector de valor heredado de `Node`. / Value reader inherited from `Node`. |
| `node.left` / `node.right` | `→ TreeNode \| nil` | $O(1)$ | Observadores de enlace (`get_left`, `get_right`); `nil` cuando ausente. / Link observers (`get_left`, `get_right`); `nil` when absent. |
| `node.left = other` / `node.right = other` | `TreeNode \| nil → TreeNode \| nil` | $O(1)$ | Mutadores de enlace (`set_left`, `set_right`). / Link mutators (`set_left`, `set_right`). |

### `BinaryTree`

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `BinaryTree.new` | `→ BinaryTree` | $O(1)$ | Constructor (`init()`); raíz en `nil`, contador en 0. / Constructor (`init()`); root `nil`, count 0. |
| `tree.empty?` | `→ bool` | $O(1)$ | Consulta si la raíz es `nil`. / Queries whether root is `nil`. |
| `tree.size` | `→ Integer` | $O(1)$ | Retorna el número de nodos almacenados. / Returns the number of stored nodes. |
| `tree.insert(value)` | `Integer → bool` | $O(h)$ | Inserta preservando invariante ABB; duplicado no incrementa tamaño. / Inserts preserving BST invariant; duplicates do not increase size. |
| `tree.contains?(value)` | `Integer → bool` | $O(h)$ | Búsqueda guiada por la invariante ABB. / Membership search following BST invariant. |

### `GraphNode`

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `GraphNode.new(label)` | `Integer → GraphNode` | $O(1)$ | Constructor (`init(label)`); invoca `super(label)`, inicializa secuencia de vecinos vacía y `next_vertex` en `nil`. / Constructor (`init(label)`); calls `super(label)`, initializes empty neighbors sequence and `next_vertex` to `nil`. |
| `node.value` | `→ Integer` | $O(1)$ | Retorna la etiqueta del vértice heredada de `Node`. / Returns vertex label inherited from `Node`. |
| `node.neighbors` | `→ Array<Integer>` | $O(1)$ | Secuencia interna de vecinos en orden creciente. / Internal sequence of neighbors in ascending order. |
| `node.next_vertex` / `node.next_vertex = other` | `GraphNode \| nil → GraphNode \| nil` | $O(1)$ | Enlace al siguiente nodo en el registro enlazado canónico. / Link to next node in canonical linked vertex registry. |

### `Graph`

| Operación / Operation | Entrada → salida / Input → output | Complejidad / Complexity | Notas / Notes |
|---|---|---|---|
| `Graph.new` | `→ Graph` | $O(1)$ | Constructor (`init()`); registro de vértices vacío (`nil`), contadores en 0. / Constructor (`init()`); empty vertex registry (`nil`), counts at 0. |
| `graph.empty?` | `→ bool` | $O(1)$ | Consulta si la cantidad de vértices es 0. / Queries whether vertex count is 0. |
| `graph.vertex_count` | `→ Integer` | $O(1)$ | Retorna el número de vértices registrados. / Returns total registered vertices. |
| `graph.edge_count` | `→ Integer` | $O(1)$ | Retorna el número de aristas dirigidas distintas. / Returns total distinct directed edges. |
| `graph.add_vertex(label)` | `Integer → bool` | $O(V)$ | Registra vértice si no existe; prepende al registro enlazado canónico. / Registers vertex if absent; prepends to canonical linked registry. |
| `graph.add_edge(u, v)` | `(Integer, Integer) → bool` | $O(V + d(u))$ | Añade arista si ambos extremos existen; inserción ordenada en vecinos; idempotente en aristas duplicadas. / Adds edge if both endpoints exist; sorted insertion into neighbors; idempotent for duplicates. |
| `graph.has_edge?(u, v)` | `(Integer, Integer) → bool` | $O(V + d(u))$ | Verifica existencia de ambos vértices y presencia de arista dirigida. / Checks existence of both vertices and presence of directed edge. |
| `graph.neighbors(u)` | `Integer → Array<Integer> \| nil` | $O(V + d(u))$ | Retorna copia independiente (`dup`) de vecinos ordenados si `u` existe; `nil` si `u` no existe. / Returns independent copy (`dup`) of sorted neighbors if `u` exists; `nil` if `u` is missing. |

---

## 🧩 Decisiones de diseño / Design decisions

| Decisión / Decision | Alternativa considerada / Alternative | Razón / Reason |
|---|---|---|
| Reutilización mediante herencia de clases (forma A1) | Valor embebido en cada nodo hijo (forma A2) | Ruby es un lenguaje orientado a objetos con soporte nativo para herencia de clases; `TreeNode < Node` y `GraphNode < Node` reutilizan `@value` en la clase base respetando el contrato de ausencia de validaciones en la base. / Ruby is an object-oriented language with native class inheritance; `TreeNode < Node` and `GraphNode < Node` reuse `@value` in base class complying with the contract of no validations in base. |
| Registro canónico de vértices mediante lista enlazada propia (`@vertices`, `next_vertex`) | `Hash` o `Array` asociativo de biblioteca | La especificación prohíbe delegar el registro de vértices en mapas o índices hash; el recorrido manual $O(V)$ preserva los objetivos pedagógicos y las cotas algorítmicas contractuales. / The specification prohibits delegating vertex registry to maps or hash indexes; manual $O(V)$ traversal preserves pedagogical goals and contractual algorithmic bounds. |
| Almacenamiento de vecinos en array ordenado en inserción ($O(d(u))$) | Insertar desordenado y ordenar en consulta | Cumple la política de complejidad de la especificación ($O(V + d(u))$ al consultar) y garantiza resultados deterministas sin costo $O(d(u) \log d(u))$ adicional durante la lectura. / Complies with specification complexity policy ($O(V + d(u))$ on query) and guarantees deterministic output without $O(d(u) \log d(u))$ query overhead. |
| Aislamiento de secuencia devuelta en `neighbors(u)` mediante `.dup` | Retornar referencia directa al array interno `@neighbors` | Protege el estado interno del grafo contra mutaciones externas en el cliente, cumpliendo el caso de aislamiento de vecinos. / Protects internal graph state against external client mutations, satisfying the neighbor isolation test case. |
| Retorno de `nil` para vértice inexistente en `neighbors(u)` | Retornar array vacío `[]` o lanzar excepción | Permite distinguir inequívocamente entre un vértice aislado que existe sin vecinos (`[]`) y un vértice que no pertenece al grafo (`nil`), sin requerir excepciones. / Unambiguously distinguishes an existing isolated vertex with no neighbors (`[]`) from a vertex not present in the graph (`nil`), without raising exceptions. |

---

## 🔀 Adaptaciones idiomáticas / Idiomatic adaptations

| Especificación / Specification | Adaptación / Adaptation | Justificación / Justification |
|---|---|---|
| `init(value)` / `init()` | Métodos `initialize` invocados vía `Class.new` | Mecanismo estándar e idiomático de inicialización de instancias en Ruby. / Standard idiomatic instance initialization mechanism in Ruby. |
| `get_value()` | Método accesor `value` (`attr_reader :value`) | Convención estándar en Ruby para accesores sin prefijo `get_`. / Standard Ruby convention for attribute accessors avoiding `get_` prefix. |
| `get_left()`, `get_right()`, `set_left()`, `set_right()` | Accesores `left`, `right` y mutadores `left=`, `right=` (`attr_accessor`) | Convención idiomática de atributos legibles y mutables en Ruby. / Idiomatic Ruby convention for readable and mutable attributes. |
| `is_empty()` | Métodos predicado `empty?` en `BinaryTree` y `Graph` | Convención obligatoria de estilo en Ruby para métodos que consultan estado booleano. / Mandatory Ruby style convention for boolean predicate query methods. |
| `contains(value)` | Método predicado `contains?(value)` | Sufijo `?` idiomático para métodos de consulta de pertenencia booleana en Ruby. / Idiomatic `?` suffix for boolean membership query methods in Ruby. |
| `has_edge(u, v)` | Método predicado `has_edge?(u, v)` | Sufijo `?` idiomático para métodos de consulta de existencia booleana en Ruby. / Idiomatic `?` suffix for boolean existence query methods in Ruby. |
| Ubicación esperada: `src/data_structures_advanced.ext` | `lib/data_structures_advanced/*.rb` con puente en `src/` | Estructura modular estándar de gemas en Ruby con puente en `src/` para compatibilidad de herramientas. / Standard modular Ruby gem structure with bridge in `src/` for tooling compatibility. |
| Runner esperado: `test/run_tests.ext` | `spec/*_spec.rb` ejecutado con `rspec` | RSpec es el estándar de facto de pruebas en Ruby, ejecutado con `bundle exec rspec` o `rake spec`. / RSpec is the de facto standard test framework in Ruby, executed via `bundle exec rspec` or `rake spec`. |

---

## 🚨 Indicadores de fallo / Failure indicators

| Operación / Operation | Situación de fallo / Failure situation | Indicador / Indicator | Ejemplo / Example |
|---|---|---|---|
| `tree_node.left` / `tree_node.right` | Enlace hijo ausente | `nil` | `DataStructuresAdvanced::TreeNode.new(10).left` → `nil` |
| `tree.contains?(value)` | Valor ausente en el árbol | `false` | `tree.contains?(99)` → `false` |
| `graph.add_edge(u, v)` | Extremo `u` o `v` inexistente | `false` | `graph.add_edge(10, 99)` → `false` |
| `graph.has_edge?(u, v)` | Arista ausente o extremo no registrado | `false` | `graph.has_edge?(10, 30)` → `false` |
| `graph.neighbors(u)` | Vértice `u` inexistente en el grafo | `nil` | `graph.neighbors(99)` → `nil` |

---

## ✅ Cobertura de pruebas / Test coverage

### `TreeNode`

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| Crear un nodo de árbol<br>Create a tree node | Sí | `spec/tree_node_spec.rb:14-17` | Verifica que `TreeNode.new(10).value == 10`. / Checks that `TreeNode.new(10).value == 10`. |
| Enlaces iniciales ausentes<br>Absent initial links | Sí | `spec/tree_node_spec.rb:19-24` | Verifica que `left` y `right` se inicializan en `nil`. / Checks that `left` and `right` initialize to `nil`. |
| Enlazar dos hijos<br>Link two children | Sí | `spec/tree_node_spec.rb:26-34` | Enlaza hijos 20 y 30; comprueba valores observados a través de `left` y `right`. / Links children 20 and 30; verifies observed values through `left` and `right`. |
| Recorrer cada enlace<br>Traverse each link | Sí | `spec/tree_node_spec.rb:36-50` | Recorre enlaces izquierdo y derecho, verificando valores y enlaces ausentes en hojas. / Traverses left and right links, checking values and absent links on leaf nodes. |
| Desenlazar hijos<br>Unlink children | Sí | `spec/tree_node_spec.rb:52-69` | Desasigna enlaces (`left = nil`, `right = nil`) y comprueba preservación de valor e hijos restantes. / Clears links (`left = nil`, `right = nil`) and verifies preservation of value and remaining children. |
| Adaptación inmutable (si aplica)<br>Immutable adaptation (if applicable) | Omitido | — | No aplica: Ruby utiliza enlaces mutables por referencia en `TreeNode`. / Not applicable: Ruby uses mutable reference links in `TreeNode`. |

### `BinaryTree`

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| Crear vacío<br>Create empty | Sí | `spec/binary_tree_spec.rb:33-39` | Verifica `empty? == true`, `size == 0` y `contains?(50) == false`. / Verifies `empty? == true`, `size == 0`, and `contains?(50) == false`. |
| Insertar la raíz<br>Insert the root | Sí | `spec/binary_tree_spec.rb:41-49` | Inserta 50; verifica retorno `true`, `size == 1`, `empty? == false` y `contains?(50) == true`. / Inserts 50; checks `true` return, `size == 1`, `empty? == false`, and `contains?(50) == true`. |
| Insertar menor y mayor<br>Insert lower and higher | Sí | `spec/binary_tree_spec.rb:51-59` | Inserta 50, 30, 70; verifica inserción exitosa, `size == 3` y pertenencia de los tres. / Inserts 50, 30, 70; checks successful insertion, `size == 3`, and membership of all three. |
| Ramas de varios niveles<br>Multilevel branches | Sí | `spec/binary_tree_spec.rb:61-69` | Inserta 50, 30, 70, 20, 40; verifica `size == 5` y pertenencia de todos los valores. / Inserts 50, 30, 70, 20, 40; checks `size == 5` and membership of all values. |
| Valor ausente en árbol no vacío<br>Missing value in nonempty tree | Sí | `spec/binary_tree_spec.rb:71-80` | Inserta 50; comprueba que `contains?(99) == false` y preserva `size == 1`. / Inserts 50; checks `contains?(99) == false` and preserved `size == 1`. |
| Duplicado idempotente<br>Idempotent duplicate | Sí | `spec/binary_tree_spec.rb:82-89` | Inserta 50, 30, 70 y reinserta 30; verifica `size == 3` y preservación de valores. / Inserts 50, 30, 70 and reinserts 30; checks `size == 3` and preservation of values. |
| Inserciones ordenadas<br>Ordered insertions | Sí | `spec/binary_tree_spec.rb:91-100` | Inserta 20, 30, 40, 50, 70; verifica `size == 5`, pertenencia de todos y ausencia de 99. / Inserts 20, 30, 40, 50, 70; checks `size == 5`, membership of all, and absence of 99. |

### `Graph`

| Caso de la especificación / Specification case | Cubierto / Covered | Prueba / Test | Notas / Notes |
|---|---|:--:|---|
| Crear vacío<br>Create empty | Sí | `spec/graph_spec.rb:41-49` | Comprueba `empty? == true`, `vertex_count == 0`, `edge_count == 0`, `has_edge?(10, 30) == false` y `neighbors(10) == nil`. / Verifies `empty? == true`, `vertex_count == 0`, `edge_count == 0`, `has_edge?(10, 30) == false`, and `neighbors(10) == nil`. |
| Vértice aislado<br>Isolated vertex | Sí | `spec/graph_spec.rb:51-58` | Registra 10; verifica `empty? == false`, `vertex_count == 1`, `edge_count == 0` y `neighbors(10) == []`. / Registers 10; checks `empty? == false`, `vertex_count == 1`, `edge_count == 0`, and `neighbors(10) == []`. |
| Etiquetas no consecutivas y arista dirigida<br>Nonconsecutive labels and directed edge | Sí | `spec/graph_spec.rb:60-70` | Registra 10 y 70, añade (10, 70); verifica `has_edge?(10, 70) == true`, `has_edge?(70, 10) == false`, `vertex_count == 2` y `edge_count == 1`. / Registers 10 and 70, adds (10, 70); checks `has_edge?(10, 70) == true`, `has_edge?(70, 10) == false`, `vertex_count == 2`, and `edge_count == 1`. |
| Vértice duplicado conserva adyacencia<br>Duplicate vertex preserves adjacency | Sí | `spec/graph_spec.rb:72-81` | Añade arista (10, 30) y re-añade vértice 10; verifica preservación de adyacencia `[30]`, 2 vértices y 1 arista. / Adds edge (10, 30) and re-adds vertex 10; checks preserved adjacency `[30]`, 2 vertices, and 1 edge. |
| Arista duplicada<br>Duplicate edge | Sí | `spec/graph_spec.rb:83-91` | Añade arista (10, 30) dos veces; comprueba idempotencia (`edge_count == 1`, vecinos `[30]`). / Adds edge (10, 30) twice; verifies idempotency (`edge_count == 1`, neighbors `[30]`). |
| Extremo inexistente sin mutación<br>Missing endpoint without mutation | Sí | `spec/graph_spec.rb:93-122` | Intenta añadir aristas con vértices inexistentes (98, 99); verifica retornos `false`, contadores intactos y fallos en consultas. / Tries adding edges with missing vertices (98, 99); checks `false` returns, intact counts, and failed lookups. |
| Vecinos ordenados y contadores<br>Sorted neighbours and counts | Sí | `spec/graph_spec.rb:124-137` | Registra 10, 30, 50, 70 con aristas desordenadas; verifica adyacencia ordenada `[30, 50, 70]` en 10, contadores 4 vértices y 4 aristas. / Registers 10, 30, 50, 70 with unsorted edge insertions; verifies sorted adjacency `[30, 50, 70]` on 10, 4 vertices and 4 edges. |
| Consulta de arista ausente<br>Missing-edge query | Sí | `spec/graph_spec.rb:139-147` | Consulta arista ausente (10, 30); comprueba `false` y estado intacto (2 vértices, 0 aristas). / Queries missing edge (10, 30); checks `false` and intact state (2 vertices, 0 edges). |
| Vecinos de vértice inexistente<br>Neighbours of missing vertex | Sí | `spec/graph_spec.rb:149-157` | Consulta `neighbors(99)`; comprueba retorno `nil`, distinguiéndolo inequívocamente de vecinos vacíos `[]` de 10. / Queries `neighbors(99)`; verifies `nil` return, unambiguously distinguishing from empty neighbors `[]` of 10. |
| Bucle y duplicado<br>Self-loop and duplicate | Sí | `spec/graph_spec.rb:159-168` | Registra vértice 10 y añade bucle (10, 10) dos veces; verifica `has_edge?(10, 10) == true`, vecinos `[10]`, 1 vértice y 1 arista. / Registers vertex 10 and adds loop (10, 10) twice; checks `has_edge?(10, 10) == true`, neighbors `[10]`, 1 vertex, and 1 edge. |
| Aislamiento del resultado de vecinos<br>Neighbour-result isolation | Sí | `spec/graph_spec.rb:170-184` | Modifica copia devuelta de vecinos y añade nueva arista posterior; verifica que la copia guardada no muta. / Mutates returned copy of neighbors and adds later edge; verifies saved copy remains unaltered. |

**Trazabilidad de agrupación / Grouping traceability:**

- `TreeNode`: `TreeNode` (variante única) → 5 casos aplicables → grupo `DataStructuresAdvanced::TreeNode` → `spec/tree_node_spec.rb` → `bundle exec rspec`.
- `BinaryTree`: `BinaryTree` (variante única) → 7 casos aplicables → grupo `DataStructuresAdvanced::BinaryTree` → `spec/binary_tree_spec.rb` → `bundle exec rspec`.
- `Graph`: `Graph` (variante única) → 11 casos aplicables → grupo `DataStructuresAdvanced::Graph` → `spec/graph_spec.rb` → `bundle exec rspec`.

---

## ⚠️ Limitaciones conocidas / Known limitations

| Limitación / Limitation | Impacto / Impact | Alternativa o plan / Workaround or plan |
|---|---|---|
| Ninguna / None | La implementación satisface todas las operaciones, invariantes y cotas de complejidad exigidas por la especificación para `BinaryTree` y `Graph` sin capacidades acotadas contractuales ni casos no controlados. / The implementation satisfies all required operations, invariants, and complexity bounds specified for `BinaryTree` and `Graph` without contractual capacity limits or unhandled edge cases. | No aplica / Not applicable. |

---

## 📝 Notas de implementación / Implementation Notes

- **Herencia desde `Node` (Forma A1):** La clase base `DataStructuresAdvanced::Node` declara únicamente `@value` accesible mediante `attr_reader :value`. No define enlaces ni lógica de validación, cumpliendo el criterio del módulo. Tanto `TreeNode` como `GraphNode` heredan de `Node` e inicializan sus campos específicos en sus constructores invocando `super(value)`.
- **Invariante BST e inserción no acotada:** `BinaryTree` no impone límites contractuales de capacidad. Las inserciones recorren el árbol iterativamente en tiempo $O(h)$ (donde $h$ es la altura del árbol). La pertenencia mediante `contains?` recorre exclusivamente la rama correspondiente según la invariante de ordenación, sin realizar búsquedas secuenciales.
- **Registro enlazado canónico de vértices:** En `Graph`, el registro de vértices no utiliza colecciones asociativas de la biblioteca estándar (`Hash` o `Set`). Los vértices se almacenan en una lista enlazada propia mediante el puntero `next_vertex` de `GraphNode`. La búsqueda interna `find_vertex(label)` recorre esta lista en tiempo $O(V)$, garantizando el cumplimiento del requisito de implementación manual.
- **Almacenamiento de vecinos y aislamiento:** La secuencia de adyacencia de cada vértice se almacena internamente en un array de Ruby. La inserción de aristas en `add_edge` inserta el vecino destino en orden estrictamente creciente en tiempo $O(d(u))$ manteniendo la ausencia de duplicados. La consulta `neighbors(u)` retorna una copia superficial duplicada (`dup`) del array de vecinos, asegurando que mutaciones posteriores del grafo o de la copia devuelta no alteren el estado interno.
- **Manejo de nulos e indicadores de fallo:** En Ruby, la ausencia de objeto es `nil`. Se utiliza como valor inicial de enlaces hijos en `TreeNode`, para la terminación del registro de vértices `next_vertex`, y como indicador de fallo en `neighbors(u)` cuando el vértice consultado no existe en el grafo. Para operaciones de predicado (`contains?`, `has_edge?`, `empty?`) y operaciones de inserción (`add_edge`), se retornan los booleanos nativos `true` y `false`.

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
| Especificación / Specification | [`07_Data_Structures_Advanced.md`](../../../../docs/core/algorithms/07_Data_Structures_Advanced.md) |
| Primera base del lenguaje / First language reference | `data_structures_basics` — [`../data_structures_basics/README.md`](../data_structures_basics/README.md) |
| Segunda base del lenguaje / Second language reference | `numbers` — [`../../foundations/numbers/README.md`](../../foundations/numbers/README.md) |
| Guía de inicialización / Initialisation guide | [`core/00_Project_Initialization_Guide.md`](../../../../docs/core/00_Project_Initialization_Guide.md) |
| Adaptaciones idiomáticas / Idiomatic adaptations | [`AGENT_Template.md`](../../../../docs/AGENT_Template.md) |
| Validación de la documentación / Documentation validation | [`WORKFLOW.md`](../../../../docs/WORKFLOW.md) |
| Documentación oficial del lenguaje / Language official docs | [Ruby Documentation](https://www.ruby-lang.org/en/documentation/) |
