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

total_card_count = deck.count
card_number = 0

puts "Welcome! You're playing with #{total_card_count} cards.
-------------------------------------------------"
until card_number == total_card_count
  puts "This is card number #{card_number + 1} out of #{total_card_count}.\n Question: #{deck.cards[card_number].question}"
  guess = gets
  if guess.chomp == round.deck.cards[card_number].answer
    puts "Correct!"
  else
    puts "Incorrect."
  end
  round.take_turn(guess.chomp)
  card_number += 1
end

puts "****** Game over! ******
You had #{round.number_correct} correct guesses out of #{total_card_count} for a total score of #{round.percent_correct}%.
STEM - 100% correct
Turing Staff - 50% correct
Pop Culture - 100% correct"
