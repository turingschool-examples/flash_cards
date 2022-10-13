require './lib/card'

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
puts "The first card question is #{card.question}"