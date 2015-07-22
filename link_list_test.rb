gem 'minitest', '~>5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './link_list'

class LinkListTest < Minitest::Test

  def test_empty_list_can_append_node
    list = LinkList.new
    node = Node.new("data")
    list.append(node)
    assert_equal node, list.head
  end

  def test_list_with_one_node_can_append_second_node
    list = LinkList.new
    node = Node.new("data")
    node2 = Node.new("data")
    list.append(node)
    list.append(node2)
    assert_equal node2, list.head.next_node
  end

  def test_list_with_one_node_can_prepend_a_node_before_it
    list = LinkList.new
    node = Node.new("1")
    node2 = Node.new("2")
    list.append(node)
    list.prepend(node2)
    assert_equal node2, list.head
  end

  def test_node_inserted_at_spot_specified
    list = LinkList.new
    node = Node.new("1")
    node2 = Node.new("2")
    node3 = Node.new("3")
    node4 = Node.new("4")
    list.append(node)
    list.append(node2)
    list.append(node3)
    list.insert(node4, 2)
    assert_equal node4, list.head.next_node.next_node
  end

  def test_node_is_included_in_list
    list = LinkList.new
    node = Node.new("1")
    node2 = Node.new("2")
    node3 = Node.new("3")
    node4 = Node.new("4")
    list.append(node)
    list.append(node2)
    list.append(node3)
    list.append(node4)
    assert list.includes?("2")
  end

  def test_node_is_not_included_in_list
    list = LinkList.new
    node = Node.new("1")
    node2 = Node.new("2")
    node4 = Node.new("4")
    list.append(node)
    list.append(node2)
    list.append(node4)
    refute list.includes?("3")
  end

  def test_pop_returns_the_last_node
    list = LinkList.new
    node = Node.new("1")
    node2 = Node.new("2")
    node3 = Node.new("3")
    node4 = Node.new("4")
    list.append(node)
    list.append(node2)
    list.append(node3)
    list.append(node4)
    assert_equal node4, list.pop
  end

  def test_pop_removes_node_from_list
    list = LinkList.new
    node = Node.new("1")
    node2 = Node.new("2")
    node3 = Node.new("3")
    node4 = Node.new("4")
    list.append(node)
    list.append(node2)
    list.append(node3)
    list.append(node4)
    list.pop
    refute list.includes?("4")
  end

  def test_can_count_amount_of_nodes_in_list
    list = LinkList.new
    node = Node.new("1")
    node2 = Node.new("2")
    node3 = Node.new("3")
    node4 = Node.new("4")
    list.append(node)
    list.append(node2)
    list.append(node3)
    list.append(node4)
    assert_equal 4, list.count
  end

  def test_head_returns_first_node
    list = LinkList.new
    node = Node.new("1")
    node2 = Node.new("2")
    node3 = Node.new("3")
    node4 = Node.new("4")
    list.append(node)
    list.append(node2)
    list.append(node3)
    list.append(node4)
    assert_equal node, list.head
  end

  def test_tail_returns_last_node
    list = LinkList.new
    node = Node.new("1")
    node2 = Node.new("2")
    node3 = Node.new("3")
    node4 = Node.new("4")
    list.append(node)
    list.append(node2)
    list.append(node3)
    list.append(node4)
    assert_equal node4, list.tail
  end
end
