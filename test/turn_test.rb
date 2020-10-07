require 'minitest/autorun'
require './lib/card'
require './lib/turn'

class TurnTest < MiniTest::Test

  # Tests for correct

  def test_turn_instantiation
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_turn_instance_variables
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal card, turn.card
    assert_instance_of Card, turn.card
    assert_equal "Juneau", turn.guess
  end

  def test_turn_correct_method
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal true, turn.correct?
  end

  def test_turn_feedback_method
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Correct!", turn.feedback
  end

end
