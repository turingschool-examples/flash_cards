require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

filename = 'cards.txt'
cards = CardGenerator.new(filename).cards

deck = Deck.new(cards)
round = Round.new(deck)

number_of_cards = deck.cards.length

puts "Welcome! You're playing with #{number_of_cards} cards."

until deck.cards.length == round.turns.count
  puts "This is card number #{round.turns.length + 1} out of #{number_of_cards}."
  puts "Question: #{round.current_card.question}"
  guess = gets.chomp
  new_turn = round.take_turn(guess)
  puts new_turn.feedback
end

puts "****** Game over! ******"
puts "You have #{round.number_correct} answers correct out of #{number_of_cards} questions for a total score of #{round.percent_correct}%!"
puts "Category- Personal #{round.percent_correct_by_category(:Personal)}%"
puts "Category- Music #{round.percent_correct_by_category(:Music)}%"
puts "Category- History #{round.percent_correct_by_category(:History)}%"
