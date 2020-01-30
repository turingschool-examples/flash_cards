require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_1 = Card.new("What country does 45 take orders from?", "Russia", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  cards = [card_1, card_2, card_3]

  deck = Deck.new(cards)
  round = Round.new(deck)

p "Welcome! You're playing with #{cards.length} cards."
p "-------------------------------------------------"


  p "This is card number #{round.flip + 1} out of #{cards.length}"
  p "Question: " + round.current_card.question
  first_guess = gets.chomp.to_s
  first_turn = Turn.new(first_guess, round.current_card)
  p first_turn.feedback

  p "This is card number #{round.flip + 1} out of #{cards.length}"
  p "Question: " + round.current_card.question
  second_guess = gets.chomp.to_s
  second_turn = Turn.new(second_guess, round.current_card)
  p second_turn.feedback

  p "This is card number #{round.flip + 1} out of #{cards.length}"
  p "Question: " + round.current_card.question
  third_guess = gets.chomp.to_s
  third_turn = Turn.new(third_guess, round.current_card)
  p third_turn.feedback

p "****** Game over! ******"
p "You had #{round.number_correct} correct guesses out of #{cards.length} for a total score of #{round.percent_correct}."
p "STEM - #{round.percent_correct_by_category(:STEM)} correct"
p "Geography - #{round.percent_correct_by_category(:geography)} correct"
