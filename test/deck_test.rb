require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class DeckTest < Minitest::Test


  def test_it_has_cards
    deck = Deck.new(cards)
    
    assert_equal "card", turn.card
  end
