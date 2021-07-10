require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
deck = Deck.new([card_1, card_2, card_3])
round = Round.new(deck)

def start(round)

  puts "Welcome! You're playing with #{round.deck.count} cards"
  puts "-------------------------------------------------"

  while round.turns.length >= 0
    puts "This is card number #{round.turns.length + 1} out of #{round.deck.count}."
    puts "Question: #{round.current_card.question}"
    round.take_turn(gets.chomp)
    puts round.turns.last.feedback
  end


  # # round.take_turn(guess)
  # # #
  # # # puts {}
  # # #
  # puts "****** Game over! ******"
  # puts "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct}."
  # #
  # # for each |category|
  # puts "#{turn.card.category} - #{round.percent_correct_by_category(category)}% correct"

end

start(round)
