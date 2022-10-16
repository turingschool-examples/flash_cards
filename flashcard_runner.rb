require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/game'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "Giraffe", :TuringStaff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :TuringStaff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :PopCulture)
deck = Deck.new([card_1, card_2, card_3, card_4])
# deck = Deck.new([])
round = Round.new(deck)
game = Game.new(round)

game.start

