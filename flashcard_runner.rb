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
  round_2 = round.take_turn(answer.downcase.to_s)
  round_2.correct?
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
index_2 = 0
category_correct_hash = correct_category_array.tally

while index_2 < category_hash.keys.length
  category_correct = ((category_correct_hash[category_hash.keys[index_2]].to_f / category_hash.values[index_2].to_f) * 100).to_i
  puts "#{category_hash.keys[index_2].upcase} - #{category_correct}% correct"
  index_2 += 1
end
