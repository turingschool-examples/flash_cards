require './lib/deck'
require './lib/round'
require './lib/card_generator'
filename = "lib/cards.txt"

cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)
cards_count = cards.count
round.start

while deck.cards.count > 0 do
  puts "This is card number #{round.turns.count + 1} out of #{cards_count}"
  puts "Question: #{round.current_card.question}"
  guess = gets.chomp
  new_turn = round.take_turn(guess)
  puts new_turn.feedback
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guess out of #{cards_count} for a total score of #{round.percent_correct.to_i}%."
puts "STEM - #{round.percent_correct_by_category("STEM").to_i}% correct"
puts "Turing Staff - #{round.percent_correct_by_category("TuringStaff").to_i}% correct"
puts "Pop Culture - #{round.percent_correct_by_category("PopCulture")}% correct"
