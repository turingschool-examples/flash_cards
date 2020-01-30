require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)


p "Welcome! You're playing with #{deck.cards.size} cards."
p "-------------------------------------------------"

while (deck.count != round.turns.count)
  p "This is card number #{round.turns.size + 1} out of #{deck.cards.size}."
  p "Question: #{round.current_card.question}"
  answer = gets.chomp
  turn = Turn.new(answer, round.current_card)
  round.take_turn(answer)
  p turn.feedback
end
p "****** Game over! ******"
p "You had #{round.number_correct} correct guesses out of #{deck.cards.size} for a total score of #{round.percent_correct.round(0)}%."
# STEM - 100% correct
# Turing Staff - 50% correct
# Pop Culture - 100% correct

category = Hash.new
deck.cards.each do | value |
  if category.include?(value.category)
    category[value.category] = round.percent_correct_by_category(value.category)
  elsif
    category[value.category] = round.percent_correct_by_category(value.category)
  end
end

category.each do | key, value |
  p "#{key.to_s.sub(":", "")} - #{value.round(0)}% correct"
end
