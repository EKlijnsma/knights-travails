# frozen_string_literal: true

require_relative 'node'

class Knight
  attr_accessor :graph

  # Class variable to store the knight's movement graph
  @@knights_graph = nil

  def initialize
    # Build the graph if it hasn't been built already
    self.graph = self.class.build_graph
  end

  def self.build_graph
    # Return the existing graph if it's already been generated
    return @@knights_graph unless @@knights_graph.nil?

    # Define the knight's relative moves
    relative_moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
    # Initiate graph hash
    @@knights_graph = {}
    (0..7).each do |i|
      (0..7).each do |j|
        # Store the square [i,j] as a key in the graph
        square = [i, j]
        @@knights_graph[square] = []
        relative_moves.each do |move|
          # Calculate all possible squares the knight can reach, and add them to the graph if they are not outside the board.
          new_square = [i + move[0], j + move[1]]
          @@knights_graph[square].push(new_square) if new_square[0].between?(0, 7) && new_square[1].between?(0, 7)
        end
      end
    end
    @@knights_graph
  end

  def knight_moves(source, target)
    # Convert target square to Node class for comparison
    target_node = Node.new(target)
    visited_squares = Set.new
    path = []
    # Enqueue starting square
    queue = [Node.new(source)]
    current_node = nil
    loop do
      # Return nil if queue is empty (although that is not theoretically possible in this example)
      return nil if queue.empty?

      # Dequeue a node and add its square to the visited array
      current_node = queue.shift
      visited_squares.add(current_node.data)
      # If Node is the target, exit loop
      break if current_node == target_node

      # Else, enqueue all its children unless they are already visited
      graph[current_node.data].each { |sq| queue.push(Node.new(sq, current_node)) unless visited_squares.include?(sq) }
    end
    # Outside the loop, trace back the path and return it as an Array
    until current_node.nil?
      path.unshift(current_node.data)
      current_node = current_node.parent
    end
    path
  end
end
