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
      return true if u_vertex.neighbors.include?(v)

      position = u_vertex.neighbors.index { |neighbor| v < neighbor }
      position ? u_vertex.neighbors.insert(position, v) : u_vertex.neighbors << v
      @edge_count += 1
      true
    end

    def has_edge?(u, v)
      u_vertex = find_vertex(u)
      return false if u_vertex.nil?
      u_vertex.neighbors.include?(v)
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
