# frozen_string_literal: true

module DataStructuresAdvanced
  class GraphNode < Node
    attr_reader :neighbors
    attr_accessor :next_vertex

    def initialize(label)
      super(label)
      @neighbors = []
      @next_vertex = nil
    end
  end
end
