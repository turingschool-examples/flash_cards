require './lib/card'
require './lib/turn'
require './lib/deck'

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau", card)

require "pry"
binding.pry
