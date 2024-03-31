# frozen_string_literal: false

require './lib/linked_list'
require_relative 'spec_helper'

# frozen_string_literal: true

RSpec.describe 'Linked_list' do
  describe 'prepend' do
    my_linked_list = LinkedList.new

    it 'Adds a node to the linked_list' do
      my_linked_list.prepend(0, 'First')
      expect(my_linked_list.at(0).nil?).to eq(false)
    end

    it 'Moves the first node forward' do
      my_linked_list.prepend(1, 'Second')
      expect(my_linked_list.at(1).value).to eq('First')
    end
  end

  describe 'append' do
    my_linked_list = LinkedList.new

    it 'Adds a node to the linked_list' do
      my_linked_list.append(0, 'First')
      expect(my_linked_list.at(0).nil?).to eq(false)
    end

    it 'Adds a node at the end of the linked_list' do
      my_linked_list.append(0, 'Second')
      expect(my_linked_list.at(1).value).to eq('Second')
    end
  end
end
