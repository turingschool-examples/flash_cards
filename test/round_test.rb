require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class DeckTest < MiniTest::Test
  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_deck_exists
    assert_instance_of Deck, @deck
  end

  def test_deck_correct
    # require "pry"; binding.pry
    assert_equal @deck, @round.deck
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_turns_correct
    
  end
end
