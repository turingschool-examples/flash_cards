require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require '.lib/deck'


class DeckTest < Minitest::Test
  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    deck = Deck.new(cards)


    assert_instance_of Deck, deck
  end


  
