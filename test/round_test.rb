require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @cards = [
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography),
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM),
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
             ]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end


  def test_if_there_is_a_round

    assert_instance_of Round, @round
  end


  def test_if_round_is_initialized_with_deck
    round = Round.new(@deck)
    assert_equal 3, round.deck.count
  end


  def test_if_round_has_an_array_of_turns
skip
    assert_equal
  end

  def test_if_
skip
  end

end
