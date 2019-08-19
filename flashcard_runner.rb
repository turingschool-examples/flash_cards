require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# create some Cards
card_1 = Card.new("What is the official nickname of Texas?", "Lone Star State", :Geography)
card_2 = Card.new("In which country was the Caesar salad invented?", "Mexico", :Geography)
card_3 = Card.new("How long did the 100 years war last?", "116", :History)
card_4 = Card.new("What kind of animal is the horned toad?", "Lizard", :Nature)
card_5 = Card.new("What is the main ingredient of Bombay Duck?", "Fish", :Food)
# place Cards into a Deck
deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
# create a new Round with the newly created Deck
round = Round.new(deck)

round.start
