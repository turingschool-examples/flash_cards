require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

## hardcoded cards
# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
#
# deck = Deck.new([card_1, card_2, card_3])
# round = Round.new(deck)

# total_card_count = deck.count
card_number = 0

puts "Welcome! You're playing with #{deck.count} cards.
-------------------------------------------------"
until card_number == deck.count
  puts "This is card number #{card_number + 1} out of #{deck.count}.\n Question: #{deck.cards[0].question}"
  guess = gets
  if guess.strip == round.deck.cards[0].answer
    puts "Correct!"
  else
    puts "Incorrect."
  end
  round.take_turn(guess.strip)
  card_number += 1
end

puts "****** Game over! ******
You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.round}%.
Geography - #{round.percent_correct_by_category(:Geography).round}% correct
STEM - #{round.percent_correct_by_category(:STEM).round}% correct"
