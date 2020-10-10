require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'



def start
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography) 
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)

puts "Welcome! You're playing with #{@deck.count} cards.\n
--------------------------------------------------\n"

   
    until @round.turns.count == @deck.count
        puts "This is card number #{@round.turns.count+1} out of #{@deck.count}"
        puts "Question: #{@round.current_card.question}"
    
        user_guess = gets.chomp
        turn = Turn.new(user_guess, @cards) 
        
    
        user_guess == @round.current_card.answer
    
        @round.take_turn(user_guess)
        puts  @round.turns.last.feedback
        

        
    end

    puts "****** Game Over! ******"
    puts "You had #{@round.number_correct} guesses out of #{@deck.count} for a total of #{@round.percent_correct.round(0)}%"
    puts "Category Statistics:\n"
    puts "STEM - #{@round.percent_correct_by_category}"
   
    
end

start

