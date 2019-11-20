require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)

  end

  def test_card_exists
    assert_instance_of Card, @card
  end

  def test_turn_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_card
    assert_instance_of Card, @card
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_correct?
    assert_equal true, @turn.correct?
  end

  def test_feedback
    assert_equal "Correct!", @turn.feedback
  end
end
