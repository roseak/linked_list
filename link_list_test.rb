gem 'minitest', '~>5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './link_list'

class LinkListTest < Minitest::Test

  def setup
    @list = LinkList.new
    @node = Node.new("1")
    @node2 = Node.new("2")
    @node3 = Node.new("3")
    @node4 = Node.new("4")
    @list.append(@node)
    @list.append(@node2)
    @list.append(@node3)
    @list.append(@node4)
  end

  def test_empty_list_can_append_node
    assert_equal @node, @list.head
  end

  def test_list_with_one_node_can_append_second_node
    assert_equal @node2, @list.head.next_node
  end

  def test_list_with_one_node_can_prepend_a_node_before_it
    node5 = Node.new("5")
    @list.prepend(node5)
    assert_equal node5, @list.head
  end

  def test_node_inserted_at_spot_specified
    node5 = Node.new("5")
    @list.insert(node5, 2)
    assert_equal node5, @list.head.next_node.next_node
  end

  def test_node_is_included_in_list
    assert @list.includes?("2")
  end

  def test_node_is_not_included_in_list
    refute @list.includes?("5")
  end

  def test_pop_returns_the_last_node
    assert_equal @node4, @list.pop
  end

  def test_pop_removes_node_from_list
    @list.pop
    refute @list.includes?("4")
  end

  def test_can_count_amount_of_nodes_in_list
    assert_equal 4, @list.count
  end

  def test_head_returns_first_node
    assert_equal @node, @list.head
  end

  def test_tail_returns_last_node
    assert_equal @node4, @list.tail
  end

  def test_can_find_the_node_for_an_existing_index
    assert_equal @node, @list.find_by_index(0)
    assert_equal @node2, @list.find_by_index(1)
  end

  def test_can_find_node_using_a_negative_index
      assert_nil @list.find_by_index(-1)
  end

  def test_index_outside_of_list_doesnt_find_node
    assert_nil @list.find_by_index(4)
  end

  def test_can_find_first_instance_of_an_existing_value
    assert_equal 1, @list.find_by_value("2")
  end

  def test_nonexistent_value_is_not_found
    assert_equal nil, @list.find_by_value("5")
  end

  def test_can_remove_value_at_specified_index
    @list.remove_by_index(2)
    assert_equal @node4, @list.find_by_index(2)
  end

  def test_returns_nil_if_nonexistent_index
    assert_equal "error", @list.remove_by_index(5)
  end

  def test_it_can_remove_value_at_last_index
    @list.remove_by_index(3)
    assert_nil @node3.next_node
  end

  def test_it_can_remove_value_at_first_index
    @list.remove_by_index(0)
    assert_equal @node2, @list.head
  end

  def test_it_can_remove_by_value
    @list.remove_by_value("3")
    assert_equal @node4, @list.find_by_index(2)
  end

  def test_returns_nil_if_value_not_in_list
    assert_equal nil, @list.remove_by_value("5")
  end
end
