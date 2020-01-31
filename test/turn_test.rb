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

    assert_instance_of Turn, turn
  end

  def test_correct_is_working
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", card1)

    assert_equal true, turn1.correct?

    card2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn2 = Turn.new("Denver", card2)

    assert_equal false, turn2.correct?

  end

  def test_it_can_give_feedback
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", card1)

    assert_equal "Correct!", turn1.feedback

     card2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     turn2 = Turn.new("Denver", card2)

     assert_equal "Incorrect.", turn2.feedback
   end
end
