require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class Turn_test < Minitest::Test
  def test_turn_exists
    card = Card.new("What is the capital of Colorado","Denver",:Geography)
    turn = Turn.new("Denver", card)
    assert_instance_of Turn, turn
  end
end
