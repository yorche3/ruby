# frozen_string_literal: true

module DataStructuresBasics
  # Lista enlazada simple construida desde cero sobre Node.
  # Nace vacía con `new` (el `init()` de la especificación).
  class LinkedList
    def initialize
      @head  = nil
      @tail  = nil
      @count = 0
    end

    # Esqueleto: valor de la cabeza, o -1 cuando la lista está vacía.
    def head
      -1
    end

    # Esqueleto: número de elementos (0 con la lista recién creada).
    def count
      0
    end
    alias size count

    # Esqueleto: true solo si no hay elementos.
    def empty?
      false
    end

    # Esqueleto: inserta al principio. No devuelve valor.
    def insert_head(value)
      nil
    end

    # Esqueleto: inserta al final. No devuelve valor.
    def insert_tail(value)
      nil
    end

    # Esqueleto: true si borró el valor, false si el valor no estaba.
    def delete(value)
      false
    end
  end
end
