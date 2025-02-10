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
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @deck.cards.shift
        new_turn
    end

    def number_correct
       @turns.count do |turn|
        turn.correct?
       end
    end 

    def number_correct_by_category(category)
        @turns.count do |turn|
            turn.card.category == category && turn.correct?
        end
    end

    def percent_correct
        (number_correct.to_f/@turns.count) * 100
    end

    def percent_correct_by_category(category)
        total_in_category = @turns.count do |turn|
            turn.card.category == category
        end
        (number_correct_by_category(category).to_f/total_in_category) * 100
    end
end