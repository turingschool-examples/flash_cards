require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What U.S. state is home to no documented poisonous snakes?", "Alaska", :Geography)
card_5 = Card.new("How many countries are there in the United Kingdom?", "4", :Geography)

deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
round = Round.new(deck)

def start
    puts "Welcome! You are playing trivia with 5 cards."
    puts "---------------------------------------------"
end
puts start

card_number = 1
loop do 
    card = round.current_card()
    puts "This is card number #{card_number} out of #{deck.count}."
    puts card.question        
    guess = gets().chomp().capitalize()         
    turn = round.take_turn(guess)                  
    puts turn.feedback
    card_number += 1
   
    if round.current_card() == nil
        break
    end
end

puts "****** Game over! ******
You had #{round.number_correct()} correct guesses
out of #{deck.count()} for a total score of #{round.percent_correct()}% correct."
puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
    






        