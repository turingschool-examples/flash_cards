require './lib/card_generator'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
filename = 'cards.txt'

cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)
round.start
