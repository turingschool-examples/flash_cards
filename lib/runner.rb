require './card.rb'
require './turn.rb'

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)


turn = Turn.new("Juneau", card)
turn2 = Turn.new("Saturn", card)
