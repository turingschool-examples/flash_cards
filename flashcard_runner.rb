require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

require 'pry';
# v Don't need this variable, can place file directly in argument v
# filename = "./lib/cards.txt"

cards_gen = CardGenerator.new('./lib/cards.txt').cards_init

# Initial Setup
## All cards will be replaced with cards.txt
    # card_1 = Card.new("Question1", "Answer1", :cat1)
    # card_2 = Card.new("Question2", "Answer2", :cat1)
    # card_3 = Card.new("Question3", "Answer3", :cat2)

    # cards = [card_1, card_2, card_3]
cards = cards_gen.map{|c| c = Card.new(c)}
total_cards = cards_gen.length

deck = Deck.new(cards)

round = Round.new(deck)

# Welcome message
puts "Welcome! You're playing with #{total_cards} cards.\n"
puts '------------------------------------'

# This is the turn loop
until round.turns_array.length == total_cards do
  round.current_card
puts "This is card number #{round.turn_number} out of #{total_cards}.\n"
puts "Question: #{round.cur_card.question}"
print "Your guess => "
guess = gets.to_s
guess.chomp!
new_turn = round.take_turn(guess)
puts 'v v v v v v v v'
new_turn.correct?
puts new_turn.feedback
round.turns_array.push(new_turn)
puts '------------------------------------'
end
# # Here is a second turn instance, for testing
# round.current_card
# puts "This is card number #{round.turn_number} out of #{total_cards}.\n"
# puts "Question: #{round.cur_card.question}"
# print "Your guess => "
# guess = gets.to_s
# guess.chomp!
# new_turn2 = round.take_turn(guess)
#
# new_turn2.correct?
# puts new_turn2.feedback
# round.turns_array.push(new_turn2)

# This will loop -> until deck = [] <-

# Feedback & Breakdown
puts '------------------------------------'
puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.turns_array.length} for a total score of #{round.percent_correct.round(2)}%!"
## pull out this section and loop using an array of all categories, for flexibility
round.turns_array.each {|turn|
puts "#{turn.card.category} - #{round.percent_correct_by_category(turn.card.category).round(2)}% correct"}
puts '------------------------------------'
puts '** 🐸 Thanks for playing 🐸 **'
