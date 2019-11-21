#Runs the Flashcard Game
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

generator = CardGenerator.new
deck = Deck.new(generator.generate_cards)

round = Round.new(deck)

round.start
