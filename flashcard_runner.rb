require './lib/card.rb'
require './lib/round.rb'
require './lib/deck.rb'
require './lib/turn.rb'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is Daniel Atkinson's middle name?", "Patrick", :"Personal Info")

deck = Deck.new([card_1, card_2, card_3, card_4])

round = Round.new(deck)

round.start

# require "pry"; binding.pry
