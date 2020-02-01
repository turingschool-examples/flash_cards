require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card4 = Card.new("Which famous figure was born November 15, 2015?", "Ripley", :Celebrities)
cards = [card1, card2, card3, card4]

deck = Deck.new(cards)
round = Round.new(deck)
round.start
