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
  # How to get it to return a number and not the instance?
  # Does the card number that we are starting on need to be more dynamic?
  puts "Question: #{round.current_card.question}"
  # Need to call on the question attribute of a card instance

  answer_1 = gets.chomp
  turn_1 = round.take_turn(answer_1)

  puts turn_1.feedback

  # if answer_1 == correct?
  # puts turn.feedback
  # call on the round.deck.length?? if == 0 game end if not continue to next turn

  puts "This is card number 2 out of #{cards.length}."
  # How to get it to return a number and not the instance?
  puts "Question: #{cards.??}"

  answer_2 = gets.chomp
  # Should I call on the take_turn method here?
  puts answer_2

  # if answer_2 == correct?
  # puts turn.feedback
  # call on the round.deck.length?? if == 0 game end if not continue to next turn

  puts "This is card number 3 out of #{cards.length}."
  # How to get it to return a number and not the instance?
  puts "Question: #{cards.??}"

  answer_3 = gets.chomp
  # Should I call on the take_turn method here?
  puts answer_3

  # if answer_3 == correct?
  # puts turn.feedback
  # call on the round.deck.length?? if == 0 game end if not continue to next turn

  if round.deck.length == 0

    puts "****** Game over! ******"
    puts "You had #{number_correct} correct guesses out of #{cards.length} for a total score of #{percent_correct}."
  # fix the above methods to call on them correctly

    puts "#{category} - #{percent_correct_by_category}% correct"
    puts "#{category} - #{percent_correct_by_category}% correct"
    puts "#{category} - #{percent_correct_by_category}% correct"
  # fix the above methods to call on them correctly
  end

  # can this whole thing be a while loop?


end

start
