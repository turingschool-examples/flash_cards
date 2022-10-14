require './lib/round'
require './lib/deck'
require './lib/card'
require './lib/turn'
require './lib/card_generator'

#refactor, add methods for this interface, maybe make a class to hold them

cards = CardGenerator.new("cards.txt").cards
deck = Deck.new(cards)
round = Round.new(deck)

#move method to round/deck class / refactor whole process
categories = deck.cards.map {|card| card.category}.uniq

puts "Welcome! You're playing with #{round.deck.initial_size} cards."
puts "-------------------------------------------------"


until round.deck.count == 0 do
  puts "This is card number #{round.turns.length + 1} out of #{round.deck.initial_size}."
  puts "Question: #{round.current_card.question}"
  guess = gets.chomp
  round.take_turn(guess)
  puts "#{round.feedback}\n"
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.deck.initial_size} for a total score of #{round.percent_correct}."
categories.each{|category| puts "#{category.to_s} - #{round.percent_correct_by_category(category)}% correct"}
