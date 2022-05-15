require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

card_1 = Card.new("Which element has the symbol 'H'?", "Hydrogen", :ReactiveNonmetals)
card_2 = Card.new("Which element has the symbol 'Ne'?", "Neon", :NobleGases)
card_3 = Card.new("Which element has the symbol 'Xe'?", "Xenon", :NobleGases)
card_4 = Card.new("Which element has the symbol 'B'?", "Boron", :Metalloids)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

# def start
#   round
#   turns = []
#   current_card = 0
#   take_turn(guess)
#   guess
#   correct?
#   feedback
#   number_correct = 0
#   percent_correct_by_category
# end


print "Welcome! You're playing with 4 cards."
-------------------------------------------------
round.start
puts "This is card number 1 out of 4."
deck = Deck.new
puts "Question: #{card.question}"
guess = gets.chomp.capitalize

# Then a user will be able to type in a guess, in this case 10, and hit enter to move the game play forward.
#
# 10
# Correct!
# This is card number 2 out of 4.
# Question: What is Rachel's favorite animal?
# The game will continue until all the Cards in the Deck have had a guess made against them (until you have completed as many Turns as you have Cards in the Deck).
#
# panda
# Incorrect.
# This is card number 3 out of 4.
# Question: What is Mike's middle name?
# nobody knows
# Correct!
# This is card number 4 out of 4.
# Question: What cardboard cutout lives at Turing?
# Justin Bieber
# Correct!
# When all the Turns have been made, the game will end and will present the user with a final score.
#
# ****** Game over! ******
# You had 3 correct guesses out of 4 for a total score of 75%.
# STEM - 100% correct
# Turing Staff - 50% correct
# Pop Culture - 100% correct
