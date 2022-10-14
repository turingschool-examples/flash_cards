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

until round.cards_already_played.size == round.deck.cards.size

  puts "This is card number #{round.cards_already_played.length + 1} out of #{cards.length}."
  puts "Question: #{round.current_card.question}"

  answer = gets.chomp
  turn = round.take_turn(answer)

  puts turn.feedback

end
    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{cards.length} for a total score of #{round.percent_correct}%."


    puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
    puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
    # refactor to make the categories above variables(dynamic)
#   end

end

start
