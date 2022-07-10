require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

card_1 = Card.new("In what year was the first Tour de France raced?", "1903", :History)
card_2 = Card.new("What is the color of the Maillot Jaune, or, leaders jersey?", "Yellow", :Culture)
card_3 = Card.new("Who is the rider with the most all time Tour de France wins?", "Eddy Merckx", :History)
card_4 = Card.new("What does the polka dot jersery represent in the Tour de France", "King of the Mountains", :Culture)
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

#Command-Line_Interface  
#Round 1
puts round.start
puts card_1.question
user_guess_1 = gets.chomp
turn_1 = round.take_turn(user_guess_1)
puts turn_1.feedback
#Round 2
puts "This is card 2 out of 4"
puts card_2.question
user_guess_2 = gets.chomp
turn_2 = round.take_turn(user_guess_2)
puts turn_2.feedback
#Round 3
puts "This is card 3 out of 4"
puts card_3.question
user_guess_3 = gets.chomp
turn_3 = round.take_turn(user_guess_3)
puts turn_3.feedback
#Round 4
puts "This is the last card"
puts card_4.question
user_guess_4 = gets.chomp 
turn_4 = round.take_turn(user_guess_4)
puts turn_4.feedback

puts "****** Game over! *******" 
results = round.number_correct
results_pct = round.percent_correct
puts "You had #{results} correct guesses out of 4 for a total score of #{results_pct}%."
pcbc_history = round.percent_correct_by_category(:History)
pcbc_culture = round.percent_correct_by_category(:Culture)
puts "History: #{pcbc_history}% correct"
puts "Culture: #{pcbc_culture}% correct"