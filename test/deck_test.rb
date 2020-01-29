require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class Turn_test < Minitest::Test
  def test_deck_exists
    card_denver = Card.new("What is the capital of Colorado","Denver",:Geography)
    card_president = Card.new("Who was the first president of the USA","George Washington",:History)
    card_france = Card.new("On which continent is France is located","Europe",:Geography)
    cards_for_deck = [card_denver,card_france,card_president]
    deck = Deck.new(cards_for_deck)
    assert_instance_of Deck, deck
  end
end
