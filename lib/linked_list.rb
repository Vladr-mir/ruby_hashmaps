# frozen_string_literal: false

# LinkedList implementation
class LinkedList
  attr_reader :size, :head, :length

  Node = Struct.new(:key, :value, :next_node)

  def initialize
    @head = nil
    @length = 0
  end

  def append(key, value)
    increase_length
    return prepend(key, value) if @head.nil?

    traverse { |node| return node.next_node = Node.new(key, value, nil) if node.next_node.nil? }
  end

  def prepend(key, value)
    increase_length

    @head = Node.new(key, value, @head)
  end

  # returns the last node in the list
  def tail
    traverse { |node| return node if node.next_node.nil? }
  end

  def at(index)
    pos = 0
    traverse do |node|
      return node if pos == index

      pos += 1
    end
    nil
  end

  def to_s
    return '()' if @head.nil?

    str = ''
    traverse { |node| str << "(#{node.key} , #{node.value}) -> " }
    str << 'nil'
  end

  def contains?(key)
    traverse { |node| node.key == key }
    false
  end

  def find
    traverse { |node| return node if yield(node) }
  end

  # removes the last element in the list
  def pop
    decrease_length
    at(size - 1).next_node = nil
  end

  # Removes the first element and shifts list.
  def shift
    decrease_length
    target = @head
    @head = @head.next_node
    target
  end

  def traverse
    pos = @head

    until pos.nil?
      yield (pos)
      pos = pos.next_node
    end
  end

  # Removes the element with the key
  def remove(key)
    deleted_node = nil
    traverse do |node|
      return shift if node.key == key # Returns if the first node is the target node
      return nil if node.next_node.nil?

      deleted_node = node.next_node
      if node.next_node.key == key
        node.next_node = node.next_node.next_node
        decrease_length
        return deleted_node
      end
    end
  end

  private

  def increase_length
    @length += 1
  end

  def decrease_length
    @length -= 1
  end
end
