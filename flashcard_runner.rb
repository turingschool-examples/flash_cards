require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card_1 = Card.new("What is 1+4?", 5, :Math)
card_2 = Card.new("What is the last name of the President of the USA?", "Biden", :Politics)
card_3 = Card.new("What hemisphere is Australia in?", "southern", :Geography)
card_4 = Card.new("What is the capital of Georgia?", "Atlanta", :Geography)
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)
feedback_array = []

def start
  puts "Welcome, you're playing with 4 cards."
  puts "-------------------------------------------------"
end

start

puts 'This is card number 1 out of 4.'
puts card_1.question
answer_1 = gets.chomp
round_1 = round.take_turn(answer_1.to_i)
round_1.correct?
feedback_array << round_1.feedback
puts round_1.feedback

puts 'This is card number 2 out of 4.'
puts card_2.question
answer_2 = gets.chomp
round_2 = round.take_turn(answer_2.to_s.capitalize)
round_2.correct?
round_2.guess
feedback_array << round_2.feedback
puts round_2.feedback


puts 'This is card number 3 out of 4.'
puts card_3.question
answer_3 = gets.chomp
round_3 = round.take_turn(answer_3.to_s.downcase)
round_3.correct?
round_3.guess
feedback_array << round_3.feedback
puts round_3.feedback

puts 'This is card number 4 out of 4.'
puts card_4.question
answer_4 = gets.chomp
round_4 = round.take_turn(answer_4.to_s.capitalize)
round_4.correct?
round_4.guess
feedback_array << round_4.feedback
puts round_4.feedback

right = feedback_array.count('Correct!')
percent_right = ((feedback_array.count('Correct!').to_f / 4) * 100).to_i

puts "**** Game over! ****"
puts "You had #{right} correct guesses out of 4 for a total score of #{percent_right}%."
puts "Math - "
puts "Politics - "
puts "Geography - "
