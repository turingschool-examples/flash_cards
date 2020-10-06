require './card.rb'
require './turn.rb'
card = Card.new("What is the closest planet to the sun?","Mercury",":STEM")
turn = Turn.new("Saturn",card)

require "pry"; binding.pry
