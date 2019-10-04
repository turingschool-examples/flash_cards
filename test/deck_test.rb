require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
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

end
