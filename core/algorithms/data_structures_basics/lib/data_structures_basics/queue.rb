# frozen_string_literal: true

module DataStructuresBasics
  # Cola FIFO construida desde cero sobre Node.
  # Nace vacía con `new` (el `init()` de la especificación).
  class Queue
    def initialize
      @front = nil
      @rear  = nil
      @count = 0
    end

    # Esqueleto: encola. No devuelve valor.
    def enqueue(value)
      nil
    end

    # Esqueleto: desencola, o -1 cuando la cola está vacía.
    def dequeue
      -1
    end

    # Esqueleto: mira el frente, o -1 cuando la cola está vacía.
    def peek
      -1
    end

    # Esqueleto: true solo si no hay elementos.
    def empty?
      false
    end

    # Esqueleto: número de elementos (0 con la cola recién creada).
    def size
      0
    end
  end
end
