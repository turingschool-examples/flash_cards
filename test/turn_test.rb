require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card_1)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_guess
    refute_nil @turn.guess
  end

  def test_card
    assert_equal @card_1, @turn.card
  end

  def test_correct
    assert (@turn.guess == @card_1.answer) == @turn.correct?
  end

  def test_feedback
    assert (@turn.correct? && @turn.feedback == "Correct!") || (!@turn.correct? && @turn.feedback == "Incorrect.")
  end

end
