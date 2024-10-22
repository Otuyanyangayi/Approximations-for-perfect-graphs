# Dijkstra's Algorithm in Ruby

# Graph as an adjacency list: {node => {neighbor => weight}}
def dijkstra(graph, source)
    # Initialize distances hash with Infinity for all nodes except the source
    distances = {}
    graph.each_key { |node| distances[node] = Float::INFINITY }
    distances[source] = 0
  
    # Priority queue to store the nodes with their distances
    priority_queue = { source => 0 }
  
    until priority_queue.empty?
      # Extract the node with the smallest distance
      current_node = priority_queue.min_by { |_, dist| dist }[0]
      current_distance = priority_queue[current_node]
  
      # Remove the node from the priority queue
      priority_queue.delete(current_node)
  
      # Check neighbors of the current node
      graph[current_node].each do |neighbor, weight|
        new_distance = current_distance + weight
  
        # If the new distance is shorter, update and add to the queue
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
  # Example graph representation
  graph = {
    'A' => { 'B' => 1, 'C' => 4 },
    'B' => { 'A' => 1, 'C' => 2, 'D' => 5 },
    'C' => { 'A' => 4, 'B' => 2, 'D' => 1 },
    'D' => { 'B' => 5, 'C' => 1 }
  }
  
  source = 'A'
  distances = dijkstra(graph, source)
  puts "Shortest distances from source #{source}:"
  distances.each { |node, dist| puts "#{node}: #{dist}" }
  