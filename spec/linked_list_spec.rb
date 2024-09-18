# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/linked_list'

RSpec.describe 'Linked List' do
  it 'appends a node' do
    list = LinkedList.new
    list.append(1)
    expect(list.tail.value).to be(1)
  end

  it 'prepends a node' do
    list = LinkedList.new
    list.prepend(1)
    expect(list.head.value).to be(1)
  end

  it 'determines size of list' do
    list = LinkedList.new
    list.append(1)
    list.append(2)
    list.append(3)
    expect(list.size).to be(3)
  end

  it 'returns first node in list' do
    list = LinkedList.new
    list.append(1)
    list.append(2)
    list.append(3)
    expect(list.head.value).to be(1)
  end

  it 'returns last node in list' do
    list = LinkedList.new
    list.append(1)
    list.append(2)
    list.append(3)
    expect(list.tail.value).to be(3)
  end

  it 'returns node at certain index' do
    list = LinkedList.new
    list.append(1)
    list.append(2)
    list.append(3)
    expect(list.at(1).value).to be(2)
  end

  it 'removes last element from list' do
    list = LinkedList.new
    list.append('dog')
    list.append('cat')
    list.append('parrot')
    list.append('hamster')
    list.append('snake')
    list.append('turtle')
    expect(list.tail.value).to be('turtle')
    list.pop
    expect(list.tail.value).to be('snake')
  end

  it 'returns true if contains element' do
    list = LinkedList.new
    list.append('dog')
    list.append('cat')
    list.append('parrot')
    list.append('hamster')
    list.append('snake')
    list.append('turtle')
    expect(list.contains?('parrot')).to be(true)
  end

  it 'returns false if does not contain element' do
    list = LinkedList.new
    list.append('dog')
    list.append('cat')
    list.append('parrot')
    list.append('hamster')
    list.append('snake')
    list.append('turtle')
    expect(list.contains?('eagle')).to be(false)
  end

  it 'returns index of a value' do
    list = LinkedList.new
    list.append('dog')
    list.append('cat')
    list.append('parrot')
    list.append('hamster')
    list.append('snake')
    list.append('turtle')
    expect(list.find('hamster')).to be(3)
  end

  it 'returns nil for missing value' do
    list = LinkedList.new
    list.append('dog')
    list.append('cat')
    list.append('parrot')
    list.append('hamster')
    list.append('snake')
    list.append('turtle')
    expect(list.find('eagle')).to be(nil)
  end

  it 'outputs as string' do
    list = LinkedList.new
    list.append('dog')
    list.append('cat')
    list.append('parrot')
    list.append('turtle')
    expect { puts list }.to output("( dog ) -> ( cat ) -> ( parrot ) -> ( turtle ) -> nil\n").to_stdout
  end
end
