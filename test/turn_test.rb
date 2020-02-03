require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  def test_it_is_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", card)
    turn2 = Turn.new("Boston", card)

    assert_equal true, turn1.correct?
    assert_equal false, turn2.correct?

  end

  def test_it_provides_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", card)
    turn2 = Turn.new("Boston", card)

    assert_equal "Correct!", turn1.feedback
    assert_equal "Incorrect.", turn2.feedback
  end
  
end
