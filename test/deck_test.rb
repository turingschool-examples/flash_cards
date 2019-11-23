require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'

class DeckTest < MiniTest::Test
  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_cards_exist
    assert_instance_of Deck, @deck
  end

  def test_cards_method_works
    assert_equal @cards, @deck.cards
  end

  def test_if_count_works
    assert_equal @cards.length, @deck.count
  end

  def test_cards_in_category
    assert_equal [@card2, @card3], @deck.cards_in_category(:STEM)
  # require "pry"; binding.pry
end
