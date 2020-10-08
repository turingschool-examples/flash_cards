require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)

total_cards = round.turns.count + cards.count
total_rounds = round.deck.cards + round.turns
puts "Welcome! You're playing with #{total_cards} cards."
puts '-' * 51

num = 0
total_rounds.each do |card|
  puts "This card is number #{num += 1} out of #{total_cards}"
  puts "Question: #{card.question}"
  user_answer = gets.chomp
  guess = round.take_turn(user_answer)
  # require "pry"; binding.pry
  puts guess.feedback
end
