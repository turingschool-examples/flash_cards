require './turn'
require './card'
require './deck'
require './round'

card1 = Card.new("What is 5 + 5?", "10", :STEM)
card2 = Card.new("What is Rachel's favorite animal?", "panda", :Pop_Culture)
card3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
card4 = Card.new("What cardboard cutout lives at Turing?", "justin bieber", :Pop_Culture)

cards = [card1, card2, card3, card4]
deck = Deck.new(cards)
round = Round.new(deck)


round.start

