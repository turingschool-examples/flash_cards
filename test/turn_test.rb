require 'minitest/autorun'
require 'minitest/pride'
require './lib/card2'
require './lib/turn2'


class Card2Test < Minitest::Test

  def setup
    @card =  Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists
    @card
    @turn
    assert_instance_of Turn, @turn
    assert_instance_of Card, @card
  end

  def test_if_turn_is_card
    @card
    @turn
    assert_equal @card, @turn.card
end

def test_if_turn_is_card
  @card
  @turn
  assert_equal "Juneau", @turn.guess
end

def test_if_true
  @card
  @turn
  assert_equal true, @turn.correct?
end

def test_if_feedback
  @card
  @turn
  assert_equal "correct", @turn.feedback

end
end
