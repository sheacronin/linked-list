# frozen_string_literal: true

require_relative './node'

# A linear collection of Node data elements that “point” to the next Node by means of a pointer
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # adds a new node containing value to the end of the list
  def append(value)
    node = Node.new(value)
    @head ||= node
    @tail.next_node = node if @tail
    @tail = node
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    next_node = @head if @head
    node = Node.new(value, next_node)
    @tail ||= node
    @head = node
  end

  # returns the total number of nodes in the list
  def size
    size = 0
    if @head
      current_node = @head
      until current_node == @tail
        size += 1
        current_node = current_node.next_node
      end
      # add tail node
      size += 1
    end
    size
  end

  # returns the node at the given index
  def at(index)
    i = 0
    node = @head
    while i < index
      i += 1
      node = node.next_node
    end
    node
  end

  # removes the last element from the list
  def pop
    new_tail = at(size - 2)
    new_tail.next_node = nil
    @tail = new_tail
  end

  # returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    current_node = @head
    until current_node == @tail
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    @tail.value == value
  end

  # returns the index of the node containing value, or nil if not found.
  def find(value)
    current_node = @head
    i = 0
    while current_node
      return i if current_node.value == value

      i += 1
      current_node = current_node.next_node
    end
  end

  # the format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    output = +''
    current_node = @head
    while current_node
      output << "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    output << 'nil'
  end
end
