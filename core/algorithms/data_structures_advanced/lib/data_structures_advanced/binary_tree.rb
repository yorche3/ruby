# frozen_string_literal: true

module DataStructuresAdvanced
  class BinaryTree
    def initialize
      @root = nil
      @count = 0
    end

    def insert(value)
      if @root.nil?
        @root = TreeNode.new(value)
        @count += 1
        return true
      end
      current = @root
      loop do
        if value == current.value
          return true
        elsif value < current.value
          if current.left.nil?
            current.left = TreeNode.new(value)
            @count += 1
            return true
          end
          current = current.left
        else
          if current.right.nil?
            current.right = TreeNode.new(value)
            @count += 1
            return true
          end
          current = current.right
        end
      end
    end

    def contains?(value)
      current = @root
      while current
        return true if value == current.value
        current = value < current.value ? current.left : current.right
      end
      false
    end

    def empty?
      @root.nil?
    end

    def size
      @count
    end
  end
end
