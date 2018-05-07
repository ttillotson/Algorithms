class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc
  end

  def count
    @store.length 
  end

  def extract
    # @store[0], @store[-1] = @store[-1], @store[0]
    # el = @store.pop
    # self.class.heapify_up(@store, @store.length - 1, @store.length, &@prc)
    # el


    val = @store[0]

    if count > 1
      @store[0] = @store.pop
      self.class.heapify_down(@store, 0, &prc)
    else
      @store.pop
    end

    val
  end

  def peek
    @store[0]
  end

  def push(val)

  end

  public
  def self.child_indices(len, parent_index)
  end

  def self.parent_index(child_index)
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    l_child_idx, r_child_idx = child_indices(len, parent_idx)

    parent_val = array[parent_idx]

    children = []
    children << array[l_child_idx] if l_child_idx
    children << array[r_child_idx] if r_child_idx

    if children.all? { |child| prc.call(parent_val, child) <= 0 }
      return array
    end

    swap_idx = nil

    if children.length == 1
      swap_idx = l_child_idx
    else
      swap_idx = prc.call(children[0], children[1] == -1 ? l_child_idx : r_child_idx)
    end

    array[parent_idx], array[swap_idx] = array[swap_idx], parent_val
    heapify_down(array, swap_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return array if child_idx == 0

    parent_idx = parent_index(child_idx)

    child_val, parent_val = array[child_idx], array[parent_idx]

    if prc.call(child_val, parent_val) >=0
      array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
    end
  end
end


def files(arr)
  heap = BinaryMinHeap.new
  arr.length.times do |idx|
    arr.each do |array|
      heap.push(array[idx]) unless array[idx].nil?
    end
  end

  heap.store.heap_sort!
end