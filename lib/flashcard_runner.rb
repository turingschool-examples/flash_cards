require "./lib/round"
require "./lib/deck"
require "./lib/card"
require "./lib/turn"
require 'pry'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_4 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)

round = Round.new(deck)

round.start