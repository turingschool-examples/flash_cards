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

card_count = round.deck.cards.length

card_count.times do |num|
  puts "This is card number #{num+1} out of #{card_count}."
  puts "Question: #{round.current_card.question}"

  guess = gets.chomp

  puts "#{round.take_turn(guess).feedback}"

end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.turns.size} for a total score of #{round.percent_correct}."
puts ""
