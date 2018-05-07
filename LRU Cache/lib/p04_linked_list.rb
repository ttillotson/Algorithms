class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    previous_node = self.prev 
    next_node = self.next 
    previous_node.next = self.next 
    next_node.prev = self.prev
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new('sentinel', 'head')
    @tail = Node.new('sentinel', 'tail')
    @head.next = @tail
    @tail.prev = @head
    @count = 0
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current_node = @head
    until current_node.key == key || current_node == @tail
      current_node = current_node.next
    end
    current_node.key == key ? current_node.val : nil
  end

  def grab(key)
    current_node = @head
    until current_node.key == key || current_node == @tail
      current_node = current_node.next
    end
    current_node.key == key ? current_node : nil
  end

  def include?(key)
    current_node = @head
    until current_node.key == key || current_node == @tail
      current_node = current_node.next
    end
    current_node.key == key ? true : false
  end

  def append(key, val)
    node = Node.new(key, val)
    # Set the node's neighbors at the end of the list
    node.prev = @tail.prev
    node.next = @tail
    # Grab previous last node and tell it that the new node is now its neighbor
    neighbor_node = last
    neighbor_node.next = node
    # Set tail's prev to new node
    @tail.prev = node
    @count += 1
    node
  end

  def update(key, val)
    node = self.grab(key)
    node.val = val if node
  end

  def remove(key)
    node = self.grab(key)
    node.remove
    @count -= 1
  end

  def each(&prc)
    current_node = @head.next
    until current_node == @tail 
      prc.call(current_node)
      current_node = current_node.next
    end

    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
