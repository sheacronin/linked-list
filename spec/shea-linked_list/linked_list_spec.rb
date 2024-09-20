# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/shea-linked_list/linked_list'

describe 'append' do
  it 'appends a node' do
    list = LinkedList.new
    list.append(1)
    expect(list.tail.value).to be(1)
  end
end

describe 'prepend' do
  it 'prepends a node' do
    list = LinkedList.new
    list.prepend(1)
    expect(list.head.value).to be(1)
  end
end

describe 'size' do
  it 'determines size of list' do
    list = LinkedList.new
    list.append(1)
    list.append(2)
    list.append(3)
    expect(list.size).to be(3)
  end
end

describe 'head' do
  it 'returns first node in list' do
    list = LinkedList.new
    list.append(1)
    list.append(2)
    list.append(3)
    expect(list.head.value).to be(1)
  end
end

describe 'tail' do
  it 'returns last node in list' do
    list = LinkedList.new
    list.append(1)
    list.append(2)
    list.append(3)
    expect(list.tail.value).to be(3)
  end
end

describe 'at' do
  it 'returns node at certain index' do
    list = LinkedList.new
    list.append(1)
    list.append(2)
    list.append(3)
    expect(list.at(1).value).to be(2)
  end
end

describe 'pop' do
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
end

describe 'contains?' do
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
end

describe 'find' do
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
end

describe 'to_s' do
  it 'outputs as string' do
    list = LinkedList.new
    list.append('dog')
    list.append('cat')
    list.append('parrot')
    list.append('turtle')
    expect { puts list }.to output("( dog ) -> ( cat ) -> ( parrot ) -> ( turtle ) -> nil\n").to_stdout
  end
end

describe 'insert_at' do
  it 'inserts new node at index' do
    list = LinkedList.new
    list.append('dog')
    list.append('cat')
    list.append('parrot')
    list.append('turtle')
    expect { puts list }.to output("( dog ) -> ( cat ) -> ( parrot ) -> ( turtle ) -> nil\n").to_stdout

    list.insert_at('flamingo', 2)
    expect { puts list }.to output("( dog ) -> ( cat ) -> ( flamingo ) -> ( parrot ) -> ( turtle ) -> nil\n").to_stdout
    expect(list.at(2).value).to be('flamingo')
  end

  it 'inserts new node at index in small list' do
    list = LinkedList.new
    list.append('dog')
    list.append('cat')
    expect { puts list }.to output("( dog ) -> ( cat ) -> nil\n").to_stdout

    list.insert_at('flamingo', 1)
    expect { puts list }.to output("( dog ) -> ( flamingo ) -> ( cat ) -> nil\n").to_stdout
    expect(list.at(1).value).to be('flamingo')
  end

  it 'inserts at index 0' do
    list = LinkedList.new
    list.append('dog')
    list.append('cat')
    list.append('parrot')

    list.insert_at('turtle', 0)
    expect { puts list }.to output("( turtle ) -> ( dog ) -> ( cat ) -> ( parrot ) -> nil\n").to_stdout
    expect(list.at(0).value).to be('turtle')
  end
end

describe 'remove_at' do
  it 'removes node at index' do
    list = LinkedList.new
    list.append('dog')
    list.append('cat')
    list.append('parrot')
    list.append('turtle')
    expect { puts list }.to output("( dog ) -> ( cat ) -> ( parrot ) -> ( turtle ) -> nil\n").to_stdout

    list.remove_at(2)
    expect { puts list }.to output("( dog ) -> ( cat ) -> ( turtle ) -> nil\n").to_stdout
    expect(list.at(2).value).to be('turtle')
  end

  it 'removes single node' do
    list = LinkedList.new
    list.append('single')
    expect(list.size).to be(1)
    expect { puts list }.to output("( single ) -> nil\n").to_stdout

    list.remove_at(0)
    expect(list.size).to be(0)
    expect { puts list }.to output("nil\n").to_stdout
  end

  it 'removes head node' do
    list = LinkedList.new
    list.append('dog')
    list.append('cat')
    list.append('turtle')
    expect { puts list }.to output("( dog ) -> ( cat ) -> ( turtle ) -> nil\n").to_stdout
    expect(list.at(0).value).to be('dog')

    list.remove_at(0)
    expect { puts list }.to output("( cat ) -> ( turtle ) -> nil\n").to_stdout
    expect(list.at(0).value).to be('cat')
  end
end
