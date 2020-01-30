require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("What country does 45 take orders from?", "Russia", :Geography)
  card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_4 = Card.new("What is the largest planet in the solar system", "Jupiter", :STEM)
  cards = [card_1, card_2, card_3, card_4]

  deck = Deck.new(cards)
  round = Round.new(deck)

  puts "\n\nWelcome! You're playing with #{cards.length} cards.\n"
  puts "-------------------------------------------------\n\n"


  puts "This is card number #{round.flip + 1} out of #{cards.length}"
  puts "Question: " + round.current_card.question
  first_guess = gets.chomp.to_s
  first_turn = round.take_turn(first_guess)
  puts "\n" + first_turn.feedback + "\n\n"

  puts "This is card number #{round.flip + 1} out of #{cards.length}"
  puts "Question: " + round.current_card.question
  second_guess = gets.chomp.to_s
  second_turn = round.take_turn(second_guess)
  puts "\n" + second_turn.feedback + "\n\n"

  puts "This is card number #{round.flip + 1} out of #{cards.length}"
  puts "Question: " + round.current_card.question
  third_guess = gets.chomp.to_s
  third_turn = round.take_turn(third_guess)
  puts "\n" + third_turn.feedback + "\n\n"

  puts "This is card number #{round.flip + 1} out of #{cards.length}"
  puts "Question: " + round.current_card.question
  fourth_guess = gets.chomp.to_s
  fourth_turn = round.take_turn(fourth_guess)
  puts "\n" + fourth_turn.feedback + "\n\n"

  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{cards.length} for a total score of #{round.percent_correct.round}%."
  puts "Geography - #{round.percent_correct_by_category(:Geography).round}% correct"
  puts "STEM - #{round.percent_correct_by_category(:STEM).round}% correct"
