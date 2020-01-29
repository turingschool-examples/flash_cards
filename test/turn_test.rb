require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_has_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_instance_of Card, card
  end
end

def test_it_has_turn
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", Card)

  assert_instance_of Turn, turn
end

def test_it_has_guess
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", Card)

  assert_equal "Juneau", turn.guess

end
