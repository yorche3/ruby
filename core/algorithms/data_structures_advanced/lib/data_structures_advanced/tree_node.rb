# frozen_string_literal: true

module DataStructuresAdvanced
  class TreeNode < Node
    attr_accessor :left, :right

    def initialize(value)
      super(value)
      @left = nil
      @right = nil
    end
  end
end
