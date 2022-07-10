class Round
    attr_reader :deck
    attr_reader :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end


    def current_card 
        @deck.cards[@turns.count]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        if new_turn.correct?
            @number_correct += 1
        end
        new_turn
    end
    
    def number_correct
        @number_correct
    end
    
    def number_correct_by_category(category)
        @turns.count do |turn|
            turn.card.answer == turn.guess && turn.card.category == category
        end
    end


    def percent_correct
        @number_correct.to_i / @turns.count.to_i * 100.0
    end

    def percent_correct_by_category(category)
        total_turns_by_category = @turns.count do |turn|
            turn.card.category == category 
        end
        100*number_correct_by_category(category).to_i / total_turns_by_category.to_i
    end
end

