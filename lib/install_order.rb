# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'
require 'byebug'


def install_order(arr)
  vertex_hash = {}
  independant = []
  arr.each do |tuple|
    to_vertex = vertex_hash[tuple[0]] || Vertex.new(tuple[0])
    from_vertex = vertex_hash[tuple[1]] || Vertex.new(tuple[1])
    edge = Edge.new(from_vertex, to_vertex)
    vertex_hash[tuple[0]] = to_vertex
    vertex_hash[tuple[1]] = from_vertex
  end 
  sorted_vertices = topological_sort(vertex_hash.values).map { |vertex| vertex.value }
  max = sorted_vertices.max
  [*1..max].each { |value| independant << value unless vertex_hash[value] }
  independant + sorted_vertices
end 