require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/game_start'
require './lib/card_generator'

filename = "cards.txt"
cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
flashcard_generator = Start.new(deck)

flashcard_generator.start