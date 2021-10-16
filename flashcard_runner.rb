require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card_1 = Card.new("What is the capital of Illinois?", "Springfield", :Geography)
card_2 = Card.new("What is the fourth planet from the sun?", "Mars", :STEM)
card_3 = Card.new("What is the closest star to our solar system?", "Proxima Centauri", :STEM)
card_4 = Card.new("What famous artist hired John Legend to play piano on one of their tracks while he was still in college?", "Lauryn Hill", "Pop Culture")
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

round.start
