require 'benchmark'
require 'set'

# Dijkstra's Algorithm in Ruby
def dijkstra(graph, source)
  distances = {}
  graph.each_key { |node| distances[node] = Float::INFINITY }
  distances[source] = 0

  priority_queue = { source => 0 }

  until priority_queue.empty?
    current_node = priority_queue.min_by { |_, dist| dist }[0]
    current_distance = priority_queue[current_node]
    priority_queue.delete(current_node)

    graph[current_node].each do |neighbor, weight|
      new_distance = current_distance + weight
      if new_distance < distances[neighbor]
        distances[neighbor] = new_distance
        priority_queue[neighbor] = new_distance
      end
    end
  end

  distances
end

# Check if a graph is perfect (simple check)
def is_perfect_graph?(graph)
  graph.each_key do |node|
    visited = Set.new
    return false if has_cycle?(graph, node, visited, nil)
  end
  true
end

def has_cycle?(graph, node, visited, parent)
  visited.add(node)
  graph[node].each_key do |neighbor|
    next if neighbor == parent
    return true if visited.include?(neighbor) || has_cycle?(graph, neighbor, visited, node)
  end
  false
end

# General graph example
general_graph = {
  'A' => { 'B' => 1, 'C' => 4 },
  'B' => { 'A' => 1, 'C' => 2, 'D' => 5 },
  'C' => { 'A' => 4, 'B' => 2, 'D' => 1 },
  'D' => { 'B' => 5, 'C' => 1 }
}

# Perfect graph example (a simple tree, which is perfect by definition)
perfect_graph = {
  'A' => { 'B' => 1 },
  'B' => { 'A' => 1, 'C' => 2, 'D' => 3 },
  'C' => { 'B' => 2 },
  'D' => { 'B' => 3 }
}

source = 'A'

# Compare Dijkstra's performance on general vs. perfect graph
Benchmark.bm do |x|
  x.report("General graph:") { puts dijkstra(general_graph, source) }
  x.report("Perfect graph:") { puts dijkstra(perfect_graph, source) }
end

# Check if the graph is perfect
puts "Is general graph perfect? #{is_perfect_graph?(general_graph)}"
puts "Is perfect graph perfect? #{is_perfect_graph?(perfect_graph)}"
