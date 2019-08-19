require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What year did Colorado become a state?", "1876", :History)
cards = [card_1, card_2, card_3, card_4]

deck = Deck.new(cards)

round = Round.new(deck)


puts "Welcome! You're playing with 4 cards."
puts "-------------------------------------------------"
puts "This is card number 1 out of 4."
puts "Question: #{card_1.question}"
print "> "
guess = gets.chomp
turn = round.take_turn(guess)
turn.correct?
puts turn.feedback
puts "This is card number 2 out of 4."
puts "Question: #{card_2.question}"
print "> "
guess = gets.chomp
turn = round.take_turn(guess)
turn.correct?
puts turn.feedback
puts "This is card number 3 out of 4."
puts "Question: #{card_3.question}"
print "> "
guess = gets.chomp
turn = round.take_turn(guess)
turn.correct?
puts turn.feedback
puts "This is card number 4 out of 4."
puts "Question: #{card_4.question}"
print "> "
guess = gets.chomp
turn = round.take_turn(guess)
turn.correct?
puts turn.feedback
puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct}%."
# puts round.correct_turns.count
# puts round.correct_turns
puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
puts "History - #{round.percent_correct_by_category(:History)}% correct"
