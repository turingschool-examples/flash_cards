require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

## Cards! ##

card1 = Card.new("H20 is an abbreviation for what common liquid?", "Water", :STEM)

card2 = Card.new("What is the capital of Mississippi?", "Jackson", :Geography)

card3 = Card.new("Who killed Alexander Hamilton", "Aaron Burr", :History)

card4 = Card.new("Which ocean is the island of Hawaii located in?", "Pacific", :Geography)

cards = [card1, card2, card3, card4]

deck = Deck.new(cards)

round = Round.new(deck)

round.start
