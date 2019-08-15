require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_it_has_a_card
    assert_equal @card, @turn.card
  end

  def test_guess_is_correct?
    # Correct result from setup
    assert @turn.correct?

    # Same card, wrong guess
    @turn = Turn.new("Denver", @card)
    refute @turn.correct?
  end

  def test_feedback
    # Correct result from setup
    assert_equal "Correct!", @turn.feedback

    # Same card, wrong guess
    @turn = Turn.new("Denver", @card)
    assert_equal "Incorrect.", @turn.feedback
  end
end
