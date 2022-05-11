require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("Question: What is 5 + 5?", "10", :STEM)
card_2 = Card.new("Question: What is Rachel's favorite animal?", "panda", :Turing_Staff)
card_3 = Card.new("Question: What is Mike's middle name?", "nobody knows", :Turing_Staff)
card_4 = Card.new("Question: What carboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

round.start
