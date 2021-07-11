require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

filename = "cards.txt"
deck = Deck.new(CardGenerator.new(filename).cards)
round = Round.new(deck)
round.start
