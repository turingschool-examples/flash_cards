# Richard Tillies
# October 12, 2021
# Card class
# ~/turing/1module/projects/lib/runner.rb

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
#
# turn_1 = Turn.new("Juneau", card_1)
# turn_2 = Turn.new("Saturn", card_2)

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)

round.take_turn("Juneau")
round.take_turn("Venus")
puts round.number_correct_by_category(:Geography)
puts round.number_correct_by_category(:STEM)
puts round.percent_correct
puts round.percent_correct_by_category(:Geography)


require "pry"; binding.pry
