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
puts "This is card number #{round.turns.size + 1} out of #{cards.size}."

# puts "Question: #{round.deck.cards[0].question}"
# guess = gets
# turn = round.take_turn(guess)
# puts "#{turn.feedback}" # this does not return the correct feedback but the feedback passes tests.

cards.each do |card| # this loops skips every other element
  puts "#{card.question}"
  guess = gets
  puts "#{round.current_card}"
  # puts "Question: #{card.question}"
  # guess = gets
  # turn = round.take_turn(guess)
  # puts "#{turn.feedback}"
end
