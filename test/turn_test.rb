require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/turn'


class TurnTest < Minitest::Test

  # setup test
  def setup
    @mock_card = Card.new("What is the capital of Italy?", "Rome", :geography)
    @mock_turn = Turn.new("Rome", @mock_card)
  end

  def test_it_exists
    assert_instance_of Turn, @mock_turn
  end
end