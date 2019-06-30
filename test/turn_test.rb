require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'


class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_turn_returns_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_turn_returns_card
    assert_equal @card, @turn.card
  end

  def test_guess_is_correct
    assert_equal true, @turn.correct?
  end

  def test_feedback_on_guess
    assert_equal "Correct!", @turn.feedback

    turn_2 = Turn.new("Seattle", @card)
    assert_equal "Incorrect.", turn_2.feedback
  end
end
