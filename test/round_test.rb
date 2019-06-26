require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class RoundTest < Minitest::Test
  def test_does_round_exist
    card_1 = Card.new("What is the capital of Italy?", "Rome", :Geography)
    card_2 = Card.new("What is the capital of England?", "London", :Geography)
    card_3 = Card.new("What is Japan's form of currency?", "Yen", :Finance)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_instance_of Round, round
  end
end 
