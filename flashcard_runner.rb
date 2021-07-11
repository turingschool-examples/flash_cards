require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "Panda", "Turing Staff")
card_3 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
card_4 = Card.new("What is Mike's middle name?", "Nobody knows", "Turing Staff")
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)


puts "Welcome! You're playing with #{deck.count} cards."
puts "-------------------------------------------------"

while deck.count != 0 do
  puts "This is card number #{round.turns.count + 1} out of #{deck.count + round.turns.count}."
  puts "Question: #{round.current_card.question}"
  guess = gets.chomp
  round.take_turn(guess)
  puts round.turns.last.feedback
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct.to_i}%"

categories_in_round = round.turns.map do |category|
  category.card.category
end

categories_in_round.uniq.each do |category|
  puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct"
end
