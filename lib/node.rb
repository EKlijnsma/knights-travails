# frozen_string_literal: true

class Node
  include Comparable
  attr_accessor :parent, :data

  def initialize(square, parent_node = nil)
    self.data = square
    self.parent = parent_node
  end

  def <=>(other)
    data <=> other.data
  end
end
