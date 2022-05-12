require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]

deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! you're playing with #{deck.count} cards."
puts "-"*38
deck.count.times do
  puts "This is card #{round.turns.length + 1} out of #{deck.count}."
  puts "Question: #{round.current_card.question}"
  guess = gets.chomp
  puts round.take_turn(guess.capitalize).feedback
end
puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{deck.count} for a total score of #{round.percent_correct.to_i}%."
