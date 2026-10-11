# frozen_string_literal: true

module DataStructuresBasics
  # Pila LIFO construida desde cero sobre Node.
  # Nace vacía con `new` (el `init()` de la especificación).
  class Stack
    def initialize
      @top   = nil
      @count = 0
    end

    # Esqueleto: apila. No devuelve valor.
    def push(value)
      nil
    end

    # Esqueleto: desapila, o -1 cuando la pila está vacía.
    def pop
      -1
    end

    # Esqueleto: mira la cima, o -1 cuando la pila está vacía.
    def peek
      -1
    end

    # Esqueleto: true solo si no hay elementos.
    def empty?
      false
    end

    # Esqueleto: número de elementos (0 con la pila recién creada).
    def size
      0
    end
  end
end
