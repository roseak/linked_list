gem 'minitest', '~>5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './link_list'

class LinkListTest < Minitest::Test

  def setup
    @list = LinkList.new
    @list.append("1")
    @list.append("2")
    @list.append("3")
    @list.append("4")
  end

  def test_head_is_a_node
    assert_equal Node, @list.head.class
  end

  def test_empty_list_can_append_node
    list = LinkList.new
    list.append("1")
    assert_equal "1", list.head.data
  end

  def test_list_with_one_node_can_append_second_node
    assert_equal "2", @list.head.next_node.data
  end

  def test_list_with_nodes_can_prepend_a_node_before_it
    @list.prepend("5")
    assert_equal "5", @list.head.data
  end

  def test_can_prepend_a_node_to_an_empty_list
    list = LinkList.new
    list.prepend("1")
    assert_equal "1", list.head.data
  end

  def test_node_inserted_at_spot_specified
    @list.insert("5", 2)
    assert_equal "5", @list.head.next_node.next_node.data
  end

  def test_error_if_insert_position_is_less_than_zero
    assert_equal "error", @list.insert("-1", -1)
  end

  def test_error_if_insert_position_is_too_large
    assert_equal "error", @list.insert("7", 7)
  end

  def test_node_is_included_in_list
    assert @list.includes?("2")
  end

  def test_node_is_not_included_in_list
    refute @list.includes?("5")
  end

  def test_pop_returns_the_last_node
    assert_equal "4", @list.pop.data
  end

  def test_pop_removes_node_from_list
    @list.pop
    refute @list.includes?("4")
  end

  def test_pop_at_head_returns_nil
    list = LinkList.new
    list.append("1")
    assert_equal nil, list.pop
  end

  def test_can_count_amount_of_nodes_in_list
    assert_equal 4, @list.count
  end

  def test_head_returns_first_node
    assert_equal "1", @list.head.data
  end

  def test_tail_returns_last_node
    assert_equal "4", @list.tail.data
  end

  def test_can_find_the_node_for_an_existing_index
    assert_equal "1", @list.find_by_index(0).data
    assert_equal "2", @list.find_by_index(1).data
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
    assert_equal "4", @list.find_by_index(2).data
  end

  def test_returns_nil_if_nonexistent_index
    assert_equal "error", @list.remove_by_index(5)
  end

  def test_it_can_remove_value_at_last_index
    @list.remove_by_index(3)
    assert_nil @list.find_by_index(3)
  end

  def test_it_can_remove_value_at_first_index
    @list.remove_by_index(0)
    assert_equal "2", @list.head.data
  end

  def test_it_can_remove_by_value
    @list.remove_by_value("3")
    assert_equal "4", @list.find_by_index(2).data
  end

  def test_returns_nil_if_value_not_in_list
    assert_equal nil, @list.remove_by_value("5")
  end

  def test_distance_between_two_nodes_is_found
    assert_equal 2, @list.distance("1", "3")
  end

  def test_distance_is_positive_number_between_two_nodes
    assert_equal 2, @list.distance("3", "1")
  end

  def test_returns_nil_if_one_of_nodes_does_not_exist_for_distance
    assert_nil @list.distance("5", "3")
  end
end
