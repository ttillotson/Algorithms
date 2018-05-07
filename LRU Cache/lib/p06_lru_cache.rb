require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc # gives you the value of the node
  end

  def count
    @map.count
  end

  def get(key) # gives value of key
    node = @map[key] # O(1) check for node
    if node
      update_node!(node)
      node.val
    else 
      eject! if @store.count >= @max
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    val = @prc.call(key)
    node = @store.append(key, val)
    @map[key] = node
    val
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    @store.remove(node.key)
    @store.append(node.key, node.val)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    node = @store.first
    @store.remove(node.key)
    @map.delete(node.key)
  end
end
