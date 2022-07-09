class Round
    attr_reader :deck, :turns
    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        deck.cards[0] 
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @deck.cards.rotate!
        new_turn 
    end

    def number_correct
        @turns.count do |turn|
            turn.correct?
        end
    end

    def number_correct_by_category(category)
        @turns.count do |turn|
            turn.correct? && turn.card.category == category
        end
    end

    def percent_correct
        number_correct.to_f / @turns.count.to_f * 100.0
    end

    def percent_correct_by_category(category)
        total_turns_by_category = @turns.count do |turn|
            turn.card.category == category 
        end
        number_correct_by_category(category).to_f / total_turns_by_category.to_f * 100.0
    end
end
