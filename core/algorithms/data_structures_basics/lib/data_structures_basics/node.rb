# frozen_string_literal: true

module DataStructuresBasics
  # Celda enlazada compartida por LinkedList, Stack y Queue.
  #
  # Adecuación: `value` no se reasigna después de la construcción; `next` sí.
  class Node
    # Constructor de la celda (el `init(value)` de la especificación).
    def initialize(value)
      @value = value
      @next  = nil
    end

    # Esqueleto: valor de la celda.
    def value
      -1
    end

    # Esqueleto: enlace siguiente. Es el único `nil` del contrato: es un enlace.
    def next
      nil
    end

    # Esqueleto: cambia el enlace siguiente.
    def next=(node)
      nil
    end
  end
end
