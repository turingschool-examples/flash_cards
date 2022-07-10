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


round.start

puts card_1.question

guess = gets.chomp
round.take_turn(guess)
new_turn= Turn.new(guess, card_1)
new_turn.correct?
puts new_turn.feedback

puts "This is card number 2 out of 3."

puts card_2.question

guess = gets.chomp
round.take_turn(guess)
new_turn= Turn.new(guess, card_2)
new_turn.correct?
puts new_turn.feedback

puts "This is card number 3 out of 3."

puts card_3.question

guess = gets.chomp
round.take_turn(guess)
new_turn= Turn.new(guess, card_3)
new_turn.correct?
puts new_turn.feedback

puts "****** Game over! ******"
puts "You have #{round.number_correct} correct guesses out of 3 for a total score of #{round.percent_correct}%"
puts "Geography - #{round.percent_correct_by_category(:Geography)}%"
puts "STEM - #{round.percent_correct_by_category(:STEM)}%"
