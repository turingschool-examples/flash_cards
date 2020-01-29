require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_cards_can_be_added_to_the_deck
    deck = Deck.new
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    assert_equal 0, deck.cards.count
    deck.add_card(card_1)
    deck.add_card(card_2)
    deck.add_card(card_3)
    assert_equal 3, deck.cards.count
  end

  def test_cards_in_categories
    deck = Deck.new
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck.add_card(card_1)
    deck.add_card(card_2)
    deck.add_card(card_3)

    cards_in_same_category = deck.cards_in_category(:STEM)
  end

end
