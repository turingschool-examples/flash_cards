require './lib/card'
require './lib/turn'
require 'pry'

#card = Card.new("What is the capital of Alaska?", "Juno", :Geography)
card_1 = Card.new("What is the capital of Alaska?", "Juno", :Geography)
card_2 = Card.new([],[],[])

card_2.question = "What is the capital of Ohio?"
card_2.answer = "Columbus"
card_2.category = :Geography


binding.pry
