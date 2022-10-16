require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is 10 + 10", "20", :Math)
card_5 = Card.new("Who is the best student ever?", "Issa", :Math)
deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
round = Round.new(deck)

def start(round)
  puts "Welcome! You have 5 cards"
  puts "--------------------------------------------------"
  round.deck.card.each do |card|
    puts "This is card #{round.turns.length + 1}"
    puts "Question: #{round.current_card.question}"
    guess = gets.chomp
    turnprime = round.take_turn(guess)
    puts turnprime.feedback

  end
  puts "GAME OVER"
  puts "You had #{round.number_correct} correct guesses out of #{round.turns.length} for a total of #{round.percent_correct}%"

  puts "Geography #{round.percent_correct_by_category(:Geography)}% Correct"
  puts "Math #{round.percent_correct_by_category(:Math)}% Correct"
  puts  "STEM #{round.percent_correct_by_category(:STEM)}% Correct"
end
start round
