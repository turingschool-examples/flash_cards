require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  attr_reader :deck, :card1, :card2, :card3, :card4, :card5

  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("Who was the first woman to win a Noble Prize?", "Marie Curie", :STEM)
    @card3 = Card.new("What style of art is characterized by its distinct use of dots to form images?", "Pointillism", :Art)
    @card4 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @card5 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    cards = [@card1, @card2, @card3, @card4, @card5]
    @deck = Deck.new(cards)
  end

  def test_cards_exist_in_deck
    assert_instance_of Card, @card1
    assert_instance_of Card, @card2
    assert_instance_of Card, @card3
    assert_instance_of Card, @card4
    assert_instance_of Card, @card5
  end

  def test_deck_exists
    assert_instance_of Deck, @deck
  end

  def test_card_count
    assert_equal 5, deck.count
  end

  def test_cards_in_category
    assert_equal :Geography, @card1.category
    assert_equal :STEM, @card2.category
    assert_equal :Art, @card3.category
    assert_equal :STEM, @card4.category
    assert_equal :STEM, @card5.category
  end
end
