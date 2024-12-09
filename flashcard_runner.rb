# frozen_string_literal: true

require_relative 'lib/round'
require_relative 'lib/deck'
require_relative 'lib/card'
require_relative 'lib/card_generator'

round = Round.new(Deck.new(CardGenerator.new('cards.txt').cards))
puts "Welcome! You're playing with #{round.deck.count} cards."
puts '-------------------------------------------------'
round.deck.cards.each do
  puts "This is card number #{round.turns.size + 1} out of #{round.deck.count}."
  puts "Question: #{round.current_card.question}"
  puts round.take_turn(gets.chomp).feedback
end
puts '****** Game over! ******'
puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} " \
     "for a total score of #{round.percent_correct.to_i}%."
round.deck.categories.each do |category|
  puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct"
end
