require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'

class DeckTest < MiniTest::Test

  def card_setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
  end

  def test_it_exists
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    assert_equal [@card_1, @card_2, @card_3], deck.cards
  end

  def test_amount_of_cards
    assert_equal 3, deck.count
  end

  def test_card_category
    assert_equal [@card_2, @card_3], deck.cards_in_category(:STEM)
    assert_equal [@card_1], deck.cards_in_category(:Geography)
    assert_equal [], deck.cards_in_category("Pop Culture")
  end
end
