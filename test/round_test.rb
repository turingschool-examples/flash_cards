require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < MiniTest::Test
  def test_it_exists
    card_1 = Card.new("What is a name that associates with a particular object?", "Variable", :Vocabulary)
    card_2 = Card.new("Behavior an object can do is a?", "Method", :Vocabulary)
    card_3 = Card.new("What is an ordered, integer-indexed collection of any object?", "Array", :Vocabulary)
    card_4 = Card.new("What is my sons Favorite Movie?", "Iron Giant", :Trivia)
    deck = Deck.new([card_1, card_2, card_3, card_4])
    round = Round.new(deck)
    new_turn = round.take_turn("VARIABLE")
    round.next_card
    new_turn = round.take_turn("WrongMethod")
    round.next_card
    new_turn = round.take_turn("ARRAY")
    round.next_card
    new_turn = round.take_turn("IRON")
    round.next_card
    assert_instance_of Round, round
  end
end
