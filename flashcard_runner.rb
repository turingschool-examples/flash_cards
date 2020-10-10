require './lib/deck'
require './lib/round'
require './lib/card_generator'

card_gen = CardGenerator.new("./lib/cards.txt").cards
deck = Deck.new(card_gen)
round = Round.new(deck)
round.start