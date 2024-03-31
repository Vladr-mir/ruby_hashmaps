# frozen_string_literal: false

require './lib/hashmaps'
require_relative 'spec_helper'

RSpec.describe 'hashmaps' do
  describe 'new' do
    it 'Create a new hashmap of size 16' do # Initial capacity
      my_hashmap = HashMap.new
      expect(my_hashmap.buckets.length).to eq(16)
    end
  end

  describe 'hash' do
    it 'Creates a hash less than 16' do
      my_hashmap = HashMap.new
      key = my_hashmap.hash('Carlos')
      expect(key).to be <= 16
    end
  end
end
