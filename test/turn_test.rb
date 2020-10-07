require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_has_turn
    card = Card.new("What is the capital of Alaska?", "Juneu", :Geography)
    turn = Turn.new("Junea", card)

    assert_instance_of Card, card
    assert_instance_of Turn, turn
  end
end
