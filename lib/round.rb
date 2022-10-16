require './lib/turn'
require './lib/card'
require './lib/deck'

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
        @deck.cards[@turns.count]
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
        @turns.find_all { |turn| (turn.card.category == category) && (turn.correct? == true) }.count
    end

    def percent_correct
        (@number_correct.to_f / @turns.length.to_f) * 100
    end
   
    def percent_correct_by_category(category)
        (number_correct_by_category(category).to_f / @deck.cards_in_category(category).count) * 100
    end
end