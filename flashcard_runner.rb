require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'


#The four cards for the game

card_1 = Card.new("How much wood would a woodchuck chuck if a woodchuck could chuck wood?", 
    "A woodchuck would chuck as much wood as a woodchuck could chuck if a woodchuck could chuck wood", :tongue_twister, 1)

card_2 = Card.new("How many states border Colorado?", "7", :US_States, 2)

card_3 = Card.new("Which state was the 37th to join the union?","Nebraska", :US_States, 3)

card_4 = Card.new("Who sells sea shells by the seashore?", "She", :tongue_twister, 4)

#The cards get added to deck_1

cards_1 = []
cards_1.push card_1, card_2, card_3, card_4

deck_1 = Deck.new(cards_1)

#Setting a new round with the deck made

round_1 = Round.new(deck_1)

#Taking the first turn

round_1.start

user_feedback_1 = round_1.turns[0].feedback

puts ""

puts user_feedback_1

puts ""

#Taking turn 2

round_1.turn_2
require 'pry'; binding.pry
user_feedback_2 = round_1.turns[1].feedback

puts ""

puts user_feedback_2

puts ""