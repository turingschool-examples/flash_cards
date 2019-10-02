require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'


#creating cards
card_1 = Card.new("What is the sum of 5 + 5?", 10, :Math)
card_2 = Card.new("What is the sum of 5 + 10?", 15, :Math)
card_3 = Card.new("Capital of Colorado?", "Denver", :Geography)
#storing cards in array
cards_1 = [card_1, card_2, card_3]

#creating deck..
deck_1 = Deck.new(cards_1)
deck_1.cards
deck_1.count
deck_1.cards_in_category(:Math)

#creating turns...
turn_1 = Turn.new(11, card_1)
turn_2 = Turn.new(15, card_2)

#Round...
round_1 = Round.new(deck_1)
puts round_1.deck

#binding.pry
