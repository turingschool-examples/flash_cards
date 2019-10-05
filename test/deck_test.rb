require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test

  def test_it_exists
    skip
    deck = Deck.new(cards)

    assert_instance_of Deck, card
  end

  def test_it_has_cards
    skip
    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_it_has_card_1
    skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_instance_of card_1, deck.card_
  end

end
