require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

filename = "./cards.txt"
generated_cards = CardGenerator.new(filename)
deck = Deck.new(generated_cards.cards)
round = Round.new(deck)

round.start
