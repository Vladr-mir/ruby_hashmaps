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
    increase_size
    return prepend(key, value) if @head.nil?

    traverse { |node| return node.next_node = Node.new(key, value, nil) if node.next_node.nil? }
  end

  def prepend(key, value)
    increase_size

    @head = Node.new(key, value, @head)
  end

  def tail
    return Node.new(nil, nil) if @head.nil?

    last_node = @head
    last_node = last_node.next_node until last_node.next_node.nil?
    last_node
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

  def pop
    decrease_size
    at(size - 1).next_node = nil
  end

  def contains?(value)
    !(@buckets[pos].find { |node| node.value == value }).nil?
  end

  def find
    traverse { |node| return node if yield(node) }
  end

  def shift
    decrease_size
    target = @head
    @head = @head.next_node
    target
  end

  private

  def traverse
    pos = @head

    until pos.nil?
      yield (pos)
      pos = pos.next_node
    end
  end

  def increase_size
    @length += 1
  end

  def decrease_size
    @length -= 1
  end
end
