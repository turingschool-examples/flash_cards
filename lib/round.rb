require './lib/deck'
require './lib/card'
require './lib/turn'

class Round
    attr_reader :deck, :turns, :turns_taken
    attr_accessor :number_correct, :number_correct_by_category, :geography_correct, :stem_correct
    def initialize(anything)
        @deck = anything
        @turns = []
        @turns_taken = 0
        @number_correct = 0
        @geography_correct = 0
        @stem_correct = 0
    end

    def current_card
        @deck.cards.first
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @turns_taken += 1
        if new_turn.guess == current_card.answer
            @number_correct = @number_correct + 1 #(shorthand is +=)
        end 
        if new_turn.guess == current_card.answer
            # if card.category == "Geography"
            @geography_correct += 1
        elsif card.category = "STEM"
            #if card.category = "STEM"
            @stem_correct += 1
        end
        return new_turn
    end

    def number_correct
        @number_correct
    end

    def percent_correct
        @turns_taken / @number_correct
    end

    def number_correct_by_category
        #if correct, check which category in instance array and +1 to corresponding value
        
    end

    def percent_correct_by_category
        @turns_taken / 
    end

end
