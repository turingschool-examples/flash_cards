require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < MiniTest::Test
  def test_it_exists
    card_1 = Card.new("What is a name that associates with a particular object?", "VARIABLE", :Vocabulary)
    card_2 = Card.new("Behavior an object can do is a?", "METHOD", :Vocabulary)
    card_3 = Card.new("What is an ordered, integer-indexed collection of any object?", "ARRAY", :Vocabulary)
    card_4 = Card.new("What is my sons Favorite Movie?", "IRON GIANT", :Trivia)
    deck = Deck.new([card_1, card_2, card_3, card_4])
    round = Round.new(deck)
    turn_1 = round.take_turn("VARIABLE", card_1)
    turn_2 = round.take_turn("WrongMethod", card_2)
    turn_3 = round.take_turn("ARRAY", card_3)
    turn_4 = round.take_turn("IRON", card_4)

    assert_instance_of Round, round
  end
end
