require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("Question: 5 + 5?", "10", :Math)
card_2 = Card.new("Question: What is Rachel's favorite animal?","Donkey", :Personal)
card_3 = Card.new("Question: What is Mike's middle name?", "nobody knows", :Turing)
card_4 = Card.new("Question: What cardboard cutout lives at turing?", "Justin Bieber", :PopCulture)
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)

  puts "Welcome!  You're playing with #{round.deck.count} of 4 cards."
  puts "--------------------------------------------------"

until round.deck.cards.empty? do
  puts "#{round.current_card.question}"
  turn_FR = round.take_turn(gets.chomp)
  puts "#{turn_FR.feedback}"
end

  puts "***** Game over! *****"
  puts "You had #{round.number_correct} correct guesses out of 4 for a total score of #{round.turns.percent_correct}."
