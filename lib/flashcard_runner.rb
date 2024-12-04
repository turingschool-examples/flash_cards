# frozen_string_literal: true

require_relative 'round'
require_relative 'deck'
require_relative 'card'
require_relative 'turn'

card1 = Card.new('What is 5 + 5?', '10', 'STEM')
card2 = Card.new("What is Rachel's favorite animal?", 'red panda', 'Turing Staff')
card3 = Card.new("What is Mike's middle name?", 'nobody knows', 'Turing Staff')
card4 = Card.new('What cardboard cutout lives at Turing?', 'Justin bieber', 'PopCulture')
cards = [card1, card2, card3, card4]
deck = Deck.new(cards)
round = Round.new(deck)
amount_of_cards = round.deck.count
puts "Welcome! You're playing with #{amount_of_cards} cards."
puts '-------------------------------------------------'
amount_of_cards.times do |card_number|
  puts "This is card number #{card_number + 1} out of #{amount_of_cards}."
  puts "Question: #{round.current_card.question}"
  new_turn = round.take_turn(gets.chomp)
  puts new_turn.feedback
end
puts '****** Game over! ******'
puts "You had #{round.number_correct} correct guesses out of #{amount_of_cards} for a total score of #{round.percent_correct.to_i}%."
puts "STEM - #{round.percent_correct_by_category('STEM').to_i}% correct"
puts "Turing Staff - #{round.percent_correct_by_category('Turing Staff').to_i}% correct"
puts "Pop Culture - #{round.percent_correct_by_category('PopCulture').to_i}% correct"
