require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'

card_1 = Card.new("What is Brian's favorite sport?", "Football", :Brian)
card_2 = Card.new("What is the capital city of Colorado?", "Denver", :Geography)
card_3 = Card.new("What is 3 + 3?", "6", :Math)
card_4 = Card.mew("What is Brian's favorite food?", "Chicken parmesan", :Brian)
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

opening_message = "Welcome! You're playing with #{deck.count} cards."
puts opening_message

