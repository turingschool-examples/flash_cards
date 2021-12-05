require 'pry'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)
card_count = 1
#binding.pry
#start the game here

puts "Welcome! You're playiing with #{cards.length} cards "
puts "-" * 50
#game loop
until card_count == cards.length + 1 do
  puts "this is card number #{card_count} out of #{cards.length}"
  puts round.current_card.question
  answer = gets.chomp
  new_turn= round.take_turn(answer)
  puts new_turn.feedback
  card_count += 1
end

#stats
puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{cards.length} for a score of #{round.percent_correct}"
puts "STEM - #{round.percent_correct_by_category(:STEM)}"
puts "Geography - #{round.percent_correct_by_category(:Geography)}"
