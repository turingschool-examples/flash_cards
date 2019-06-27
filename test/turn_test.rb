require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Saturn", card)

    assert_instance_of Turn, turn
  end

def test_it_has_a_card
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Saturn", card)

  assert_equal card, turn.card
end

def test_if_it_has_guess
card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Saturn", card)

 assert_equal "Juneau", turn.guess
end


end
