require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn.rb'
require './lib/deck.rb'
require 'pry'

class DeckTest < Minitest::Test

  def test_that_deck_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    deck = Deck.new()
  end
end
