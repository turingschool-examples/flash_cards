require './card'
require './deck'
require './turn'
require './round'
require './card_generator'

file = File.open('./cards.txt')
card_generator = CardGenerator.new(file)
cards = card_generator.cards
deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.cards.count} cards
-------------------------------------------------"

while round.cards_remaining?
puts "This is card number #{round.turns.count + 1} out of #{round.deck.cards.count}
Question: #{cards[0].question}\n"
round.take_turn(gets.capitalize.chomp)
puts "#{round.turns[-1].feedback}\n"
end

puts "\n******** Game over! *******\n
You had #{round.number_correct} out of #{deck.cards.count} for a total score of #{round.percent_correct}\n
#{deck.cards[0].category} - #{round.percent_correct_by_category(deck.cards[0].category)}\n
#{deck.cards[2].category} - #{round.percent_correct_by_category(deck.cards[2].category)}\n
#{deck.cards[3].category} - #{round.percent_correct_by_category(deck.cards[3].category)}"
