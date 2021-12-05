require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/flash_round'

card_1 = Card.new("Question: 5 + 5?", "10", :Math)
card_2 = Card.new("Question: What is Rachel's favorite animal?","Donkey", :Personal)
card_3 = Card.new("Question: What is Mike's middle name?", "nobody knows", :Turing)
card_4 = Card.new("Question: What cardboard cutout lives at turing?", "Justin Bieber", :PopCulture)
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)
round_counter = 1
card_counter = 4

#def start
  puts "Welcome!  You're playing with #{round.deck.count} cards."
  puts "--------------------------------------------------"
  puts "This is card number 1 out of 4."
  #puts "#{round.current_card.question}"
  puts "#{card_1.question}"
#end
while round_counter < 4 do
  round_counter += 1
  turn_FR = round.take_turn(gets.chomp)
  puts "#{turn_FR.feedback}"
  puts "This is card number #{round_counter} of 4."
  puts "#{round.current_card.question}"
end



puts "***** Game over! *****"
puts "You had #{turn_FR.number_correct} correct guesses out of 4 for a total score of #{turn_FR.turns.percent_correct}."
