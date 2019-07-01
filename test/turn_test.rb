
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
class TurnTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_turn_exists

    assert_instance_of Turn, @turn
  end

  def test_turn_has_a_card


  assert_equal @card, @turn.card
end

def test_has_guess


  assert_equal "Juneau", @turn.guess
end

def test_is_correct

  assert_equal true, @turn.correct?
end

def test_feedback

  assert_equal "Correct!", @turn.feedback

  turn_2 = Turn.new("Wrong Guess.", @card)
  assert_equal "Incorrect.", turn_2.feedback
end

end#end class
