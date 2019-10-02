require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require "pry"

class DeckTest < Minitest::Test

  def test_deck_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("What has a positive charge in an atom?", "Proton", :STEM)
    card_3 = Card.new("What is the square root of 144", 12, :STEM)
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end
end
