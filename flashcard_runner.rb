require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

# Creates object instances
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraftsent back to Earth photographs and reportsabout the surface of which planet?","Mars", :STEM)
card_3 = Card.new("Describe in words theexact direction that is 697.5° clockwisefrom due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)

