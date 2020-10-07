require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_has_turn #made it more concise, got rid of _a
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneu", card)

    assert_instance_of Card, card
    assert_instance_of Turn, turn
  end

  def test_turn_has_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneu", card)

    assert_instance_of Card, card
    assert_equal_to card, turn.card
  end

  def test_it_has_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneu", card)

    assert_equal_to "Juneu", turn.answer
  end



  #def test_it_has_new_answer
  #  card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

  #  assert_equal "Mercury", card2.answer
end
