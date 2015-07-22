require './node'

class LinkList
  attr_accessor :head

  def initialize(node = nil)
    @head = node
  end

  def append(node)
    if @head == nil
      @head = node
    else
      current = @head
      until current.next_node == nil
        current = current.next_node
      end
      current.next_node = node
    end
  end

  def prepend(node)
    node.next_node = @head
    @head = node
  end

  def insert(new_node, position)
    before = @head
    (position-1).times {before = before.next_node}
    after = before.next_node
    before.next_node = new_node
    new_node.next_node = after
  end

  def includes?(data)
    current = @head
    until current.data == data || current.next_node == nil
      current = current.next_node
    end
    current.data == data
  end

  def pop
    current = @head
    until current.next_node.next_node == nil
      current = current.next_node
    end
    result = current.next_node
    current.next_node = nil
    result
  end

  def count
    counter = 1
    current = @head
    until current.next_node == nil
      counter += 1
      current = current.next_node
    end
    counter
  end

  def tail
    current = @head
    until current.tail?
      current = current.next_node
    end
    current
  end

  def find_by_index(index)
    return nil if index < 0 || index >= count
    current = @head
    index.times {current = current.next_node}
    current
  end

  def find_by_value(data)
    current = @head
    position = 0
    until current == nil
      return position if current.data == data
      current = current.next_node
      position += 1
    end
    nil
  end

  def remove_by_index(index)
    if index == 0
      @head = find_by_index(1)
    elsif index < 0 || index >= count
      "error"
    else
      find_by_index(index-1).next_node = find_by_index(index+1)
    end
  end

  def remove_by_value(data)
    if position = find_by_value(data)
      remove_by_index(position)
    end
  end

end
