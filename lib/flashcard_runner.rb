# frozen_string_literal: true

require_relative 'round'
require_relative 'deck'
require_relative 'card'
require_relative 'card_generator'

# card1 = Card.new('What is 5 + 5?', '10', 'STEM')
# card2 = Card.new("What is Rachel's favorite animal?", 'red panda', 'Turing Staff')
# card3 = Card.new("What is Mike's middle name?", 'nobody knows', 'Turing Staff')
# card4 = Card.new('What cardboard cutout lives at Turing?', 'Justin bieber', 'PopCulture')
# cards = [card1, card2, card3, card4]
cards = CardGenerator.new('cards.txt').cards
deck = Deck.new(cards)
round = Round.new(deck)
amount_of_cards = round.deck.count
puts "Welcome! You're playing with #{amount_of_cards} cards."
puts '-------------------------------------------------'
# A simple loop that will run as many times as there are cards in the deck
amount_of_cards.times do |card_number|
  # card_number + 1 is because the card_number variable starts at 0
  puts "This is card number #{card_number + 1} out of #{amount_of_cards}."
  puts "Question: #{round.current_card.question}"
  # This is where the real magic happens; gets takes the input from the user and the chomp method removes the line break.
  # The chomp is necessary in order to compare the strings like for like. The feedback method is used to display the results to the user
  puts round.take_turn(gets.chomp).feedback
end
puts '****** Game over! ******'
puts "You had #{round.number_correct} correct guesses out of #{amount_of_cards} for a total score of #{round.percent_correct.to_i}%."
puts "STEM - #{round.percent_correct_by_category('STEM').to_i}% correct"
puts "Turing Staff - #{round.percent_correct_by_category('Turing Staff').to_i}% correct"
puts "Pop Culture - #{round.percent_correct_by_category('PopCulture').to_i}% correct"
