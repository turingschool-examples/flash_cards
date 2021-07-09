require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

card_1 = Card.new("In Harry Potter, what class does Professor McGonagall teach?", "Transfiguration", "Harry Potter")
card_2 = Card.new("What is the name of Harry Potter's pet owl?", "Hedwig", "Harry Potter")
card_3 = Card.new("On Schitt's Creek, what kind of disgruntled animal does David act like?", "Pelican", "Schitt's Creek")
card_4 = Card.new("What is Leslie Knope's favorite food?", "Waffles", "Parks & Rec")
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)
round.start
