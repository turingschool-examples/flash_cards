require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

filename = './lib/cards.txt'
cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)
feedback_array = []
stem_array = []
turing_staff = []
pop_culture_array = []
number_of_cards = deck.count
index = 0

# while index < number_of_cards
  # puts cards[0].question
  # answer = gets.chomp
  # round = round.take_turn(answer.to_s)
  # round.correct?
  # feedback_array << round.feedback
  # math_array << card[index].category
  # puts round.feedback
# end

def start(card_number)
  puts "Welcome, you're playing with #{card_number} cards."
  puts "----------------------------------------------------"
end

start(number_of_cards)

puts "This is card number 1 out of #{number_of_cards}."
puts cards[0].question
answer_1 = gets.chomp
round_1 = round.take_turn(answer_1.to_s.capitalize)
round_1.correct?
round_1.guess
feedback_array << round_1.feedback
stem_array << round_1.feedback
puts round_1.feedback

puts "This is card number 2 out of #{number_of_cards}."
puts cards[1].question
answer_2 = gets.chomp
round_2 = round.take_turn(answer_2.to_s.downcase)
round_2.correct?
round_2.guess
feedback_array << round_2.feedback
turing_staff << round_2.feedback
puts round_2.feedback


puts "This is card number 3 out of #{number_of_cards}."
puts cards[2].question
answer_3 = gets.chomp
round_3 = round.take_turn(answer_3.to_s.downcase)
round_3.correct?
round_3.guess
feedback_array << round_3.feedback
turing_staff << round_3.feedback
puts round_3.feedback

puts "This is card number 4 out of #{number_of_cards}."
puts cards[3].question
answer_4 = gets.chomp
round_4 = round.take_turn(answer_4.to_s.capitalize)
round_4.correct?
round_4.guess
feedback_array << round_4.feedback
pop_culture_array << round_4.feedback
puts round_4.feedback

right = feedback_array.count('Correct!')
percent_right = ((feedback_array.count('Correct!').to_f / 4) * 100).to_i
puts "**** Game over! ****"
puts "You had #{right} correct guesses out of 4 for a total score of #{percent_right}%."

stem_percent_right = ((stem_array.count('Correct!').to_f / 1) * 100).to_i
puts "STEM - #{stem_percent_right}% correct"

turing_staff_percent_right = ((turing_staff.count('Correct!').to_f / 2) * 100).to_i
puts "Turing Staff - #{turing_staff_percent_right} % correct"

pop_culture_percent_right = ((pop_culture_array.count('Correct!').to_f / 1) * 100).to_i
puts "Pop Culture - #{pop_culture_percent_right}% correct"
