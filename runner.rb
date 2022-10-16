require 'pry'
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

total_cards = cards.length

puts "Welcome! You're playing with #{cards.length} cards."

puts '-------------------------------------------------'

puts "This card is number 1 out of #{total_cards}"
puts "#{round.current_card.question}"
guess = gets.chomp
guess.capitalize!
puts round.take_turn(guess).feedback

puts "This card is number 2 out of #{total_cards}"

puts "#{round.current_card.question}"
guess = gets.chomp
guess.capitalize!
puts round.take_turn(guess).feedback

puts "This card is number 3 out of #{total_cards}"

puts "#{round.current_card.question}"
guess = gets.chomp
guess.capitalize!
puts round.take_turn(guess).feedback

puts "****** Game over! ******"

puts "You had #{round.number_correct} correct guesses out of #{total_cards} for a total score of #{round.percent_correct}%."
puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"