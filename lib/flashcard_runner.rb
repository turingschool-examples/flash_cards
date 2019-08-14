# Require the class files
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

# Use CardGenerator class to load in cards from text file
# Trivia questions are sourced from http://www.randomtriviagenerator.com
filename = "lib/cards.txt"
cards = CardGenerator.new(filename).cards

# Initialize a deck and round with the generated cards
deck = Deck.new(cards)
round = Round.new(deck)

# Start user experience in command line
round.start
