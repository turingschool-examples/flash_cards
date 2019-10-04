require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_initialize
    assert_instance_of Round, @round
  end

  def test_turns
    assert_equal [], @round.turns
  end

  def test_current_card
    assert_equal "What is the capital of Alaska?", "Juneau", :Geography, @card_1
  end

  def test_take_turn
    assert_equal guess, gets.chomp

    # takes a string representing guess
    # creates new Turn object with appropriate guess and Card
    # stores new Turn object
    # returns this new Turn object
    # should tell Round to move on to next Card object
  end

  def test_number_correct
    # tells number of turns that are correct (.length? on turns? part of turns that is correct, two arrays?)
  end

  def test_number_correct_by_category()
    # tells number of Turns correct, by category
    # look at arrays built elsewhere, and Deck class's cards_in_category method
  end

  def test_total_percent_correct
    # number correct divided by total, multiply by 100
    # format returned message
  end

  def test_percent_correct_by_category
    # number correct by categoy, multiply by 100
    # format returned message
  end



end
