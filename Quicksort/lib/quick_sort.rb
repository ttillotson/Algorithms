require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return if array.length <= 1
    pivot = array[0]
    left = []
    right = []
    array[1..-1].each do |n|
      pivot >= n ? left << n : right << n 
    end
    sorted_left = self.class.sort1(left)
    sorted_right = self.class.sort1(right)
    sorted_left + [pivot] + sorted_right
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1 # Base Case

    p_idx = partition(array, start, length, &prc)
    left_length = p_idx - start
    right_length = length - left_length - 1
    sort2!(array, start, left_length, &prc)
    sort2!(array, p_idx + 1, right_length, &prc)

  end

  def self.partition(array, start, length, &prc)
    return array if length <= 1 # Base Case
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    # Establish Random Pivot
    # random_idx = rand(length)
    # pivot = array[random_idx]

    # Move Pivot Element to front
    # array[start], array[random_idx] = array[random_idx], array[start]
    
    # Set Barrier
    barrier_idx = start + 1
    # Iterate through the selected range
    ((start + 1)...(start + length)).each do |idx|  
      # Boolean for barrier increment
      if prc.call(array[start], array[idx]) >= 0  
        array[barrier_idx], array[idx] = array[idx], array[barrier_idx] 
        barrier_idx += 1
      end
    end
    array[start], array[barrier_idx - 1] = array[barrier_idx - 1], array[start]
    barrier_idx - 1
  end
end
