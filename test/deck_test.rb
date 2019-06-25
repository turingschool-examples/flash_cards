require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_deck_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("Music is composed of what?", "Notes", :STEM)
    cards = [card_1, card_2]
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_cards_in_category
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("Music is composed of what?", "Notes", :STEM)
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    deck.cards_in_category(:STEM)

    assert_equal [card_2], deck.cards_in_category(:STEM)
  end

  def test_deck_card_count
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("Music is composed of what?", "Notes", :STEM)
  cards = [card_1, card_2]
  deck = Deck.new(cards)
  deck.count

  assert_equal 2, deck.count
  end

end
