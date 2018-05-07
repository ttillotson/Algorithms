require 'byebug'
require_relative 'bst_node'
# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_reader :root
  def initialize
    @root = nil
  end

  def insert(value, parent = @root)
    # First Insert is assigned to Root
    unless @root 
      @root = BSTNode.new(value)
      @root.parent = nil
      return
    end

    # Logic for a value smaller than the parent
    if value <= parent.value 
      if parent.left
        insert(value, parent.left) 
      else
        node = BSTNode.new(value)
        parent.left = node
        node.parent = parent
      end
    end

    # Logic for a value larger than the parent
    if value > parent.value 
      if parent.right
        insert(value, parent.right) 
      else
        node = BSTNode.new(value)
        parent.right = node
        node.parent = parent
      end
    end
  end

  def find(value, tree_node = @root)
    return tree_node if value == tree_node.value
    # Base Cases
    return nil if value < tree_node.value && !tree_node.left
    return nil if value > tree_node.value && !tree_node.right
    # Recursive Step
    return find(value, tree_node.left) if value < tree_node.value
    return find(value, tree_node.right) if value > tree_node.value

  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:

end
