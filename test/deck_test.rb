require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test

  # setup method
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards, false, 3)
    @deck.finalize_deck
  end

  def test_deck_exists
    assert_instance_of Deck, @deck
  end

  def test_deck_cards
    assert_equal @cards, @deck.deck_final
  end

  def test_deck_count
    assert_equal 3, @deck.count
  end

  def test_cards_category_STEM
    assert_equal [@card_2, @card_3], @deck.cards_in_category(:STEM)
  end

  def test_cards_category_Geography
    assert_equal [@card_1], @deck.cards_in_category(:Geography)
  end

  def test_cards_category_Pop_Culture
    assert_equal [], @deck.cards_in_category(:PopCulture)
  end

end
