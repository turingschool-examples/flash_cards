require './lib/card'
require './lib/deck'
require './lib/round'

card_1 = Card.new("question 1", "answer", :Geography)
card_2 = Card.new("question 2", "Mars", :STEM)
card_3 = Card.new("question 3", "North north west", :STEM)
card_4 = Card.new("question 4", "North north west", :STEM)

deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

puts "Welcome! You're playing with #{round.deck.count} cards."
puts "This is card number  out of 4."
