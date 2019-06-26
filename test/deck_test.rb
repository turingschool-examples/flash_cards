require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test

  def test_cards_exist
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?","Mars",:STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North north west",:STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_deck_count
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?","Mars",:STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North north west",:STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    
  end
end
