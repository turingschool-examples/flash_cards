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
# stem_array = []
# turing_staff = []
# pop_culture_array = []
number_of_cards = deck.count
index = 0
card_number = 1
category_array = []
correct_category_array = []

def start(card_number)
  puts "Welcome, you're playing with #{card_number} cards."
  puts "----------------------------------------------------"
end

start(number_of_cards)

while index < number_of_cards
  puts "This is card number #{card_number} out of #{number_of_cards}."
  puts cards[index].question
  answer = gets.chomp
  round_2 = round.take_turn(answer.to_s)
  round_2.correct?
  round_2.guess
  feedback_array << round_2.feedback
  if round_2.correct? == true
    correct_category_array << cards[index].category
  end
  category_array << cards[index].category
  index += 1
  card_number += 1
  puts round_2.feedback
end

right = feedback_array.count('Correct!')
percent_right = ((feedback_array.count('Correct!').to_f / number_of_cards) * 100).to_i
puts "**** Game over! ****"
puts "You had #{right} correct guesses out of #{number_of_cards} for a total score of #{percent_right}%."

category_hash = category_array.tally
categories = category_hash.keys
values = category_hash.values
index_2 = 0
category_correct_hash = correct_category_array.tally

while index_2 < categories.length
  category_correct = ((category_correct_hash[categories[index_2]].to_f / values[index_2].to_f) * 100).to_i
  puts "#{categories[index_2].upcase} - #{category_correct}% correct"
  index_2 += 1
end


# puts "This is card number 1 out of #{number_of_cards}."
# puts cards[0].question
# answer_1 = gets.chomp
# round_1 = round.take_turn(answer_1.to_s.downcase)
# round_1.correct?
# round_1.guess
# feedback_array << round_1.feedback
# stem_array << round_1.feedback
# puts round_1.feedback
#
# puts "This is card number 2 out of #{number_of_cards}."
# puts cards[1].question
# answer_2 = gets.chomp
# round_2 = round.take_turn(answer_2.to_s.downcase)
# round_2.correct?
# round_2.guess
# feedback_array << round_2.feedback
# turing_staff << round_2.feedback
# puts round_2.feedback
#
#
# puts "This is card number 3 out of #{number_of_cards}."
# puts cards[2].question
# answer_3 = gets.chomp
# round_3 = round.take_turn(answer_3.to_s.downcase)
# round_3.correct?
# round_3.guess
# feedback_array << round_3.feedback
# turing_staff << round_3.feedback
# puts round_3.feedback
#
# puts "This is card number 4 out of #{number_of_cards}."
# puts cards[3].question
# answer_4 = gets.chomp
# round_4 = round.take_turn(answer_4.to_s.capitalize)
# round_4.correct?
# round_4.guess
# feedback_array << round_4.feedback
# pop_culture_array << round_4.feedback
# puts round_4.feedback


# turing_staff_percent_right = ((turing_staff.count('Correct!').to_f / 2) * 100).to_i
# puts "Turing Staff - #{turing_staff_percent_right} % correct"
#
# pop_culture_percent_right = ((pop_culture_array.count('Correct!').to_f / 1) * 100).to_i
# puts "Pop Culture - #{pop_culture_percent_right}% correct"
