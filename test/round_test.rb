require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def test_round_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("Music is composed of what?", "Notes", :STEM)
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_take_turn
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("Music is composed of what?", "Notes", :STEM)
    cards = [card_1, card_2]
    deck = Deck.new(cards)
    round = Round.new(deck)

    take_turn


end
