require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/game'
require './lib/card_generator'

# CREATE CARDS FOR GAME
filename = "cards.txt"
cards = CardGenerator.new(filename).cards

# PUT CARDS IN DECK
deck = Deck.new(cards)
round = Round.new(deck)

# START THE GAME
game = Game.new(round)
game.start
