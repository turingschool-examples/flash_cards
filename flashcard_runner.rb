require './round'
require './card'
require './deck'
require './turn'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)

def start(round)
  p "Welcome! You're playing with #{round.deck.cards.count} cards."
  p "_" * 40
  p "This is card number #{round.turns.count + 1} out of #{round.deck.cards.count}"
  p "Question: #{round.deck.cards.first.question}"

  user_input = gets.chomp
  p user_input
  round.take_turn(user_input)
  p round.turns.last.feedback
  p "This is card number #{round.turns.count + 1} out of #{round.deck.cards.count}"
  p "Question: #{round.deck.cards.first.question}"

  user_input = gets.chomp
  p user_input
  round.take_turn(user_input)
  p round.turns.last.feedback
  p "This is card number #{round.turns.count + 1} out of #{round.deck.cards.count}"
  p "Question: #{round.deck.cards.first.question}"

  user_input = gets.chomp
  p user_input
  round.take_turn(user_input)
  p round.turns.last.feedback

  p "****** Game over! ******"
  p "You had #{round.number_correct} correct guesses out of #{round.deck.cards.count} for a total score of #{round.percent_correct}%."
  p "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
  p "Geography - #{round.percent_correct_by_category(:Geography)}% correct."
end

start(round)
