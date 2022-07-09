require './lib/turn'
require './lib/deck'
class Round
    attr_reader :deck,
                :turns,
                :number_correct

    def initialize(deck, turns = [])
        @deck = deck
        @turns = turns
        @current_card_index = 0
    end

    def current_card
        @deck.cards[@current_card_index]
    end

    def take_turn(guess) #takes a string representing the guess
        card = self.current_card #defining the card for this turn
        @current_card_index += 1 #the Round should move on to the next card
        new_turn = Turn.new(guess, card) #creates a new Turn object with the guess and card
        @turns << new_turn #stores the new Turn object and return it
        return new_turn
    end

    def number_correct
        correct = 0
        @turns.each do |turn|
            if turn.correct?
                correct += 1
            end
        end
        return correct
    end

    def percent_correct
        correct = 0.0
        incorrect = 0.0
        @turns.each do |turn|
            if turn.correct?
                correct += 1
            else incorrect += 1
            end
        end
        return correct / (correct + incorrect) * 100        
    end


    def number_correct_by_category(category)
        correct = 0.0
        incorrect = 0.0
        
        @turns.each do |turn|
            if turn.card.category == category
                if turn.correct?
                    correct += 1
                else 
                    incorrect += 1
                end
            end 
        end
        return correct         
    end

    def percent_correct_by_category(category)
        correct = 0.0
        incorrect = 0.0
        
        @turns.each do |turn|
            if turn.card.category == category
                if turn.correct?
                    correct += 1
                else 
                    incorrect += 1
                end
            end 
        end
        return correct / (correct + incorrect) * 100          
    end
end  
