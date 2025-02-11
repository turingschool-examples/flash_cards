require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'


def start_game
    filename = "./cards.txt"

    cards = CardGenerator.new(filename).cards
   
    deck = Deck.new(cards)

    round = Round.new(deck)

    puts "Welcome to the flashcards game! You are playing with #{cards.length} cards."
    puts ""

    card_number = 0
    n = cards.length

    
    n.times do 
        puts "This is card number #{card_number += 1} out of 4 cards"
        puts "Question: #{round.current_card.question}"
        guess = gets.chomp
        round.take_turn(guess)
        puts round.turns.last.feedback
        puts
    end
    

    puts "****** GAME OVER ******"

    puts "You had #{round.number_correct} guesses out of 4 for a total score of #{round.percent_correct}%"

    puts "STEM - #{round.percent_correct_by_category("STEM\n")}% correct."
    puts "Turing_Staff - #{round.percent_correct_by_category("Turing_Staff\n")}% correct."
    puts "Pop_Culture - #{round.percent_correct_by_category("Pop_Culture\n")}% correct."
    


end

start_game

#output question
#take guess input from user
#compare guess to answer
#output correct or incorrect
#move on to next question
#after all cards are done output total correct guesses
#output total percent correct
#output percent correct by category