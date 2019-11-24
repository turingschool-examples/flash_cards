require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/deck'

class DeckTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    assert_instance_of Card, card_1
    assert_instance_of Card, card_2
    assert_instance_of Card, card_3
  end

  def test_it_has_cards
    cards = [card_1, card_2, card_3]

    assert_equal Deck, cards
  end

  def test_it_hasa_deck
    skip
    deck = Deck.new(cards)
  end

end

# deck.count
# deck.cards_in_category(:STEM)
# deck.cards_in_category(:Geography)
# deck.cards_in_category("Pop Culture")
