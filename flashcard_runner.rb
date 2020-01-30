require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10", "STEM")
card_2 = Card.new("What is Rachel's favorite animal?", "Dog", "Turing Staff")
card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
deck = Deck.new([card_1, card_2, card_3, card_4])
round = Round.new(deck)


puts "Welcome! You're playing with #{deck.cards.size} cards."
puts "-------------------------------------------------"

while (deck.count != round.turns.count)
  puts "This is card number #{round.turns.size + 1} out of #{deck.cards.size}."
  puts "Question: #{round.current_card.question}"
  answer = gets.chomp
  turn = Turn.new(answer, round.current_card)
  round.take_turn(answer)
  puts turn.feedback
end
puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{deck.cards.size} for a total score of #{round.percent_correct.round(0)}%."

category = Hash.new
deck.cards.each do | value |
    category[value.category] = round.percent_correct_by_category(value.category)
end

category.each do | key, value |
  puts "#{key.to_s} - #{value.round(0)}% correct"
end
