require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# Create cards
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

# Put cards in a deck
deck = Deck.new([card_1, card_2, card_3])

# Start a new round
round = Round.new(deck)

def start(round)
    puts "Welcome! You're playing with #{round.deck.count} cards."
    puts "--------------------------------------------------"

   
    puts "This is card number #{card += 1} out of #{round.deck.count}."
    puts "Question: #{card.question}"
    guess = gets.chomp
    turn = round.take_turn(guess)
    puts turn.feedback
    
    

    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{round.turn.count} for a total score of #{round.percent_correct}%."

end

puts start(round)
