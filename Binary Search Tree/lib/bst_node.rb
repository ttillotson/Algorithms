class BSTNode

  attr_accessor :parent, :right, :left
  attr_reader :value

  def initialize(value)
    @value = value
    @right = nil
    @left = nil
    @parent = nil
  end
end
