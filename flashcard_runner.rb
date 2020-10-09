require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

card_gen = CardGenerator.new("./lib/cards.txt").cards
deck = Deck.new(card_gen)

round_1 = Round.new(deck)
if round_1.class == Round
  puts "Welcome! You're playing with #{deck.cards.length} cards."
  puts "-------------------------------------------------"
else
  puts "Round not initialized. Please reboot game."
end

deck.cards.each do |card|
  puts "This is card number #{round_1.card_tracker + 1} out of #{deck.cards.length}."
  puts "Question: #{deck.cards[round_1.card_tracker].question}"
  guess = gets.chomp

  round_1.take_turn(guess)

  puts round_1.turns.last.feedback
end

puts "****** Game over! ******"
puts "You had #{round_1.number_correct} correct guesses out of #{round_1.turns.length} for a total score of #{round_1.percent_correct.round}%."

categories = deck.cards.map do |card|
  card.category
end

categories = categories.uniq
categories.each do |category|
  puts "#{category} - #{round_1.percent_correct_by_category(category).round}% correct."
end











