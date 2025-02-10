require 'pry'
class Round 
    attr_reader :deck, :turns, :current_index

    def initialize(deck)
        @deck = deck
        @turns = []
        @current_index = 0
    end

# current_card want it to be the first card in the deck
# then once the first card is answered we want it to move to the next card in the deck - move index spots
#accesses the array and returns the first card in the array
    def current_card
        @deck.cards[current_index]
    end

# .take_turn accepts an argument of a guess
# new_turn  needs to be of the Turn class to access the instance guess - guess needs to be an arguent to store the players answer and argument of current_card to regonize what card is being answered
#@turns << new_turn is storing the turns taken to keep track 
# it needs to move to the next unaswered card while keeping all cards
#it needs to stop once the last card is answered
    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn

        @current_index += 1
        new_turn
    end

    def number_correct
     @turns.count do |turn|
       turn.correct?
      end
    end 

    def number_correct_by_category(category)
        @turns.count do |turn|
            turn.card.category == category && turn.correct?
        end
    end

    def percent_correct
        (number_correct.to_f/@turns.count) * 100
    end

    def percent_correct_by_category(category)
        total_in_category = @turns.count do |turn|
            turn.card.category == category
        end
        return 0 if total_in_category.zero?

        (number_correct_by_category(category).to_f/total_in_category) * 100

    end

    def start
        puts "Welcome! You're playing with #{deck.count} cards."
        puts "---------------------------------------------------------"

        @deck.cards.each_with_index do |card, index|
        puts "This is a card number #{index + 1} out of #{deck.count}"
        puts "Question #{card.question}"
        
        guess = gets.chomp
        turn = take_turn(guess)

        puts turn.feedback
        puts "----------------------------------------------------------"
        end

        puts "****** Game over! ******"
        puts "You had #{number_correct} correct guesses out of #{deck.count} for a total score of #{percent_correct}"
    
        categories = @deck.cards.map do |card|
        card.category
        end
        categories.each do |category|
        puts "#{category} - #{percent_correct_by_category(category).to_i}% correct"
        end
    end

end

