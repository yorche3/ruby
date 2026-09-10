# Ruby

Proyectos en **Ruby**, con scripts simples ejecutados mediante el intérprete `ruby` y proyectos con pruebas unitarias gestionados con **RSpec** y **Bundler**.

---

## 📂 Módulos / Modules

| Módulo | Descripción |
| ------ | ----------- |
| [`core/foundations/`](core/foundations/) | **Fase 0 — Fundamentos**: `helloworld`, `hellouser`, `unit_test/calculator`, `numbers` |

---

## ▶️ Comenzar / Getting Started

```bash
# Hello, World!
cd core/foundations/helloworld
ruby helloworld.rb

# Hello, User!
cd core/foundations/hellouser
ruby hellouser.rb

# Calculator tests
cd core/foundations/unit_test/calculator
bundle install
bundle exec rspec

# Numbers tests
cd core/foundations/numbers
bundle install
bundle exec rspec
```

---

## 📦 Requisitos / Requirements

| Herramienta | Instalación |
| ----------- | ----------- |
| [Ruby](https://www.ruby-lang.org/) 3.0+ | `sudo apt install ruby-full` (Linux) / [Descargar](https://www.ruby-lang.org/en/documentation/installation/) |
| [Bundler](https://bundler.io/) | `gem install bundler` |
| [RSpec](https://rspec.info/) | Declarado por proyecto en cada `Gemfile`; se instala con `bundle install` |
| [RVM](https://rvm.io/) (opcional) | `\curl -sSL https://get.rvm.io | bash -s stable` |

```bash
# Verificar la instalación
ruby -v
bundle -v
```

> **ES:** En este entorno Ruby se gestiona con RVM. En una sesión nueva, carga RVM con `source ~/.rvm/scripts/rvm` antes de usar `ruby` o `bundle`.
> **EN:** Ruby is managed with RVM in this environment. In a new shell, load RVM with `source ~/.rvm/scripts/rvm` before using `ruby` or `bundle`.

---

## 🏗️ Tipos de proyecto / Project Types

### 1. Programa simple (interpretado con `ruby`)

**ES:** Un único archivo `.rb`, sin dependencias externas, ejecutado directamente con Ruby. Es el formato utilizado por `helloworld` y `hellouser`.

**EN:** A single `.rb` file with no external dependencies, run directly with Ruby. This is the format used by `helloworld` and `hellouser`.

```bash
ruby <File>.rb
```

### 2. Proyecto tipo librería con pruebas (Bundler + RSpec)

**ES:** Los proyectos `calculator` y `numbers` separan el código fuente en `src/` y las pruebas en `test/`. Cada proyecto declara RSpec en su propio `Gemfile`, fija las versiones mediante `Gemfile.lock` y configura el descubrimiento con `.rspec`.

**EN:** The `calculator` and `numbers` projects separate source code into `src/` and tests into `test/`. Each project declares RSpec in its own `Gemfile`, locks versions through `Gemfile.lock`, and configures discovery with `.rspec`.

```bash
bundle install
bundle exec rspec
```

---

## 🔁 Decisión de TCO / TCO Decision

Ruby/CRuby no tiene Tail Call Optimization habilitada por defecto. Por eso `numbers` conserva `_acc` como puente educativo, pero prueba solamente `_rec` e `_ite`: **TCO ❌ + iteración ✅ → 2 suites, 10 ejemplos y 22 casos**.

Ruby/CRuby does not enable Tail Call Optimization by default. Therefore, `numbers` keeps `_acc` as an educational bridge but tests only `_rec` and `_ite`: **TCO ❌ + iteration ✅ → 2 suites, 10 examples, and 22 cases**.

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
