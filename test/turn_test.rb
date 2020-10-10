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

  def test_attributes
    assert_equal "Juneau", @turn.guess
    assert_equal @card, @turn.card
  end

  def test_correct?
    assert_equal true, @turn.correct?

    turn = Turn.new("Anchorage", @card)

    assert_equal false, turn.correct?
  end

  def test_feedback
    assert_equal "Correct!", @turn.feedback

    turn = Turn.new("Fairbanks", @card)

    assert_equal "Incorrect.", turn.feedback
  end
end
