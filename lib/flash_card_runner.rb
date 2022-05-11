require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("How many licks does it take to get to the center of a tootsy pop?", "1337", "Pop Culture")
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

display_msg = "Welcome! You're playing with #{deck.count} cards."
line_break = "-------------------------------------------------"
puts display_msg
puts line_break





require "pry"; binding.pry
