require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

def setup
  @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  @turn1 = Turn.new("Juneau", @card)
  @turn2 = Turn.new("Saturn", @card)
end

  def test_it_returns_the_card

    assert_instance_of Card, @card
  end

  def  test_it_returns_a_guess

    assert_equal "Juneau", @turn1.guess
  end

  def test_if_the_guess_matches_the_card

    assert_equal true, @turn1.correct?
    assert_equal false, @turn2.correct?
  end

  def test_it_will_provide_feedback

    assert_equal "Correct!", @turn1.feedback
    assert_equal "Incorrect!", @turn2.feedback
  end

end
