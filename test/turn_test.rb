require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn_correct = Turn.new("Juneau", @card1)
    @turn_incorrect = Turn.new("Idk", @card1)
  end

  def test_turn_exists
    assert_instance_of Turn, @turn_correct
  end

  def test_has_a_guess
    assert_equal "Juneau", @turn_correct.guess
  end

  def test_has_correct_card
    assert_equal @card1, @turn_correct.card
  end

  def test_evaluation_is_correct
    # Run test with correctly answered turn
    assert (@turn_correct.guess == @card1.answer) == @turn_correct.correct?
    # Run test with incorrectly answered turn
    assert (@turn_incorrect.guess == @card1.answer) == @turn_incorrect.correct?
  end

  def test_feedback
    # Run test with correctly answered turn
    assert (@turn_correct.correct? && @turn_correct.feedback == "Correct!") || (!@turn_correct.correct? && @turn_correct.feedback == "Incorrect.")
    # Run test with incorrectly answered turn
    assert (@turn_incorrect.correct? && @turn_incorrect.feedback == "Correct!") || (!@turn_incorrect.correct? && @turn_incorrect.feedback == "Incorrect.")
  end

end
