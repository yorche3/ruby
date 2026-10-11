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
      return -1 if @head.nil?
      @head.value
    end

    # Esqueleto: número de elementos (0 con la lista recién creada).
    def count
      @count
    end
    alias size count

    # Esqueleto: true solo si no hay elementos.
    def empty?
      @count.zero?
    end

    # Esqueleto: inserta al principio. No devuelve valor.
    def insert_head(value)
      new_node = Node.new(value)
      if @head.nil?
        @head = new_node
        @tail = new_node
      else
        new_node.next = @head
        @head = new_node
      end
      @count += 1
    end

    # Esqueleto: inserta al final. No devuelve valor.
    def insert_tail(value)
      new_node = Node.new(value)
      if @tail.nil?
        @head = new_node
        @tail = new_node
      else
        @tail.next = new_node
        @tail = new_node
      end
      @count += 1
    end

    # Esqueleto: true si borró el valor, false si el valor no estaba.
    def delete(value)
      current = @head
      previous = nil
      while current
        if current.value == value
          if previous
            previous.next = current.next
          else
            @head = current.next
          end
          @tail = previous if current.next.nil?
          @count -= 1
          return true
        end
        previous = current
        current = current.next
      end
      false
    end
  end
end
