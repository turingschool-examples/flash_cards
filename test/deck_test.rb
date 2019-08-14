require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  end

  def test_deck_has_cards
    cards = [@card_1, @card_2, @card_3]
    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_deck_has_3_cards
    cards = [@card_1, @card_2, @card_3]
    deck = Deck.new(cards)

    assert_equal 3, deck.count
  end

  def test_it_has_two_stem_cards
    cards = [@card_1, @card_2, @card_3]
    deck = Deck.new(cards)

    assert_equal [@card_2, @card_3], deck.cards_in_category(:STEM)
  end

  def test_it_has_one_geography_card
    cards = [@card_1, @card_2, @card_3]
    deck = Deck.new(cards)

    assert_equal [@card_1], deck.cards_in_category(:Geography)
  end

  def test_it_has_no_pop_culture_cards
    cards = [@card_1, @card_2, @card_3]
    deck = Deck.new(cards)

    assert_equal [], deck.cards_in_category("Pop Culture")
  end
end
