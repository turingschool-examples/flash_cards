require './card'

require './turn'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

turn = Turn.new("Juneau", card_1)

require 'pry'; binding.pry