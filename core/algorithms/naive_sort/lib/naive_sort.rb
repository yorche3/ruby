# naive_sort — ordenamientos elementales O(n²).
#
# Especificación: 05_Naive_Sort
#
# Contrato: recibe un array de enteros y devuelve el array ordenado de menor a
# mayor (in-place o como copia ordenada), sin invocar bibliotecas de
# ordenamiento del sistema ni estructuras auxiliares complejas. La API son los
# tres métodos de clase de `NaiveSort`: `selection_sort`, `bubble_sort` e
# `insertion_sort` (el mismo patrón de clase con métodos `self.*` que
# `core/foundations/numbers/src/numbers.rb`).
# Si la entrada es `nil` devuelve `nil` como indicador de fallo; si está vacía
# devuelve el mismo array vacío. No lanza excepciones.
#
# Implementación pendiente: la escribe el autor. Esta delegación solo genera el
# esqueleto y las pruebas unitarias.
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

  def self.bubble_sort(arr)
    return nil if arr.nil?
    n = arr.length
    return arr if n < 2
    (0...n-1).each do |i|
      swapped = false
      (0...n-i-1).each do |j|
        if arr[j] > arr[j+1]
          arr[j], arr[j+1] = arr[j+1], arr[j]
          swapped = true
        end
      end
      break unless swapped
    end
    arr
  end

  def self.insertion_sort(arr)
    return nil if arr.nil?
    n = arr.length
    return arr if n < 2
    (1...n).each do |i|
      key = arr[i]
      j = i - 1
      while j >= 0 && arr[j] > key
        arr[j + 1] = arr[j]
        j -= 1
      end
      arr[j + 1] = key
    end
    arr
  end
end
