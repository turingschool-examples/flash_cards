require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "red panda", :"Turing Staff")
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :"Turing Staff")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :"Pop Culture")

cards = [card_1, card_2, card_3, card_4]
deck = Deck.new(cards)
round = Round.new(deck)
categories = cards.map { |card| card.category }

puts "Welcome! You're playing with #{cards.size} cards."
puts "-" * 49
deck.cards.length.times do
  puts "This is card number #{round.count + 1} out of #{deck.cards.length}."
  puts "Question: " + round.current_card.question
  guess = gets.chomp
  turn = round.take_turn(guess)
  puts turn.feedback
end
puts "****** Game Over! ******"
puts "You had #{round.number_correct} guesses out of #{round.turns.length} for a total score of #{round.percent_correct.to_i}%."
categories.uniq.each do |category|
  puts "#{category} - #{round.percent_correct_by_category(category).to_i}% correct"
end
