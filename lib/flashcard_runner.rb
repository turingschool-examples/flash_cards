require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

#create cards
card_1 = Card.new("What is the sum of 5 + 5?", 10, :Math)
card_2 = Card.new("What is the sum of 5 + 10?", 15, :Math)
card_3 = Card.new("Capital of Colorado?", "Denver", :Geography)
card_4 = Card.new("Capital of New York?", "Albany", :Geography)

#store cards in array
cards_1 = [card_1, card_2, card_3, card_4]

#created deck
deck_1 = Deck.new(cards_1)

#Round
round_1 = Round.new(deck_1)

puts "Welcome! You're playing with #{deck_1.count} cards."
40.times { print "-" }
puts ""
puts "This card is number #{round_1.turns.count + 1} out of #{deck_1.count}:"
puts "Question: #{}"
