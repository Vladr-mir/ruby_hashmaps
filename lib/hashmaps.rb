# frozen_string_literal: false

require_relative 'linked_list'
# require 'pry-byebug'

# overstep_limitation = -> { raise IndexError if index.negative? || index >= @buckets.length }

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
end

# Binding.pry
# my_hashmap = HashMap.new
# my_hashmap.set('Carlos', 'Carlos')
# my_hashmap.set('Carla', 'Carla')
# puts my_hashmap.get('Carla')
# puts "\n"
# puts my_hashmap.buckets[my_hashmap.hash('Carlos')]
# puts my_hashmap.length
