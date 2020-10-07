require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_has_turn
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Card, card
    assert_instance_of Turn, turn
  end

  def test_it_has_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal card, turn.card
  end

  def test_turn_can_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  def test_is_correct
    card = Card.new("What is the capital of Alaska?", "Juneu", :Geography)
    turn = Turn.new("Junea", card)

    assert_equal true, turn.correct?
  end

  def test_give_feedback
    card = Card.new("What is the capital of Alaska?", "Juneu", :Geography)
    turn = Turn.new("Junea", card)

    assert_equal "Correct!", turn.feedback
  end
end
