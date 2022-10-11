require './lib/card'
require './lib/turn'

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau", card)

require "pry"; binding.pry
