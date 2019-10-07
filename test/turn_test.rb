require 'minitest/autorun'
require './lib/card'
require './lib/turn'
class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("juneau", @card)
    @turn_incorrect = Turn.new("saturn", @card)
  end

  # tests to handle correct guess
  def test_turn_exists
    assert_instance_of Turn, @turn
  end

  def test_turn_has_a_guess
    assert_equal "juneau", @turn.guess
  end

  def test_turn_has_a_card
    assert_equal @card, @turn.card
  end

  def test_turn_correct_method
    assert_equal true, @turn.correct?
  end

  def test_turn_feedback_method
    assert_equal "Correct!", @turn.feedback
  end

  # tests to handle incorrect guess

  def test_turn_has_a_guess_incorrect
    assert_equal "saturn", @turn_incorrect.guess
  end

  def test_turn_correct_method_incorrect
    assert_equal false, @turn_incorrect.correct?
  end

  def test_turn_feedback_method_incorrect
    assert_equal "Incorrect.", @turn_incorrect.feedback
  end

end
