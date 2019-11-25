require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require "pry"

class TurnTest < Minitest::Test


  def test_if_has_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end


  def test_if_card_is_returned
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "Juneau", "What is the capital of Alaska?"
  end






    # guess - This method returns the guess
    # card - This method returns the Card
    # correct? - This method returns a boolean indicating if the guess matched
    # the answer on the Card.
    # feedback - This method either returns "Correct!" or "Incorrect." based on
    # whether the guess was correct or not.
end
