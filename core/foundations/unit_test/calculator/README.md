# Calculator — Ruby

Implementación de la especificación [03_Unit_Test_Calculator](https://yorche3.github.io/programming_languages/core/foundations/03_Unit_Test_Calculator/) en **Ruby**, utilizando **RSpec** como framework de pruebas unitarias y **Bundler** para la gestión de dependencias mediante `Gemfile`.

Operaciones aritméticas básicas (`addition`, `subtraction`, `multiplication`, `division`, `modulus`) con implementaciones intuitivas y educativas, validadas mediante pruebas unitarias.

---

## 📂 Archivos y estructura / Files & Structure

| Archivo | Propósito |
|---------|-----------|
| [`src/calculator.rb`](src/calculator.rb) | Clase `Calculator` con métodos de clase para las 5 operaciones aritméticas. |
| [`test/calculator_test.rb`](test/calculator_test.rb) | Suite de pruebas unitarias con RSpec (5 ejemplos verificando las operaciones). |
| [`Gemfile`](Gemfile) | Declaración de dependencias del proyecto (gema `rspec`). |
| [`Gemfile.lock`](Gemfile.lock) | Registro de versiones exactas resueltas por Bundler. |
| [`.rspec`](.rspec) | Configuración de RSpec (`--format documentation`, ruta por defecto `test/`, patrón `*_test.rb`). |
| [`.gitignore`](.gitignore) | Ignora artefactos locales de Bundler (`.bundle/`, `vendor/bundle/`). |

**Estructura de directorios esperada:**

```text
calculator/
├── .gitignore               # Ignora .bundle/ y vendor/bundle/
├── .rspec                   # Configuración del ejecutor RSpec
├── Gemfile                  # Dependencias Bundler
├── Gemfile.lock             # Versiones fijadas de gemas
├── src/
│   └── calculator.rb        # Clase Calculator (5 operaciones)
├── test/
│   └── calculator_test.rb   # Suite RSpec (5 pruebas)
└── README.md                # Este archivo
```

---

## 🛠️ Enfoque y construcción / Approach & Build

**ES:** Este proyecto sigue la estructura recomendada con separación `src/` + `test/`:

1. **`Calculator` como clase con métodos de clase (`self.*`)**: Permite invocaciones directas como `Calculator.addition(a, b)` sin necesidad de instanciar objetos.
2. **Implementaciones educativas**: Se respetan las restricciones pedagógicas de la especificación:
   - `multiplication` utiliza suma acumulativa repetida (`b.times`), sin usar el operador `*`.
   - `division` utiliza resta repetida (`while a >= b`), sin usar el operador `/`.
   - `modulus` reutiliza `division`, `multiplication` y `subtraction`, sin usar el operador `%`.
3. **Gestión de dependencias con Bundler**: Se define `Gemfile` con la gema `rspec`.
4. **Configuración de RSpec**: El archivo `.rspec` ajusta `--default-path test` y `--pattern "**/*_test.rb"` para ejecutar automáticamente los archivos dentro de `test/` manteniendo la nomenclatura estándar del roadmap.

**EN:** This project follows the recommended layout separating `src/` + `test/`:

1. **`Calculator` as a class with class methods (`self.*`)**: Allows direct invocations like `Calculator.addition(a, b)` without instantiating objects.
2. **Educational implementations**: Strictly follows the pedagogical constraints from the specification:
   - `multiplication` uses repeated cumulative addition (`b.times`), without the `*` operator.
   - `division` uses repeated subtraction (`while a >= b`), without the `/` operator.
   - `modulus` reuses `division`, `multiplication`, and `subtraction`, without the `%` operator.
3. **Dependency management with Bundler**: Declares `Gemfile` with the `rspec` gem.
4. **RSpec configuration**: The `.rspec` file sets `--default-path test` and `--pattern "**/*_test.rb"` to run test files in `test/` while preserving the roadmap's standard naming.

---

## 📄 Archivos de configuración clave / Key Configuration Files

### `src/calculator.rb` — Implementación educativa

```ruby
class Calculator
  def self.addition(a, b)
    a + b
  end

  def self.subtraction(a, b)
    a - b
  end

  def self.multiplication(a, b)
    result = 0
    b.times do
      result = addition(result, a)
    end
    result
  end

  def self.division(a, b)
    quotient = 0
    while a >= b
      a = subtraction(a, b)
      quotient = addition(quotient, 1)
    end
    quotient
  end

  def self.modulus(a, b)
    q = division(a, b)
    p = multiplication(q, b)
    subtraction(a, p)
  end
end
```

| Método | Estrategia educativa |
|--------|----------------------|
| `addition(a, b)` | Suma directa (`a + b`). |
| `subtraction(a, b)` | Resta directa (`a - b`). |
| `multiplication(a, b)` | Suma acumulativa repetitiva (`b.times`) invocando `addition`. |
| `division(a, b)` | Resta acumulativa repetitiva (`while a >= b`) contando con `addition`. |
| `modulus(a, b)` | Calcula el residuo combinando `division`, `multiplication` y `subtraction`. |

### `test/calculator_test.rb` — Suite RSpec

```ruby
require_relative '../src/calculator'

RSpec.describe Calculator do
  describe '.addition' do
    it 'returns the sum of two numbers' do
      expect(Calculator.addition(2, 3)).to eq(5)
    end
  end

  describe '.subtraction' do
    it 'returns the difference of two numbers' do
      expect(Calculator.subtraction(5, 2)).to eq(3)
    end
  end

  describe '.multiplication' do
    it 'returns the product using repeated addition' do
      expect(Calculator.multiplication(3, 4)).to eq(12)
    end
  end

  describe '.division' do
    it 'returns the quotient using repeated subtraction' do
      expect(Calculator.division(10, 3)).to eq(3)
    end
  end

  describe '.modulus' do
    it 'returns the remainder using division and multiplication' do
      expect(Calculator.modulus(10, 3)).to eq(1)
    end
  end
end
```

### `Gemfile` — Dependencias de pruebas

```ruby
source 'https://rubygems.org'

gem 'rspec', '~> 3.13'
```

### `.rspec` — Opciones de ejecución

```text
--format documentation
--default-path test
--pattern "**/*_test.rb"
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
cd ruby/core/foundations/unit_test/calculator
bundle install
```

### Ejecutar las pruebas / Run tests

```bash
cd ruby/core/foundations/unit_test/calculator
bundle exec rspec
```

> **ES:** También es posible ejecutar directamente `rspec` o pasar la ruta del archivo: `bundle exec rspec test/calculator_test.rb`.  
> **EN:** You can also run `rspec` directly or specify the file path: `bundle exec rspec test/calculator_test.rb`.

### Salida esperada / Expected output

```text
Calculator
  .addition
    returns the sum of two numbers
  .subtraction
    returns the difference of two numbers
  .multiplication
    returns the product using repeated addition
  .division
    returns the quotient using repeated subtraction
  .modulus
    returns the remainder using division and multiplication

Finished in 0.00144 seconds (files took 0.04662 seconds to load)
5 examples, 0 failures
```

> **ES:** `5 examples, 0 failures` confirma que las 5 operaciones fueron validadas satisfactoriamente (equivalente a `Tests run: 5, Passed: 5, Failed: 0`).  
> **EN:** `5 examples, 0 failures` confirms that all 5 operations were successfully validated (equivalent to `Tests run: 5, Passed: 5, Failed: 0`).

---

## 📝 Notas de implementación / Implementation Notes

- **ES:** En Ruby, los métodos de clase definidos con `def self.metodo` actúan como métodos estáticos/de clase sin requerir instanciar `Calculator.new`.
- **EN:** In Ruby, class methods defined via `def self.method` act as static/class methods without requiring instantiation through `Calculator.new`.
- **ES:** RSpec incluye su propio runner y reporter en consola, por lo que no es necesario crear un script separado `run_tests.rb`.
- **EN:** RSpec includes its own test runner and console reporter, making a separate `run_tests.rb` script unnecessary.
- **ES:** La división por cero no se maneja en este ejercicio básico (conforme al pseudocódigo de la especificación).
- **EN:** Division by zero is not handled in this basic exercise (in accordance with the specification's pseudocode).

---

## 🌐 Otras implementaciones / Other implementations

Este proyecto también está implementado en otros lenguajes. Explora el [repositorio principal](https://github.com/yorche3/programming_languages) para ver todas las versiones.

---

*🌐 [github.com/yorche3/programming_languages](https://github.com/yorche3/programming_languages) · [GitHub Pages](https://yorche3.github.io/programming_languages/)*
