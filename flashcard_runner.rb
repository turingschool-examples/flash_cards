require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'


def start
    cards = CardGenerator.new("cards.txt").cards
    deck = Deck.new(cards)
    round = Round.new(deck)

    puts "Welcome! You are playing trivia with 5 cards."
    puts "---------------------------------------------"

    card_number = 1
    loop do 
        card = round.current_card
        puts "This is card number #{card_number} out of #{deck.count}."
        puts card.question        
        guess = gets.chomp.capitalize         
        turn = round.take_turn(guess)                  
        puts turn.feedback
        card_number += 1
    
        if round.current_card == nil
            break
        end
    end

    puts "****** Game over! ******
    You had #{round.number_correct} correct guesses
    out of #{deck.count} for a total score of #{round.percent_correct}% correct."
    puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
    puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
end
    
start





        