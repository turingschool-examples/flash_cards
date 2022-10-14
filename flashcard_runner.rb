require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

require 'pry';
# binding.pry
#
########### Initial Setup
card_1 = Card.new("Question1", "Answer1", :cat1)
card_2 = Card.new("Question2", "Answer2", :cat1)
card_3 = Card.new("Question3", "Answer3", :cat2)

cards = [card_1, card_2, card_3]

deck = Deck.new(cards)

round = Round.new(deck)
# Welcome message
puts "Welcome! You're playing with #{deck.count} cards.\n"
puts '------------------------------------'

round.current_card
puts "This is card number #{round.turn_number} out of #{deck.count}.\n"
puts "Question: #{round.cur_card.question}"
print "Your guess => "
guess = gets.to_s
new_turn = round.take_turn(guess)
new_turn.correct?
puts new_turn.feedback
