require "minitest/autorun"
require "minitest/pride"
require "./lib/turn"
require "./lib/card"

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_instance_of Turn, turn
  end

  def test_it_has_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal turn.card, card
  end

  def test_it_has_a_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal "Juneau", turn.guess
  end

  def test_it_has_a_correct?
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal true, turn.correct?
  end

  def test_it_gives_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    correct_turn = Turn.new("Juneau", card)
    incorrect_turn = Turn.new("Anchorage", card)
    assert_equal correct_turn.feedback, "Correct!"
    assert_equal incorrect_turn.feedback, "Incorrect."
  end

end
