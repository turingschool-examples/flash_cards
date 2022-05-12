require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)

total_card_count = deck.cards.count
card_number = 0

puts "Welcome! You're playing with #{total_card_count} cards.
-------------------------------------------------
This is card number #{card_number + 1} out of #{total_card_count}.
Question: #{round.deck.cards[card_number].question}"

answer = gets

if answer.chomp == round.deck.cards[card_number].answer
  puts "Correct!"
else
  puts "Incorrect."
end
