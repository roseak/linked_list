require './node'

class LinkList
  attr_accessor :head

  def initialize(data = nil)
    @head = nil
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      current = @head
      until current.tail?
        current = current.next_node
      end
      current.next_node = Node.new(data)
    end
  end

  def prepend(data)
    node = Node.new(data)
    node.next_node = @head
    @head = node
  end

  def insert(data, position)
    return "error" if position < 0 || position > count
    before = @head
    (position-1).times {before = before.next_node}
    after = before.next_node
    before.next_node = Node.new(data)
    before.next_node.next_node = after
  end

  def includes?(data)
    current = @head
    until current.data == data || current.tail?
      current = current.next_node
    end
    current.data == data
  end

  def pop
    return if count == 1
    current = @head
    until current.next_node.tail?
      current = current.next_node
    end
    result = current.next_node
    current.next_node = nil
    result
  end

  def count
    counter = 1
    current = @head
    until current.tail?
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
    until current == tail
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

  def distance(data1, data2)
    return if find_by_value(data1) == nil || find_by_value(data2) == nil
    (find_by_value(data2)-find_by_value(data1)).abs
  end
end
