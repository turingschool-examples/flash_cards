require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card1 = Card.new()
card2 = Card.new()

deck = Deck.new()
round = Round.new

def start

end

puts "Welcome! You're playing with #{deck.length} cards.\n
-------------------------------------------------"

start

puts "****** Game over! ******\n
You had #{number_correct} correct guesses out of #{round.turns.length} for a total score of #{percent_correct}.\n
#{category1} - #{percent_correct_by_category}% correct\n
#{category2} - #{percent_correct_by_category}% correct\n
#{category3} - #{percent_correct_by_category}% correct
"

