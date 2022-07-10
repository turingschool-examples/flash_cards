require './lib/deck'
require './lib/turn'
require './lib/card'
#require 'pry'; binding.pry

class Round

    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
       
    end

    def current_card
        @deck.cards.first
    end


    def take_turn(guess)
        new_turn = Turn.new(guess, @card)
            @turns<< new_turn

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



    def number_correct_by_category
    end

    def percent_correct
        number_correct = 0
       
        @turns.each do |turn|
            if turn.correct?
                number_correct += 1
            end
        end
        percent_correct = (number_correct/@round.turns).to_f *100
        return percent_correct_by_category
    end

    def percent_correct_by_category
    end

end
