# 🚀 Algoritmos Puros / Algorithms Pure — Ruby

Implementaciones de la [Fase 1 — Algoritmos Puros](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-) en **Ruby**: ordenamientos elementales, estructuras de datos propias, ordenamientos óptimos y distribuidos, y búsqueda.

Los módulos de esta fase trabajan sobre **arrays mutables**, que se ordenan *in-place* y se devuelven. Un array de Ruby puede ser `nil`, así que el caso nulo se representa con `nil` como indicador de fallo (no se lanzan excepciones) y el array vacío es `[]`.

---

## 📂 Módulos / Modules

| Módulo | Especificación | Enfoque | Tests | Estado |
|--------|---------------|---------|:-----:|:------:|
| [`naive_sort/`](naive_sort/) | [05_Naive_Sort](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/) | `bundle exec rspec` (RSpec + Bundler) | 24 | ✅ |
| [`data_structures_basics/`](data_structures_basics/) | [06_Data_Structures_Basics](https://yorche3.github.io/programming_languages/core/algorithms/06_Data_Structures_Basics/) | `bundle exec rspec` (RSpec + Bundler) | 4 | ✅ |

---

## 📁 Estructura / Structure

```text
algorithms/
├── naive_sort/                  # 05_Naive_Sort
│   ├── .gitignore               # Ignora .bundle/, vendor/bundle/ y Gemfile.lock
│   ├── .rspec                   # --default-path test, --pattern "**/*_tests.rb"
│   ├── Gemfile                  # Gema rspec
│   ├── src/
│   │   └── naive_sort.rb        # Módulo NaiveSort: 3 métodos
│   ├── test/
│   │   └── naive_sort_tests.rb  # 3 ejemplos × 8 casos
│   └── README.md
└── data_structures_basics/      # 06_Data_Structures_Basics
    ├── .rspec                   # --require spec_helper
    ├── Gemfile                  # Configuración Bundler referenciando gemspec
    ├── Gemfile.lock             # Versiones fijadas de gemas
    ├── Rakefile                 # Tareas Rake (:spec)
    ├── data_structures_basics.gemspec # Metadatos de la gema
    ├── lib/
    │   ├── data_structures_basics.rb # Punto de entrada principal
    │   └── data_structures_basics/
    │       ├── node.rb          # Celda enlazada compartida
    │       ├── linked_list.rb   # Lista simplemente enlazada
    │       ├── stack.rb         # Pila LIFO independiente
    │       ├── queue.rb         # Cola FIFO independiente
    │       └── version.rb       # Versión del módulo
    ├── spec/
    │   ├── spec_helper.rb       # Configuración RSpec
    │   ├── node_spec.rb         # 1 ejemplo
    │   ├── linked_list_spec.rb  # 1 ejemplo
    │   ├── stack_spec.rb        # 1 ejemplo
    │   └── queue_spec.rb        # 1 ejemplo
    ├── src/
    │   └── data_structures_basics.rb # Puente de compatibilidad
    └── README.md
```

---

## 🛠️ Patrón común / Common Pattern

| Característica | Descripción |
|---------------|-------------|
| **Runtime** | Ruby 3.0+ (en este entorno, 3.4.3 con RVM); intérprete directo de los `.rb` |
| **CLI** | `bundle exec rspec`, ejecutado desde la raíz del proyecto |
| **Andamiaje** | ✅ Estructura manual (`mkdir -p src test` + `bundle init`) o estructura de gema con `.gemspec` |
| **Framework de tests** | RSpec declarado en el `Gemfile` (`gem 'rspec', '~> 3.13'`), instalado con `bundle install` |
| **Runner** | RSpec descubre `test/**/*_tests.rb` o `spec/**/*_spec.rb`; no hay `run_tests.rb` |
| **Separación** | `src/` (módulo) ↔ `test/` (suites), o `lib/` ↔ `spec/` con puente en `src/` |
| **Módulo fuente** | Clases/módulos idiomáticos bajo namespace `DataStructuresBasics` o `NaiveSort` |
| **API** | Métodos orientados a objetos o funciones de módulo, según especificación |
| **Naming** | `snake_case` idéntico al de la especificación, con convenciones de métodos Ruby (`empty?`) |
| **Mutabilidad** | Arrays/estructuras mutables gestionadas *in-place* |
| **Nulabilidad** | `nil` como indicador de nodo ausente; `-1` como valor de error para operaciones enteras |
| **Mensajes de aserción** | RSpec `expect(...).to eq(...)` o aserciones contextuales de comportamiento |
| **Verificación estática** | `ruby -w -c <archivo>` → `Syntax OK` sin warnings; los módulos no declaran linter |
| **Artefactos** | `.bundle/`, `vendor/bundle/` y `Gemfile.lock` — ignorados por `.gitignore` |
| **Particularidades** | Enlace manual de celdas `Node` sin delegar en colecciones estándar de Ruby |

---

## 🚀 Compilación rápida / Quick Build

```bash
# Naive Sort Tests
cd naive_sort
bundle install
bundle exec rspec

# Data Structures Basics Tests
cd ../data_structures_basics
bundle install
bundle exec rspec
```

---

## ▶️ Siguiente / Next

👉 Continúa con los módulos pendientes de esta fase en el [Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/).

👉 Continue with the pending modules of this phase in the [Roadmap](https://yorche3.github.io/programming_languages/ROADMAP/).

---

*[← Volver a Core](../README.md)*

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
