# 🚀 Fundamentos / Foundations — Ruby

Implementación de los ejercicios de la sección [Fundamentos / Foundations](https://yorche3.github.io/programming_languages/core/foundations/) del repositorio principal en **Ruby**.

---

## 📖 Descripción / Description

**ES:** Esta sección reúne los conceptos esenciales para empezar a trabajar con **Ruby**. Cubre desde los programas más básicos (`Hello, World!` y `Hello, User!`) hasta una calculadora con pruebas unitarias y algoritmos numéricos implementados en tres enfoques progresivos: recursivo directo, recursivo con acumulador e iterativo.

**EN:** This section brings together the essential concepts for getting started with **Ruby**. It covers everything from the basic (`Hello, World!` and `Hello, User!`) programs to a unit-tested calculator and numerical algorithms implemented through three progressive approaches: direct recursion, accumulator recursion, and iteration.

---

## 📁 Estructura / Structure

```text
ruby/
└── core/
    └── foundations/
        ├── README.md              # Este archivo / This file
        ├── helloworld/            # 01_Hello_World — Primer programa
        │   ├── helloworld.rb
        │   └── README.md
        ├── hellouser/             # 02_Hello_User — Entrada y salida
        │   ├── hellouser.rb
        │   └── README.md
        ├── unit_test/
        │   └── calculator/        # 03_Unit_Test_Calculator — Pruebas unitarias
        │       ├── src/
        │       │   └── calculator.rb
        │       ├── test/
        │       │   └── calculator_test.rb
        │       ├── Gemfile
        │       ├── Gemfile.lock
        │       ├── .rspec
        │       ├── .gitignore
        │       └── README.md
        └── numbers/               # 04_Numbers — Algoritmos numéricos
            ├── src/
            │   └── numbers.rb
            ├── test/
            │   ├── recursive_tests.rb
            │   └── iterative_tests.rb
            ├── Gemfile
            ├── Gemfile.lock
            ├── .rspec
            ├── .gitignore
            └── README.md
```

---

## 🔢 Progresión / Progression

| Especificación | Proyecto | Conceptos | Tests | Dependencias |
| -------------- | -------- | --------- | :---: | ------------ |
| [`01_Hello_World`](https://yorche3.github.io/programming_languages/core/foundations/01_Hello_World/) | [`helloworld/`](helloworld/) | `puts`, ejecución interpretada, `ruby` | — | Solo Ruby |
| [`02_Hello_User`](https://yorche3.github.io/programming_languages/core/foundations/02_Hello_User/) | [`hellouser/`](hellouser/) | `gets`, `chomp!`, variables y concatenación | — | Solo Ruby |
| [`03_Unit_Test_Calculator`](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) | [`unit_test/calculator/`](unit_test/calculator/) | Clases, métodos de clase, RSpec y Bundler | 5 | `rspec` |
| [`04_Numbers`](https://yorche3.github.io/programming_languages/core/foundations/04_Numbers/) | [`numbers/`](numbers/) | Recursión, acumuladores, enumerables, bucles y TCO | 10 (22 casos) | `rspec` |

---

## 🛠️ Enfoque general / General Approach

**ES:** Los proyectos de esta sección siguen una progresión gradual:

1. **Hello World** y **Hello User**: scripts Ruby independientes ejecutados directamente con `ruby`. No requieren un `Gemfile` ni dependencias externas.
2. **Calculator**: primer proyecto con estructura tipo librería (`src/` + `test/`). Usa una clase `Calculator`, métodos de clase (`self.*`) y RSpec gestionado con Bundler.
3. **Numbers**: módulo Ruby con 15 métodos, organizado en tres enfoques. Ruby/CRuby no tiene Tail Call Optimization habilitada por defecto, por lo que `_acc` se conserva como puente didáctico sin suite propia. Se prueban `_rec` e `_ite`: **TCO ❌ + iteración ✅ → 2 suites, 10 ejemplos y 22 casos**.

**EN:** The projects in this section follow a gradual progression:

1. **Hello World** and **Hello User**: standalone Ruby scripts run directly with `ruby`. They require no `Gemfile` or external dependencies.
2. **Calculator**: the first library-style project (`src/` + `test/`). It uses a `Calculator` class, class methods (`self.*`), and RSpec managed with Bundler.
3. **Numbers**: a Ruby module with 15 methods organized into three approaches. Ruby/CRuby does not enable Tail Call Optimization by default, so `_acc` is kept as an educational bridge without its own suite. `_rec` and `_ite` are tested: **TCO ❌ + iteration ✅ → 2 suites, 10 examples, and 22 cases**.

---

## 📦 Requisitos / Requirements

| Herramienta | Uso | Verificación |
| ----------- | --- | ------------ |
| [Ruby](https://www.ruby-lang.org/) 3.0+ | Ejecutar scripts y código de librería | `ruby -v` |
| [Bundler](https://bundler.io/) | Resolver las dependencias de los proyectos con tests | `bundle -v` |
| [RSpec](https://rspec.info/) | Framework de pruebas de calculator y numbers | `bundle exec rspec --version` |

Ruby se gestiona mediante **RVM** en este entorno. Para activar el entorno de una sesión nueva:

```bash
source ~/.rvm/scripts/rvm
ruby -v
bundle -v
```

---

## 🚀 Ejecución rápida / Quick Start

### Hello World

```bash
cd ruby/core/foundations/helloworld
ruby helloworld.rb
```

### Hello User

```bash
cd ruby/core/foundations/hellouser
ruby hellouser.rb
```

También admite entrada redirigida:

```bash
printf 'Ada\n' | ruby hellouser.rb
```

### Calculator (RSpec)

```bash
cd ruby/core/foundations/unit_test/calculator
bundle install
bundle exec rspec
```

Salida resumida esperada:

```text
5 examples, 0 failures
```

### Numbers (RSpec)

```bash
cd ruby/core/foundations/numbers
bundle install
bundle exec rspec
```

Salida resumida esperada:

```text
10 examples, 0 failures
```

---

## 🧪 Convenciones de pruebas / Testing Conventions

**ES:** Los proyectos con tests usan RSpec mediante un `Gemfile` local y `bundle exec`, para que las versiones fijadas en cada `Gemfile.lock` sean las utilizadas por el runner. Las pruebas están separadas por enfoque en `numbers/` y agrupan los casos por función mediante bloques `describe` e `it`.

**EN:** Projects with tests use RSpec through a local `Gemfile` and `bundle exec`, ensuring that each project's locked versions in `Gemfile.lock` are used by the runner. Tests are separated by approach in `numbers/` and group cases by function through `describe` and `it` blocks.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
