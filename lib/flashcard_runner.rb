# Require the class files
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# Create some cards (source: http://www.randomtriviagenerator.com)
card_1 = Card.new("Who was the first person to reach the North Pole in 1909?", "Robert Peary", :History)
card_2 = Card.new("What is the name of the strait of water that separates the two main islands of New Zealand?", "Cook Strait", :Geography)
card_3 = Card.new("What was the first nation in the Western Hemisphere with a woman as head of state?", "Argentina", :History)
card_4 = Card.new("What distant planet circles the Sun every 84 years?", "Uranus", :Science)
card_5 = Card.new("What is the only fruit to have its seeds on the outside?", "Strawberry", :Science)
card_6 = Card.new("Which is the largest country in Africa by area?", "Algeria", :Geography)

# Add the cards to an array and initialize a deck
cards = [card_1, card_2, card_3, card_4, card_5, card_6]
deck = Deck.new(cards)

# Start user experience
puts "Welcome! You're playing with #{cards.length} cards."
puts "-" * 50
