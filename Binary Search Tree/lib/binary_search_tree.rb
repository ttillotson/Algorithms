require_relative 'bst_node'
# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_reader :root
  def initialize
    @root = nil
  end

  def insert(value, parent = @root)
    unless @root 
      @root = BSTNode.new(value)
      @root.parent = nil
      return
    end

    if value <= parent.value 
      if parent.left
        insert(value, parent.left) 
      else
        node = BSTNode.new(value)
        parent.left = node
        node.parent = parent
      end
    end

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
