require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "pry" # binding.pry

class DeckTest < Minitest::Test

  def test_it_exists
    deck = Deck.new()

    assert_instance_of Deck, deck
  end
end
