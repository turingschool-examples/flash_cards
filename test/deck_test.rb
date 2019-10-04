require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_initialize
    assert_instance_of Deck, @deck
  end
  #Good practice to put assert_instance_of in setup, or in a test_initialize method?

  def test_cards_in_deck
    assert_equal [@card_1, @card_2, @card_3], @deck.cards
  end

  def test_number_of_cards_in_deck
    assert_equal 3, @deck.count
  end

  def test_cards_in_correct_category
    stem_cat = [@card_2, @card_3]
    geo_cat = [@card_1]
    pop_cat = []

    assert_equal stem_cat, @deck.cards_in_category(:STEM)
    assert_equal geo_cat, @deck.cards_in_category(:Geography)
    assert_equal pop_cat, @deck.cards_in_category("Pop Culture")
  end


end
