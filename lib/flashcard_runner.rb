# require 'rspec'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'


card_1 = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
card_2 = Card.new('Who was the first woman in space?', 'Valentina Tereshkova', :STEM)
card_3 = Card.new('When was the Declaration of Independence Signed?', '1776', :History)
card_4 = Card.new('Who was the first African American president?', 'Obama', :History)
cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)


puts
puts "Welcome! You're playing with #{cards.size} cards."
puts "-------------------------------------------------"
# puts "This is card number #{round.turns.size + 1} out of #{cards.size}."

# puts "Question: #{round.current_card.question}"
# guess_1 = gets
# turn = round.take_turn(guess_1)
# puts "#{turn.feedback}"
count = 0
cards.each do |card|
  count += 1
  puts "This is card number #{count} out of #{cards.size}."
  puts "Question: #{card.question}"
  puts "DEBUG: card: #{card}"
  puts "DEBUG: card.question #{card.question}"
  puts "DEBUG: round.current_card.question #{round.current_card.question}"
  puts "DEBUG: "
  guess = gets
  puts "DEBUG: guess: #{guess}"
  turn = round.take_turn(guess)
  puts "DEBUG: turn: #{turn}"
  puts "#{turn.feedback}"
  #puts "DEBUG: rounds.turns.feedback #{round.turns.feedback}"
  puts "DEBUG: turn.answer #{turn.card.answer}"
  puts "DEBUG: round.turns.first.feedback #{round.turns.shift.feedback}"

end

# puts "****** Game over! ******"
# puts "You had #{round.number_correct} correct guesses out of #{round.turns.size} for a total score of #{round.percent_correct}."
# puts ""
