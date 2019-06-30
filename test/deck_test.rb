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

  def test_it_exists
    assert_instance_of Deck, @deck
  end

  def test_cards_method
    assert_equal @cards, @deck.cards
  end

  def test_deck_count
    assert_equal 3, @deck.count
  end

  def test_cards_in_category
    actual_cards = @deck.cards_in_category(:STEM)
    expected_cards = [@card_2, @card_3]
    assert_equal expected_cards, actual_cards
    actual_cards_2 = @deck.cards_in_category(:Geography)
    expected_cards_2 = [@card_1]
    assert_equal expected_cards_2, actual_cards_2
    actual_cards_3 = @deck.cards_in_category("Pop Culture")
    assert_equal [], actual_cards_3
  end
end
