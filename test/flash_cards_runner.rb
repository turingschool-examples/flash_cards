require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("What is my name?", "David", :Personal)
card3 = Card.new("What is 30 * 30", "900", :Math)
card4 = Card.new("What is the mile high city", "Denver", :Geography)

cards = [card1, card2, card3, card4]

deck1 = Deck.new(cards)
round1 = Round.new(deck1)
