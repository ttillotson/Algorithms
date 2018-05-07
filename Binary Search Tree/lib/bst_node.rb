class BSTNode

  attr_accessor :parent, :right, :left
  attr_reader :value

  def initialize(value)
    @value = value
    @right = nil
    @left = nil
    @parent = nil
  end

  def inspect
    "Node: value=#{@value} parent=#{@parent.value} right=#{@right.value} left=#{@left.value}"
  end
end
