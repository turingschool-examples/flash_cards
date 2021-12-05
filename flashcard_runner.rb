require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

cards = Cards.new 
deck = Deck.new(cards)
round = Round.new(deck)
round.start
