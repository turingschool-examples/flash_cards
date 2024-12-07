# frozen_string_literal: true

require_relative 'lib/round'
require_relative 'lib/deck'
require_relative 'lib/card'
require_relative 'lib/card_generator'

cards = CardGenerator.new('cards.txt').cards
deck = Deck.new(cards)
round = Round.new(deck)
puts "Welcome! You're playing with #{deck.count} cards."
puts '-------------------------------------------------'
deck.cards.each do
  puts "This is card number #{round.deck_index + 1} out of #{deck.count}."
  puts "Question: #{round.current_card.question}"
  puts round.take_turn(gets.chomp).feedback
end
puts '****** Game over! ******'
puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%."
deck.categories.each do |category|
  puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct"
end
