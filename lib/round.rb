class Round
    attr_reader :deck, :turns, :turns_taken, :number_correct 
    def initialize(deck)
        @deck = deck
        @turns = []
        @turns_taken = 0
        @number_correct = 0
    end
    def current_card
        @deck.cards[@turns_taken]
    end
    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        if new_turn.correct?
            @number_correct += 1
        @turns_taken += 1
        new_turn
        end
    end
    def number_correct_by_category(category)
        @turns.count 
        turn.card.category == category && turn.correct?
    end
    def percent_correct
        (@number_correct/@turns) *100
    end
    def percent_correct_by_category(category)
        #(number_correct_by_category(category)/
    end
end