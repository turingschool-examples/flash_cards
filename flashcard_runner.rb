require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/round'

card_1 = Card.new("What is Brian's favorite sport?", "Football", :Brian)
card_2 = Card.new("What is the capital city of Colorado?", "Denver", :Geography)
card_3 = Card.new("What is 3 + 3?", "6", :Math)
card_4 = Card.new("What is Brian's favorite food?", "Chicken parmesan", :Brian)
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)


 opening_message = "Welcome! You're playing with #{deck.count} cards."
puts opening_message




card_number_message = "This is card number 1 out of #{deck.count}."
puts card_number_message

question_message = "Question: #{round.current_card.question}"
puts question_message

guess = gets.chomp
new_turn = round.take_turn(guess)
puts round.turns.last.feedback


card_number_message = "This is card number 2 out of 4."
puts card_number_message

question_message = "Question: #{round.current_card.question}"
puts question_message


guess = gets.chomp
new_turn = round.take_turn(guess)
puts round.turns.last.feedback

card_number_message = "This is card number 3 out of 4."
puts card_number_message
question_message = "Question: #{round.current_card.question}"
puts question_message


guess = gets.chomp
new_turn = round.take_turn(guess)
puts round.turns.last.feedback

card_number_message = "This is card number 4 out of 4."
puts card_number_message

question_message = "Question: #{round.current_card.question}"
puts question_message


guess = gets.chomp
new_turn = round.take_turn(guess)
puts round.turns.last.feedback

closing_message = '****** Game Over! *******'
puts closing_message

correct_guesses_message = "You had #{round.number_correct} correct guesses out of 4 for a total 
score of #{round.percent_correct}."

puts correct_guesses_message