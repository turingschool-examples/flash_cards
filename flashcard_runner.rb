require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require 'pry'


def start_game

    # card_1 = Card.new("what is 5 + 5", "10", :STEM)
    # card_2 = Card.new("what is Rachel's favorite animal?", "panda", :Turing_Staff)
    # card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
    # card_4 = Card.new("what cardboard cutout lives at Turing?", "Justin Bieber", :Pop_Culture)

    # cards = [card_1, card_2, card_3, card_4]
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
    end
    

    puts "****** GAME OVER ******"

    puts "You had #{round.number_correct} guesses out of 4 for a total score of #{round.percent_correct}%"

    puts " STEM - #{round.percent_correct_by_category("STEM\n")}% correct"
    puts " Turing_Staff - #{round.percent_correct_by_category("Turing_Staff\n")}% correct"
    puts " Pop_Culture - #{round.percent_correct_by_category("Pop_Culture\n")}% correct"
    #binding.pry


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