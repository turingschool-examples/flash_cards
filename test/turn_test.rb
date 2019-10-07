require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_initialize
    assert_instance_of Card, @turn.card
    assert_instance_of Turn, @turn
  end

  def test_for_guess_if_true
    assert_equal "Juneau", @turn.guess
    assert_equal true, @turn.correct?
  end

  def test_for_guess_if_false
    new_turn = Turn.new("Anchorage", @card)
    assert_equal false, new_turn.correct?
  end
end
