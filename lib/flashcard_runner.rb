require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card1 = Card.new("What is the capitol of CO?", "Denver", :Geography)
card2 = Card.new("What is 2+2?", "4", :Math)
card3 = Card.new("What continent is CO in?", "North America", :Geography)
card4 = Card.new("Red or green?", "Christmas", :Culture)
card5 = Card.new("What is 7*5?", "35", :Math)
card6 = Card.new("What state is directly below CO?", "NM", :Geography)
card7 = Card.new("What is 10*4?", "40", :Math)
card8 = Card.new("What is love?", "Baby don't hurt me", :Culture)

cards = [card1, card2, card3, card4, card5, card6, card7, card8]
deck1 = Deck.new(cards)
round1 = Round.new(deck1)
