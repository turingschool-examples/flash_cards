require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("How many states are in the US", 51, :Geography)
    @turn = Turn.new(50, @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_guess
    assert_equal 50, @turn.guess
  end

  def test_it_has_card_obj
    assert_equal @card, @turn.card
  end

  def test_correct
    assert_equal false, @turn.correct?
  end

  def test_feedback_incorrect
    assert_equal "Incorrect", @turn.feedback
  end

  def test_feedback_correct
    @card_correct = Card.new("Is pluto a planet", "Yes", :STEM)
    @turn_correct = Turn.new("Yes", @card_correct)

    assert_equal "Correct", @turn_correct.feedback
  end

end
