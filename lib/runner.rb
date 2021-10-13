# Richard Tillies
# October 12, 2021
# Card class
# ~/turing/1module/projects/lib/runner.rb

require './card'
require './turn'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

turn_1 = Turn.new("Juneau", card_1)
turn_2 = Turn.new("Saturn", card_2)

require "pry"; binding.pry
