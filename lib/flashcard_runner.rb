require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)


puts "Welcome! You're playing with #{deck.count} cards"
puts "------------------------------------------------"

puts "This is card number #{round.number_of_rounds + 1} out of #{deck.count}"
puts "Question: #{round.current_card.question}"
guess = gets.chomp
new_turn = round.take_turn(guess)
puts new_turn.feedback

puts "This is card number #{round.number_of_rounds + 1} out of #{deck.count}"
puts "Question: #{round.current_card.question}"
guess = gets.chomp
new_turn = round.take_turn(guess)
puts new_turn.feedback

puts "This is card number #{round.number_of_rounds + 1} out of #{deck.count}"
puts "Question: #{round.current_card.question}"
guess = gets.chomp
new_turn = round.take_turn(guess)
puts new_turn.feedback

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.number_of_rounds} for a total score of #{round.percent_correct}%"
puts round.make_category_list
puts "-------------------------------------------------"
