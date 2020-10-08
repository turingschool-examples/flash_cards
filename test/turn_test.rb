require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class Test < Minitest::Test

  def test_turn_has_attributes
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal "Juneau", turn.guess
    assert_equal card, turn.card
  end

  def test_incorrect_guess
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    assert_equal false, turn.correct?
  end

end
