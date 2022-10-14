require './lib/turn'
require './lib/card'

class Round
    attr_reader :deck, 
                :turns, 
                :number_correct

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end

    def current_card
        @deck.cards.shift
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns << turn
            if turn.correct? == true
                @number_correct += 1
            end
        turn
    end

    def number_correct_by_category(category)
        
    end

    def percent_correct
        (@number_correct.to_f / @turns.length.to_f) * 100
    end
end