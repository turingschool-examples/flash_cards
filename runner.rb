require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is 5 + 5?", "10", :Math)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with 4 cards."

puts '-------------------------------------------------'

puts "This card is number 1 out of 4"
puts "#{round.current_card.question}"
guess = gets.chomp
guess.capitalize!
puts round.take_turn(guess).feedback

puts "This card is number 2 out of 4"

puts "#{round.current_card.question}"
guess = gets.chomp
guess.capitalize!
puts round.take_turn(guess).feedback

puts "This card is number 3 out of 4"

puts "#{round.current_card.question}"
guess = gets.chomp
guess.capitalize!
puts round.take_turn(guess).feedback

puts "This card is number 4 out of 4"

puts "#{round.current_card.question}"
guess = gets.chomp
guess.capitalize!
puts round.take_turn(guess).feedback

puts "****** Game over! ******"

puts "You had #{round.number_correct} correct guesses out of 4 for a total score of #{round.percent_correct}%."
puts "Math - #{round.percent_correct_by_category(:Math)}% correct"
puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
