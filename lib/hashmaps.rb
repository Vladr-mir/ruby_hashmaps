# frozen_string_literal: false

require_relative 'linked_list'
# require 'pry-byebug'

# Hash map implementation
class HashMap
  INITIAL_CAPACITY = 16
  MAX_LOAD_FACTOR = 0.75
  attr_reader :buckets, :length

  def initialize
    @capacity = INITIAL_CAPACITY
    @buckets = Array.new(@capacity)
    @length = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code % @capacity
  end

  def get(key)
    pos = hash(key)
    return @buckets[pos].find { |node| node.key == key } unless @buckets[pos].nil?

    nil
  end

  def set(key, value)
    pos = hash(key)
    @buckets[pos] = LinkedList.new if @buckets[pos].nil?
    @length += 1
    @buckets[pos].append(key, value)
  end

  def clear
    @capacity = INITIAL_CAPACITY
    @buckets = Array.new(@capacity)
    @length = 0
  end

  # Traverses all of the nodes in the HashMap
  def traverse(&block)
    @buckets.each { |list| list&.traverse(&block) }
  end

  def entries
    arr = []
    traverse { |node| arr << [node.key, node.value] }
    arr
  end

  # private

  def double_capacity
    @capacity *= 2
    arr = entries
    @buckets = Array.new(@capacity)

    arr.each { |key, value| set(key, value) }
    # traverse { |node| set(node.key, node.value) }
  end
end
