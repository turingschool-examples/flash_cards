require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

filename = "cards.txt"
cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)


round.start

