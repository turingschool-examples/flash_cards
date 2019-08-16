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

  def test_if_it_has_cards
    # assert_equal expected, actual
    assert_equal @cards, @deck.cards
  end

  def test_how_many_cards
    assert_equal 3, @deck.count
  end

  def test_cards_in_category_STEM
    assert_equal [@card_2, @card_3], @deck.cards_in_category(:STEM)
  end

  def test_cards_in_category_Geopgraphy
    assert_equal [@card_1], @deck.cards_in_category(:Geography)
  end

  def test_cards_in_category_Pop_Culture
    assert_equal [], @deck.cards_in_category("Pop Culture")
  end
end
