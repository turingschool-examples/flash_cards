require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'


class DeckTest < Minitest::Test
  def test_does_deck_exit
    card = Card.new("What is the capital of Italy?", "Rome", :Geography)
    turn = Turn.new("Rome", card)
    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_count

end
