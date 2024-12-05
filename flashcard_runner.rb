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
# A simple loop that will run as many times as there are cards in the deck
deck.cards.each do
  # round.deck_index + 1 is because the round.deck_index variable starts at 0, and we want this to start at 1
  puts "This is card number #{round.deck_index + 1} out of #{deck.count}."
  puts "Question: #{round.current_card.question}"
  # This is where the real magic happens; gets takes the input from the user and the chomp method removes the line break.
  # The chomp is necessary in order to compare the strings like for like. The feedback method is used to display the results to the user
  puts round.take_turn(gets.chomp).feedback
end
puts '****** Game over! ******'
puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%."
deck.categories.each do |category|
  puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct"
end
