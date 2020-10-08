require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff" )
deck = Deck.new([card_1, card_2, card_3, card_4])

# Create welcome message when creating new round
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











