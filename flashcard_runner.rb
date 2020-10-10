require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

filename = "cards.txt"
cards = CardGenerator.new(filename).cards
round = Round.new(cards)
round.start
