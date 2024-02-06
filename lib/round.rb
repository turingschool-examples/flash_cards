require 'pry'
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
        turn = Turn.new(guess, current_card) 
        @turns << turn
        turn
    end

    def number_correct
        # have a turn
        # have a card
        @turns.count {|turn| turn.correct?}
    end

    # def number_correct_by_category

    # end

    # def percent_correct

    # end

    # def percent_correct_by_category

    # end
end