require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

card_1 = Card.new("Who is the best basketball player ever?", "Michael Jordan", :Sports)
card_2 = Card.new("What team did Michael Jordan play for?", "Chicago Bulls", :Sports)
card_3 = Card.new("What year did World War II end?", "1945", :History)
card_4 = Card.new("How many degrees are in a triangle?", "180", :Math)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.cards.count} cards."
puts "-"* 50

round.start
