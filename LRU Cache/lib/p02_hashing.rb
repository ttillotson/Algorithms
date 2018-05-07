class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return self.length.hash if self.empty?
    self.map.with_index { |el, i| ((el.object_id + i) * el.to_s.length).hash }.reduce(:+)
  end
end

class String
  def hash
    mapped = self.chars.map.with_index do |ch, idx| 
      (ch.ord + idx) * (idx + 5)
    end

    mapped.reduce(:+)
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hashed = 0
    self.map do |key, val|
      hashed += (key.object_id + 98) * val.hash
    end
    hashed
  end
end


