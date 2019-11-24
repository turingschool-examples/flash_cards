require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

i = 0

p "Welcome! You're playing with #{@cards.count} cards."
p "-------------------------------------------------"
p "This is card number #{@deck.card.first} out of #{@cards.count}."
p "Question: #{@card.question}?"

i += 1
