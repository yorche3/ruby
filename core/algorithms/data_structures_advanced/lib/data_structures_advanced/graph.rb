# frozen_string_literal: true

module DataStructuresAdvanced
  class Graph
    def initialize
      @vertices = nil
      @vertex_count = 0
      @edge_count = 0
    end

    def add_vertex(label)
      return true unless find_vertex(label).nil?

      new_vertex = GraphNode.new(label)
      new_vertex.next_vertex = @vertices
      @vertices = new_vertex
      @vertex_count += 1
      true
    end

    def add_edge(u, v)
      u_vertex = find_vertex(u)
      return false if u_vertex.nil?
      return false if find_vertex(v).nil?
      return true if has_neighbor?(u_vertex.neighbors, v)

      position = u_vertex.neighbors.index { |neighbor| v < neighbor }
      position ? u_vertex.neighbors.insert(position, v) : u_vertex.neighbors << v
      @edge_count += 1
      true
    end

    def has_edge?(u, v)
      u_vertex = find_vertex(u)
      return false if u_vertex.nil?

      has_neighbor?(u_vertex.neighbors, v)
    end

    # Manual lookup: la adyacencia se recorre elemento a elemento.
    def has_neighbor?(neighbors, label)
      index = 0
      while index < neighbors.length
        return true if neighbors[index] == label

        index += 1
      end
      false
    end

    def neighbors(u)
      u_vertex = find_vertex(u)
      return nil if u_vertex.nil?

      u_vertex.neighbors.dup
    end

    def empty?
      @vertex_count.zero?
    end

    def vertex_count
      @vertex_count
    end

    def edge_count
      @edge_count
    end

    private

    def find_vertex(label)
      current = @vertices
      while current
        return current if current.value == label
        current = current.next_vertex
      end
      nil
    end
  end
end
