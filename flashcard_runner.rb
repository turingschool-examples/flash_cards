# Load the necessary classes
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

# Step 1: Generate cards from the text file
filename = 'cards.txt'
cards = CardGenerator.new(filename).cards

# Step 2: Create a Deck with the generated cards
deck = Deck.new(cards)

# Step 3: Create a new Round using the Deck
round = Round.new(deck)

# Step 4: Start the game
round.start
