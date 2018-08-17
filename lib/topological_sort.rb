require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  res = []
  hash = {}
  q = []
  vertices.each do |vertex| 
    hash[vertex] = vertex.in_edges.length 
    q << vertex if vertex.in_edges.empty?
  end 
  until q.empty? 
    vertex = q.shift
    vertex.out_edges.each do |edge| 
      hash[edge.to_vertex] -= 1
      q << edge.to_vertex if hash[edge.to_vertex] == 0
    end 
    res << vertex
  end 
  hash.values.all? {|value| value == 0} ? res : []
end

