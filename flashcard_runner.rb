require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the term used for the perimeter of a circle?", "Circumference", :Math)
card_2 = Card.new("What society invented the use of negative numbers?", "Chinese", :Math)
card_3 = Card.new("What is the name of the number system that has a base of two?", "Binary", :Math)
card_4 = Card.new("Which town was Leonardo da Vinci born in?", "Vinci", :Art)
card_5 = Card.new("What nationality was Picasso?", "Spanish", :Art)
card_6 = Card.new("What is stored in a camel's hump?", "Fat", :Animals)
card_7 = Card.new("What color is a giraffe's tounge?", "Blue", :Animals)
card_8 = Card.new("Which is the world's largest lizard?", "Komodo Dragon", :Animals)

cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8]
deck = Deck.new(cards)
round = Round.new(deck)

round.start
