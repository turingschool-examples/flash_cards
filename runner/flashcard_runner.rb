require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card1 = Card.new(["What is 5 + 5?", 10, STEM])
card2 = Card.new(["What is Rachel's favorite animal?", panda, Turing Staff])
card3 = Card.new(["What is Mike's middle name?", "nobody knows", Turing Staff])
card4 = Card.new(["What cardboard cutout lives at Turing?", "Justin Bieber", Pop Culture])
deck = Deck.new(card1, card2, card3, card4)
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

