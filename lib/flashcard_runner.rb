require_relative 'card'
require_relative 'turn'
require_relative 'deck'
require_relative 'round'
require_relative 'game'

# cards input
card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "wallaby", :Turing)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

game = Game.new
game.start(round)
game.end_game(round)
