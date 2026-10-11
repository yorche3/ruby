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
      new_node = Node.new(value)
      new_node.next = @top
      @top = new_node
      @count += 1
    end

    # Esqueleto: desapila, o -1 cuando la pila está vacía.
    def pop
      return -1 if @top.nil?
      value = @top.value
      @top = @top.next
      @count -= 1
      value
    end

    # Esqueleto: mira la cima, o -1 cuando la pila está vacía.
    def peek
      return -1 if @top.nil?
      @top.value
    end

    # Esqueleto: true solo si no hay elementos.
    def empty?
      @count.zero?
    end

    # Esqueleto: número de elementos (0 con la pila recién creada).
    def size
      @count
    end
  end
end
