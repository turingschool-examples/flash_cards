
require 'pry'


class Round
    attr_reader :deck , :turns , :number_correct 
    def initialize(deck, turns = [])
        @deck = deck
        @turns = turns
        @number_correct = 0
      
    end


    def first_card
        deck.cards[0]
    end

    def take_turn(guess)
        turn_test = Turn.new(guess, current_card)

        if turn_test.correct?
            @number_correct += 1
        end
        @turns << turn_test
        turn_test
        
    end

    def current_card
        deck.cards[@turns.length]
    end

    def number_correct_by_category(category)
        @turns.find_all {|turn| turn.correct? && turn.card.category == category}.count
        
    end

    def percent_correct
        (@number_correct.to_f / @turns.count.to_f ) *100
    end

    def percent_correct_by_category(category)
        (number_correct_by_category(category) / @turns.count.to_f  ) * 100
    end

    

end