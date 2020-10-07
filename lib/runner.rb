require '.card'
require '.turn'

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

turn = Turn.new("juneau", card)
