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
        turn_new = Turn.new(guess, current_card)
            @turns << turn_new
            return turn_new
    end
 
    def number_correct
        correct = 0
        @turns.each do |turn_new|
            if turn_new.correct?
                correct += 1
            end
        end
        return correct
    end

    def number_correct_by_category(category)
        @turns.find_all do |card|
            @card.category == category
        end
    end



    # def percent_correct
    # def number_correct = 0
    #    @turns.each do |turn_new|
    #     if turn_new.correct? 
    #         number_correct += 1
    #         end
    #     end
    # end
        
        
    # def percent_correct = (number_correct/@round.turns).to_f *100
    #     return percent_correct_by_category
    # end

    # def percent_correct_by_category
    # end

end
