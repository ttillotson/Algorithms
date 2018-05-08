class Vertex
  attr_accessor :in_edges, :out_edges, :value, :neighbors

  def initialize(value)
    @value = value 
    @in_edges = []
    @out_edges = []
    @neighbors = []
  end

  def inspect
    "Vertex: value: #{@value} in_edges: #{in_edges} out_edges: #{out_edges}"
  end
end

class Edge
  attr_reader :from_vertex, :to_vertex, :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost 
    @from_vertex.out_edges << self
    @to_vertex.in_edges << self
    @from_vertex.neighbors << @to_vertex
    @to_vertex.neighbors << @from_vertex
  end

  def destroy!
    @from_vertex.out_edges.delete(self)
    @to_vertex.in_edges.delete(self)
    @from_vertex, @to_vertex = nil, nil
  end

  def inspect 
    "Edge: from: #{@from_vertex.value} to: #{@to_vertex.value}"
  end
end
