# frozen_string_literal: true

# Holds a single element of data and a link/pointer to the next Node in the LinkedList
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
