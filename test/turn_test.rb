require 'minitest/autorun'
require './lib/card'
require './lib/turn'
class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_turn_exists
    assert_instance_of Turn, @turn
  end

  def test_turn_has_a_guess
    assert_equal "Juneau", @turn.guess
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

  # add test to handle incorrect guess

end
