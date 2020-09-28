class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList < Node
  attr_accessor :list

  def initialize
    @list = Node.new
  end

  def traverse_upto(end_node)
    temp = list
    if end_node.is_a? Numeric
      end_node.times { temp = temp.next_node }
    else
      temp = temp.next_node until temp.next_node == end_node
    end
    temp
  end

  def append(value)
    traverse_upto(nil).next_node = Node.new(value)
  end

  def prepend(value)
    list.next_node = Node.new(value, list.next_node)
  end

  def size
    find(tail)
  end

  def head
    list.next_node.value
  end

  def tail
    traverse_upto(nil).value
  end

  def at(index)
    traverse_upto(index).value
  end

  def pop
    target = find(tail) - 1
    traverse_upto(target).next_node = nil
  end

  def contains?(value)
    target = find(value)
    traverse_upto(target).value == value
  end

  def find(value)
    temp = list
    count = 0
    until temp.next_node.nil? || temp.value == value
      count += 1
      temp = temp.next_node
    end
    temp.value == value ? count : nil
  end

  def insert_at(value, index)
    target = traverse_upto(index - 1)
    target.next_node = Node.new(value, target.next_node)
  end

  def remove_at(index)
    target = traverse_upto(index - 1)
    target.next_node = target.next_node.next_node
  end

  def to_s
    temp = list
    disp = ''
    until temp.next_node.nil?
      temp = temp.next_node
      disp << "(#{temp.value}) -> "
    end
    disp + 'nil'
  end
end

list = LinkedList.new
list.append 'John'
list.append 'Mike'
list.prepend 'Levy'
list.append 'Gina'
list.prepend 'Cole'
#(Cole) -> (Levy) -> (John) -> (Mike) -> (Gina) -> nil

#list.pop
#list.remove_at(2)
#list.insert_at('Mark', 2)

#p list.size
#p list.head
#p list.tail
#p list.at(3)
#p list.contains?('Levy')
#p list.find('Mike')
#p list.to_s

puts list