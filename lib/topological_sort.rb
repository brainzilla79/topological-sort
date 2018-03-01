require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  result = []
  q = []
  in_edge_count = {}
  vertices.each do |vertex| 
    if vertex.in_edges.empty?
      q << vertex 
    else 
      in_edge_count[vertex] = vertex.in_edges.length
    end 
  end 
  until q.empty?
    vertex = q.shift
    result << vertex
    vertex.out_edges.each do |edge|
      in_edge_count[edge.to_vertex] -= 1
      q << edge.to_vertex if in_edge_count[edge.to_vertex] == 0
    end 
  end 

  result.length == vertices.length ? result : []
end
