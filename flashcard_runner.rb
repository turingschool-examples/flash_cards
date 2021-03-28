require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/cardgenerator'
require 'pry'

# Provides user with sweet ASCII art
puts ' _____ _  _ ___    ___   _   __  __ ___'
puts '|_   _| || | __|  / __| /_\ |  \/  | __|'
puts '  | | | __ | _|  | (_ |/ _ \| |\/| | _|'
puts '  |_| |_||_|___|  \___/_/ \_\_|  |_|___|'
puts '~Flashcard-based Game of Wit and Wonder~'

# Instantiating objects in play
generate = CardGenerator.new('cards.txt')
deck = Deck.new(generate.cards)
round = Round.new(deck)

# The method below starts the game
# and contains the logic of how the game progresses
round.start

puts "Thanks for playing! 🤘"
