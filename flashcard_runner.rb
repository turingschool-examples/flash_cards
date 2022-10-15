require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

#The four cards for the game

card_1 = Card.new("How much wood would a woodchuck chuck if a woodchuck could chuck wood?", "A woodchuck would chuck as much wood as a woodchuck could chuck if a woodchuck could chuck wood", :tongue_twister)

card_2 = Card.new("How many states border Colorado?", 7, :US_States)

card_3 = Card.new("Which state was the 37th to join the union?","Nebraska", :US_States)

card_4 = Card.new("Who sells sea shells by the seashore?", "She", :tongue_twister)

#The cards get added to deck_1

cards_1 = []
cards_1.push card_1, card_2, card_3

deck_1 = Deck.new(cards_1)

#Setting a new round with the deck made

round_1 = Round.new(deck_1)