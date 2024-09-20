# frozen_string_literal: true

require 'shea-linked_list/node'

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
      while current_node
        size += 1
        current_node = current_node.next_node
      end
    end
    size
  end

  # returns the node at the given index
  def at(index)
    return nil if index.negative? || index > size - 1

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
    new_tail.next_node = nil if new_tail
    @tail = new_tail
  end

  # returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    current_node = @head
    while current_node
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
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

  # inserts a new node with the provided value at the given index
  def insert_at(value, index)
    case index
    when 0 then prepend(value)
    when size - 1 then append(value)
    else
      next_node = at(index)
      node = Node.new(value, next_node)
      prev_node = at(index - 1)
      prev_node.next_node = node
    end
  end

  # removes the node at the given index
  def remove_at(index)
    prev_node = at(index - 1)
    next_node = at(index + 1)
    if index.zero?
      @head = next_node
    else
      prev_node.next_node = next_node
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
