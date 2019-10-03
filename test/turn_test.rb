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

  def test_if_guess_is_correct
    assert_equal true, @turn.correct?
  end

  def test_if_guess_is_incorrect
    assert_equal false, @turn2.correct?
  end

  def test_feedback
    assert_equal "Correct!", @turn.feedback
    assert_equal "Incorrect!", @turn2.feedback
  end
end
