require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
    @turn_wrong = Turn.new("Anchorage", @card)
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

  def test_it_is_correct
    assert_equal false, @turn_wrong.correct?
  end
  def test_feedback
    assert_equal "Incorrect.", @turn_wrong.feedback
  end 
end
