require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

def start
  cards = CardGenerator.new("cards.txt").cards
  deck = Deck.new(cards)
  round = Round.new(deck)

  puts "Welcome! You're playing with #{deck.count} cards."
  puts "-------------------------------------------------"
  while round.count <= deck.count do
    puts "This is card number #{round.count} of #{deck.count}."
    puts "Question: #{round.current_card.question}"
    guess = gets.chomp
    round.take_turn(guess)
    puts round.turns.last.feedback
    end
  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.round}%."
  puts "STEM - #{round.percent_correct_by_category(:STEM).round}% correct"
  puts "Turing Staff - #{round.percent_correct_by_category("Turing Staff").round}% correct"
  puts "Pop Culture - #{round.percent_correct_by_category("Pop Culture").round}% correct"
end

start()
