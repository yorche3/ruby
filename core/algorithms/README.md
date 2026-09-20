# 🚀 Algoritmos Puros / Algorithms Pure — Ruby

Implementaciones de la [Fase 1 — Algoritmos Puros](https://yorche3.github.io/programming_languages/ROADMAP/#fase-1--algoritmos-puros--algorithms-pure-) en **Ruby**: ordenamientos elementales, estructuras de datos propias, ordenamientos óptimos y distribuidos, y búsqueda.

Los módulos de esta fase trabajan sobre **arrays mutables**, que se ordenan *in-place* y se devuelven. Un array de Ruby puede ser `nil`, así que el caso nulo se representa con `nil` como indicador de fallo (no se lanzan excepciones) y el array vacío es `[]`.

---

## 📂 Módulos / Modules

| Módulo | Especificación | Enfoque | Tests | Estado |
|--------|---------------|---------|:-----:|:------:|
| [`naive_sort/`](naive_sort/) | [05_Naive_Sort](https://yorche3.github.io/programming_languages/core/algorithms/05_Naive_Sort/) | `bundle exec rspec` (RSpec + Bundler) | 24 | ✅ |

---

## 📁 Estructura / Structure

```text
algorithms/
└── naive_sort/                  # 05_Naive_Sort
    ├── .gitignore               # Ignora .bundle/, vendor/bundle/ y Gemfile.lock
    ├── .rspec                   # --default-path test, --pattern "**/*_tests.rb"
    ├── Gemfile                  # Gema rspec
    ├── src/
    │   └── naive_sort.rb        # Módulo NaiveSort: 3 métodos
    ├── test/
    │   └── naive_sort_tests.rb  # 3 ejemplos × 8 casos
    └── README.md
```

---

## 🛠️ Patrón común / Common Pattern

| Característica | Descripción |
|---------------|-------------|
| **Runtime** | Ruby 3.0+ (en este entorno, 3.4.3 con RVM); intérprete directo de los `.rb` |
| **CLI** | `bundle exec rspec`, ejecutado desde la raíz del proyecto |
| **Andamiaje** | ✅ Estructura manual (`mkdir -p src test` + `bundle init`), la que ya usan [`foundations/numbers/`](../foundations/numbers/) y `foundations/unit_test/calculator/` |
| **Framework de tests** | RSpec declarado en el `Gemfile` (`gem 'rspec', '~> 3.13'`), instalado con `bundle install` |
| **Runner** | RSpec descubre `test/**/*_tests.rb` por el patrón de `.rspec`; no hay `run_tests.rb` |
| **Separación** | `src/` (módulo) ↔ `test/` (suites) |
| **Módulo fuente** | Un módulo con métodos de módulo (`module NaiveSort` + `def self.*`), como `Numbers` en `numbers/` |
| **API** | Una función por algoritmo, con el array recibido y devuelto |
| **Naming** | `snake_case` idéntico al de la especificación (`selection_sort`), que además es la convención de Ruby |
| **Mutabilidad** | Los arrays son mutables y los tres algoritmos ordenan *in-place*; la suite ordena una copia (`dup`) por caso |
| **Nulabilidad** | `nil` como indicador de fallo (no se lanzan excepciones); el array vacío es `[]` |
| **Mensajes de aserción** | `expect(...).to eq(...), "mensaje"` con el mensaje del contrato (`selection_sort should sort an unsorted array`) |
| **Verificación estática** | `ruby -w -c <archivo>` → `Syntax OK` sin warnings; el módulo no declara linter |
| **Artefactos** | `.bundle/`, `vendor/bundle/` y `Gemfile.lock` — ignorados por el `.gitignore` del módulo |
| **Particularidades** | `&&` sí cortocircuita (la guarda `j >= 0` protege `arr[j]`); rangos exclusivos `(0...n-1)` para los `for` del pseudocódigo; asignación paralela para intercambiar |

---

## 🚀 Compilación rápida / Quick Build

```bash
# Naive Sort Tests
cd naive_sort
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
