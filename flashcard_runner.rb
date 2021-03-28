require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/game'
require './lib/card_generator'

card_1 = Card.new("What is 5 + 5?", "10", "STEM")
card_2 = Card.new("What is Rachel's favorite animal?", "red panda", "Turing Staff")
card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
deck = Deck.new([card_1, card_2, card_3, card_4])
# cards = CardGenerator.new("cards.txt").cards
# deck = Deck.new(cards)
round = Round.new(deck)
game = Game.new(round)

game.start
