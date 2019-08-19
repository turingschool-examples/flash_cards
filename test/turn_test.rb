require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def setup
    @card2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_it_has_a_card
    assert_equal @card2, @turn.card
  end

  def test_it_is_correct
    assert_equal true, @turn.correct?
    assert_equal "Correct!", @turn.feedback
  end

  def test_it_is_incorrect
    wrong_turn = Turn.new("Anchorage", @card2)

    assert_equal false, wrong_turn.correct?
    assert_equal "Incorrect!", wrong_turn.feedback
  end
end
