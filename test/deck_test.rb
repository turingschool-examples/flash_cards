require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("TheThe Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_cards_exists
    assert_equal @cards, @deck.cards
  end


  def test_deck_count
    assert_equal 3, @deck.count
  end

  def test_deck_cards_in_category_gegraphy
    @cards_in_category_geography = [@card1]
    @cards_in_category_STEM = [@card2, @card3]
    @cards_in_category_pop_culture = []
    @deck.cards_in_category(:STEM)
        assert_equal @cards_in_category_geography, @deck.cards_in_category(:Geography)
        assert_equal @cards_in_category_STEM, @deck.cards_in_category(:STEM)
        assert_equal @cards_in_category_pop_culture, @deck.cards_in_category("Pop Culture")
  end
end
