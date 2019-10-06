require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'

#create cards
# card_1 = Card.new("What is the sum of 5 + 5?", "10", :Math)
# card_2 = Card.new("What is the sum of 5 + 10?", "15", :Math)
# card_3 = Card.new("Capital of Colorado?", "denver", :Geography)
# card_4 = Card.new("Capital of New York?", "albany", :Geography)

#store cards in array
# cards_1 = [card_1, card_2, card_3, card_4]
cards = CardGenerator.new('./lib/cards.txt').cards

#create deck
deck_1 = Deck.new(cards)

#round
round_1 = Round.new(deck_1)

#start of game:
puts "Welcome! You're playing with #{deck_1.count} cards."
40.times { print "-" }
puts ""

until round_1.turns.count == deck_1.count
  puts "This card is number #{round_1.turns.count + 1} out of #{deck_1.count}:"
  puts "Question: #{round_1.current_card.question}"
  puts "Type answer:\n"
  guess = gets.chomp.downcase
  turn = round_1.take_turn(guess)
  puts turn.feedback
end

puts "****** Game over! ******"
puts "You had #{round_1.number_correct} answers out of #{deck_1.count} for a total score of #{round_1.percent_correct}%."
puts "Math - #{round_1.percent_correct_by_category(:Math)}%"
puts "Geography - #{round_1.percent_correct_by_category(:Geography)}%"
