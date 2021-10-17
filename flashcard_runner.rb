require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator.rb'


# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
#
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#
cards = CardGenerator.new("./cards.txt")
deck = Deck.new(cards.cards_generator_array)
round = Round.new(deck)
p deck

round.start
