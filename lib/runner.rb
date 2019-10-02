require './lib/card'
require './lib/turn'
require 'pry'

#card = Card.new("What is the capital of Alaska?", "Juno", :Geography)
card = Card.new("What is the capital of Alaska?", "Juno", :Geography)
turn = Turn.new("Columbus", card)


binding.pry
