require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require 'pry'

def start
  card_1 = Card.new(
    "What is the capital of Alaska?",
    "Juneau",
    :Geography
  )
  card_2 = Card.new(
    "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
    "Mars",
    :STEM
  )
  card_3 = Card.new(
    "Describe in words the exact direction that is 697.5° clockwise from due north?",
    "North north west",
    :STEM
  )
  cards = [card_1, card_2, card_3]
  deck = Deck.new(cards)
  round = Round.new(deck)


  puts "Welcome! You're playing with #{cards.length} cards."
  puts "-------------------------------------------------"
  puts "This is card number 1 out of #{cards.length}."
  # Does the card number that we are starting on need to be more dynamic? How?
  puts "Question: #{round.current_card.question}"

  answer_1 = gets.chomp
  turn_1 = round.take_turn(answer_1)

  puts turn_1.feedback

  puts "This is card number 2 out of #{cards.length}."
  puts "Question: #{round.current_card.question}"

  answer_2 = gets.chomp
  turn_2 = round.take_turn(answer_2)

  puts turn_2.feedback

  puts "This is card number 3 out of #{cards.length}."
  puts "Question: #{round.current_card.question}"

  answer_3 = gets.chomp
  turn_3 = round.take_turn(answer_3)

  puts turn_3.feedback

  if round.deck.length == 0
  # can this whole thing be a while loop? That runs until round.deck.length == 0

    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{cards.length} for a total score of #{percent_correct}."
  # is round.number_correct teh correct method?

    puts "#{category} - #{percent_correct_by_category}% correct"
    puts "#{category} - #{percent_correct_by_category}% correct"
    puts "#{category} - #{percent_correct_by_category}% correct"
  # fix the above methods to call on them correctly
  end

end

start
