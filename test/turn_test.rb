require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_return_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Card, turn.card
  end

  def test_make_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  def test_is_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert turn.correct?
  end

  def test_is_incorrect
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    refute turn.correct?
  end

  def test_get_feedback_for_correct_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Correct!", turn.feedback
  end

  def test_get_feedback_for_incorrect_guess
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal "Incorrect.", turn.feedback
  end
end
