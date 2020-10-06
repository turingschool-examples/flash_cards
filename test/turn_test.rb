require 'minitest/autorun'
require 'minitest/pride'
require '../lib/turn'

class TurnTest < Minitest::Test
  def test_it_has_turn
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Card, card
    assert_instance_of Turn, turn
  end

  

end
