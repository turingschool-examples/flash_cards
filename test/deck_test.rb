require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    card1 = Card.new("What is real?", "You are.", :Philosophy)
    card2 = Card.new("What is 2+2?", "4", :Math)
    card3 = Card.new("How great is Turing so far?", "Wonderful!", :Turing)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    assert_instance_of Deck, deck
  end
end
