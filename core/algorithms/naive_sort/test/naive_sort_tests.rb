# Casos de prueba de la especificación 05_Naive_Sort.md
#
# Caso nulo incluido: en Ruby un array puede ser `nil`, así que el indicador de
# fallo del contrato es `nil`, distinguible del array vacío (`[]`). No se espera
# ninguna excepción.
#
# Aislamiento: los arrays de Ruby son mutables y los tres algoritmos ordenan
# in-place, así que cada caso ordena una copia del fixture compartido.

require_relative '../src/naive_sort'

STANDARD_INPUT = [5, 2, 9, 1, 5, 6].freeze
STANDARD_OUTPUT = [1, 2, 5, 5, 6, 9].freeze

SORTED_INPUT = [1, 2, 3, 4, 5].freeze
SORTED_OUTPUT = [1, 2, 3, 4, 5].freeze

REVERSE_INPUT = [5, 4, 3, 2, 1].freeze
REVERSE_OUTPUT = [1, 2, 3, 4, 5].freeze

IDENTICAL_INPUT = [7, 7, 7, 7].freeze
IDENTICAL_OUTPUT = [7, 7, 7, 7].freeze

NEGATIVE_INPUT = [3, -1, 4, -5, 0].freeze
NEGATIVE_OUTPUT = [-5, -1, 0, 3, 4].freeze

SINGLE_INPUT = [42].freeze
SINGLE_OUTPUT = [42].freeze

EMPTY_INPUT = [].freeze
EMPTY_OUTPUT = [].freeze

NULL_INPUT = nil
NULL_OUTPUT = nil

# Tabla de casos: descripción, entrada y salida esperada.
CASES = [
  { description: 'an unsorted array', input: STANDARD_INPUT, expected: STANDARD_OUTPUT },
  { description: 'an already sorted array', input: SORTED_INPUT, expected: SORTED_OUTPUT },
  { description: 'a reverse ordered array', input: REVERSE_INPUT, expected: REVERSE_OUTPUT },
  { description: 'an array of identical elements', input: IDENTICAL_INPUT, expected: IDENTICAL_OUTPUT },
  { description: 'an array with negative numbers', input: NEGATIVE_INPUT, expected: NEGATIVE_OUTPUT },
  { description: 'a single element array', input: SINGLE_INPUT, expected: SINGLE_OUTPUT },
  { description: 'an empty array', input: EMPTY_INPUT, expected: EMPTY_OUTPUT },
  { description: 'a null input', input: NULL_INPUT, expected: NULL_OUTPUT }
].freeze

# Helper compartido: recibe el nombre del algoritmo y la función a probar, y
# ejecuta todos los casos con el mensaje descriptivo del contrato.
def assert_sorts_all_cases(algorithm, function)
  CASES.each do |test_case|
    input = test_case[:input]&.dup

    expect(function.call(input)).to eq(test_case[:expected]),
      "#{algorithm} should sort #{test_case[:description]}"
  end
end

RSpec.describe 'naive_sort' do
  describe '.selection_sort' do
    it 'sorts every case of the specification' do
      assert_sorts_all_cases('selection_sort', ->(array) { NaiveSort.selection_sort(array) })
    end
  end

  describe '.bubble_sort' do
    it 'sorts every case of the specification' do
      assert_sorts_all_cases('bubble_sort', ->(array) { NaiveSort.bubble_sort(array) })
    end
  end

  describe '.insertion_sort' do
    it 'sorts every case of the specification' do
      assert_sorts_all_cases('insertion_sort', ->(array) { NaiveSort.insertion_sort(array) })
    end
  end
end
