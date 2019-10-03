require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

def setup
  @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  @turn = Turn.new("Juneau", @card)
end

  def test_it_returns_the_card

    assert_instance_of Card, @card
  end

  def  test_it_returns_a_guess

    assert_equal "Juneau", @turn.guess
  end

  def test_if_the_guess_matches_the_card

    assert_equal true, @turn.correct?
  end

  def test_it_will_provide_feedback

    assert_equal "Correct!", @turn.feedback
  end

#Incorrect

  # def test_it_returns_the_card
  #   card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
  #   assert_instance_of Card, card
  # end
  #
  # def  test_it_returns_a_guess
  #   turn = Turn.new("Saturn", card)
  #   assert_equal "Saturn", turn.guess
  # end
  #
  # def test_if_the_guess_matches_the_card
  #
  #   assert_equal false, @turn.correct?
  # end
  #
  # def test_it_will_provide_feedback
  #
  #   assert_equal "Incorrect!", @turn.feedback
  # end


end
