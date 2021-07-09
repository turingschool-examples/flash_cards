require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "koala", :turing_staff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :turing_staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :pop_culture)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)

def start(round)
  deck_count = round.deck.count

  puts "Welcome! You're playing with #{deck_count} cards."
  puts "-------------------------------------------------"


end

start(round)
# puts "Welcome! You're playing with #{@deck.count} cards."
# puts "-------------------------------------------------"
# puts "This is card number 1 out of #{@deck.count}."
# Question: What is 5 + 5?
#
#
# 10
# Correct!
# This is card number 2 out of 4.
# Question: What is Rachel's favorite animal?
#
#
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
#
#
#
# ****** Game over! ******
# You had 3 correct guesses out of 4 for a total score of 75%.
# STEM - 100% correct
# Turing Staff - 50% correct
# Pop Culture - 100% correct
