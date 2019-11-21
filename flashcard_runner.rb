#Runs the Flashcard Game
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

generator = CardGenerator.new('cards.txt')
deck = Deck.new(generator.cards)

round = Round.new(deck)

round.start
