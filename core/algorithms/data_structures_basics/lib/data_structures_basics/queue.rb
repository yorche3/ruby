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
      new_node = Node.new(value)
      if @rear.nil?
        @front = new_node
        @rear = new_node
      else
        @rear.next = new_node
        @rear = new_node
      end
      @count += 1
    end

    # Esqueleto: desencola, o -1 cuando la cola está vacía.
    def dequeue
      return -1 if @front.nil?
      value = @front.value
      @front = @front.next
      @rear = nil if @front.nil?
      @count -= 1
      value
    end

    # Esqueleto: mira el frente, o -1 cuando la cola está vacía.
    def peek
      return -1 if @front.nil?
      @front.value
    end

    # Esqueleto: true solo si no hay elementos.
    def empty?
      @count.zero?
    end

    # Esqueleto: número de elementos (0 con la cola recién creada).
    def size
      @count
    end
  end
end
