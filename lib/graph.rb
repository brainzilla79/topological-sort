class Vertex
  attr_accessor :value, :in_edges, :out_edges
  
  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  attr_accessor :cost, :from_vertex, :to_vertex

  def initialize(from_vertex, to_vertex, cost = 1)
    @cost = cost
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @to_vertex.in_edges << self
    @from_vertex.out_edges << self
  end

  def destroy!
    @from_vertex.out_edges.delete(self)
    @to_vertex.in_edges.delete(self)
    @from_vertex = nil
    @to_vertex = nil
  end
end
