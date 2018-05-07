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
    node = find(value)
    return nil unless node 

    # If desired node has 2 children
    if node.left && node.right 
      # Find largest node in left tree
      rep_node = maximum(node.left) 

      # Transition Replacement Out (rep_node)
      # Assign pointers to former parent/left-child
      rep_node.parent.right = rep_node.left
      rep_node.left.parent = rep_node.parent

      # Transition Replacement Into Deleted's Spot
      # Assign Node's children to Replacement
      rep_node.left = node.left 
      rep_node.left.parent = rep_node
      rep_node.right = node.right
      rep_node.right.parent = rep_node

      # Tell the parent it has a new child
      node.parent.left = rep_node if node.parent.left = node
      node.parent.right = rep_node if node.parent.right = node
    elsif node.left || node.right
      rep_node = node.left
      rep_node ||= node.right 

      rep_node.left = node.left 
      rep_node.left.parent = rep_node if rep_node.left
      rep_node.right = node.right
      rep_node.right.parent = rep_node if rep_node.right

      # Tell the parent it has a new child
      node.parent.left = rep_node if node.parent.left = node
      node.parent.right = rep_node if node.parent.right = node
    else # No Children
      @root = nil unless node.parent

      if node.parent
        node.parent.left = nil if node.parent.left = node
        node.parent.right = nil if node.parent.right = node
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return maximum(tree_node.right) if tree_node.right 
    tree_node
  end

  def depth(tree_node = @root)
  end 

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:
  def reassign_children(old_node, new_node=nil)

  end

  def reassign_parent(old_node, new_node=nil)
    node.parent.left = new_node if node.parent.left = node
    node.parent.right = new_node if node.parent.right = node
  end
end
