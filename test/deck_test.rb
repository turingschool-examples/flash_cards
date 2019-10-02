require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/turn'

class DeckTest < MiniTest::Test

  def test_it_exists
    deck = Deck.new(@cards)
    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    deck = Deck.new(@cards)
    refute deck.cards
  end
end
