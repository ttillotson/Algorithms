require 'byebug'
require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# Khan
def topological_sort(vertices)
    out_queue = []
    sorted = []
    sorted_hash = {}

    until sorted.length == vertices.length 
        out_queue = vertices.select do |v| 
            v.in_edges.empty? && !sorted_hash.include?(v.value)
        end
        # Break if Cyclic/Disconnected Graph
        return [] if out_queue.empty?

        until out_queue.empty?
            vertice = out_queue.shift
            sorted << vertice
            sorted_hash[vertice.value] = true
            vertice.out_edges[0].destroy! until vertice.out_edges.empty?
        end
    end

    sorted
end

# Tarian
# def topological_sort(vertices)

# end