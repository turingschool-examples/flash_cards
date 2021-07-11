require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/game'
require './lib/card_generator'


generator = CardGenerator.new("cards.txt")
deck = Deck.new(generator.cards)
round = Round.new(deck)
fcr = Game.new(round)
fcr.start
