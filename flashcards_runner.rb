require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is love?", "Baby dont hurt me", :Culture)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with 4 cards."
puts "-" * 50
puts "This is card 1 out of 4"
puts round.deck.cards[0].question
guess = gets.chomp
turn = round.take_turn(guess)
puts turn.feedback
puts "This is card number 2 out of 4."
puts round.deck.cards[1].question
guess = gets.chomp
turn = round.take_turn(guess)
puts turn.feedback
puts "This is card number 3 out of 4."
puts round.deck.cards[2].question
guess = gets.chomp
turn = round.take_turn(guess)
puts turn.feedback
puts "This is card number 4 out of 4."
puts round.deck.cards[3].question
guess = gets.chomp
turn = round.take_turn(guess)
puts turn.feedback
puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of 4 for a total score of #{round.percent_correct}%."
puts "STEM -#{round.percent_correct_by_category(:STEM)}% correct."
puts "Culture -#{round.percent_correct_by_category(:Culture)}% correct."
puts "Geography -#{round.percent_correct_by_category(:Geography)}% correct."
