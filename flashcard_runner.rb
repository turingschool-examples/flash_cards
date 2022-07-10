require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)

puts round.start
puts card_1.question
user_guess_1 = gets.chomp
turn_1 = round.take_turn(user_guess_1)
puts turn_1.feedback
puts "This is card 2 out of 3"
puts card_2.question
user_guess_2 = gets.chomp
turn_2 = round.take_turn(user_guess_2)
puts turn_2.feedback
puts "This is card 2 out of 3"
puts card_3.question
user_guess_3 = gets.chomp
turn_3 = round.take_turn(user_guess_3)
puts turn_3.feedback
puts "****** Game over! *******" 
results = round.number_correct
results_pct = round.percent_correct
puts "you had #{results} out of 3 for a total score of #{results_pct}%."
pcbc_stem = round.percent_correct_by_category(:STEM)
pcbc_geography = round.percent_correct_by_category(:Geography)

puts "STEM: #{pcbc_stem}% correct"
puts "Geography #{pcbc_geography}% correct"