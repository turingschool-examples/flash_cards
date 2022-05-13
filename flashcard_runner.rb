require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

## hardcoded cards
# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#
# deck = Deck.new([card_1, card_2, card_3])
# round = Round.new(deck)

# use cards.txt for the flashcards.
filename = "cards.txt"
generator = CardGenerator.new(filename)
deck = Deck.new(generator.cards)
round = Round.new(deck)

round.start
