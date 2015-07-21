gem 'minitest', '~>5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './node'

class NodeTest < Minitest::Test
  def test_next_node_is_nil
    node = Node.new
    assert_equal nil, node.next_node
  end

  def test_node_data_is_nil
    node = Node.new
    assert_equal nil, node.data
  end
end
