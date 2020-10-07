require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/turn"

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_has_attributes
    assert_equal @card, @turn.card
    assert_equal "Juneau", @turn.guess
  end

  def test_guess_is_correct
    assert_equal true, @turn.correct?
  end

  def test_it_has_feedback
    assert_equal "Correct!", @turn.feedback
  end

  def test_it_has_incorrect_guesses
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    assert_equal card, turn.card
    assert_equal "Saturn", turn.guess
    assert_equal false, turn.correct?
    assert_equal "Incorrect.", turn.feedback
  end
end
