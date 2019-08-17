require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
     @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     @turn = Turn.new("Juneau", @card)
     @turn2 = Turn.new("Fairbanks", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_card
    assert_equal @card, @turn.card
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_method_correct_true
    assert_equal true, @turn.correct?
  end

  def test_method_correct_false
    assert_equal false, @turn2.correct?
  end

  def test_method_feedback_correct
    assert_equal "Correct!", @turn.feedback
  end

  def test_method_feedback_incorrect
    assert_equal "Incorrect.", @turn2.feedback
  end
end
