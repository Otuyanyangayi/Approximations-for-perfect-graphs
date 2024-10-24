Here’s a sample `README.md` file for your project in Markdown format:

---

# Dijkstra's Algorithm Comparison: General vs. Perfect Graphs

## Project Overview

This project implements Dijkstra's algorithm to compare its performance between general graphs and perfect graphs. The goal is to analyze the algorithm's behavior and efficiency in these different graph types and evaluate it experimentally. 

The project is developed in Ruby for the academic year 2024/2025, supervised by **Ing. Martin Havel**, for the topic **"Comparison - Approximations for Perfect Graphs"**.

## Requirements

Ensure that the following is installed on your Ubuntu machine:

- Ruby
- Ruby's `benchmark` module (comes pre-installed with Ruby)

### Installation Instructions

1. **Update System**: Update your package list before installing Ruby.
   ```bash
   sudo apt update
   ```

2. **Install Ruby**:
   ```bash
   sudo apt install ruby
   ```

3. **Verify Installation**:
   ```bash
   ruby -v
   ```

4. **Clone or Download the Project**: Download this repository or copy the project files to your local system.

## Project Structure

```bash
.
├── dijkstra.rb       # Main Ruby file containing Dijkstra's algorithm and graph comparison
└── README.md         # This README file
```

## How to Run the Program

1. Navigate to the project directory:
   ```bash
   cd /path/to/project
   ```

2. Run the Ruby file to execute the comparison:
   ```bash
   ruby dijkstra.rb
   ```

   This will output the shortest distances calculated by Dijkstra’s algorithm for both a general graph and a perfect graph. It will also show the time taken by the algorithm for each graph type and whether the given graph is perfect.

## Graph Representation

The graphs in this project are represented as adjacency lists, where each node has a hash of neighboring nodes and their corresponding edge weights.

### General Graph Example

```ruby
general_graph = {
  'A' => { 'B' => 1, 'C' => 4 },
  'B' => { 'A' => 1, 'C' => 2, 'D' => 5 },
  'C' => { 'A' => 4, 'B' => 2, 'D' => 1 },
  'D' => { 'B' => 5, 'C' => 1 }
}
```

### Perfect Graph Example

```ruby
perfect_graph = {
  'A' => { 'B' => 1 },
  'B' => { 'A' => 1, 'C' => 2, 'D' => 3 },
  'C' => { 'B' => 2 },
  'D' => { 'B' => 3 }
}
```

## Performance Comparison

To compare the performance of Dijkstra's algorithm on general and perfect graphs, the `Benchmark` module is used. The code outputs the time taken for both graphs and displays whether a graph is perfect.

Sample output might look like:
```
       user     system      total        real
General graph: { A: 0, B: 1, C: 3, D: 4 }
Perfect graph: { A: 0, B: 1, C: 3, D: 4 }
General graph:  0.000021   0.000000   0.000021 (  0.000010)
Perfect graph:  0.000015   0.000000   0.000015 (  0.000008)
Is general graph perfect? false
Is perfect graph perfect? true
```

## Conclusion

This project allows for an experimental comparison of Dijkstra's algorithm on different types of graphs. It provides insights into how graph structure (general vs. perfect) can impact the performance of the algorithm.

## License

This project is intended for educational purposes. Please feel free to use or modify it as needed for academic and non-commercial uses.

---


