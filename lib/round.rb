class Round
    attr_reader :deck, :turns, :current_card
    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card = @deck.cards.first
        @number_correct = 0
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, @current_card)
        @turns << new_turn
        @number_correct += 1 if new_turn.correct?
        @current_card = deck.cards[@turns.size]
        new_turn
    end

    def number_correct
        @number_correct
    end

    def number_correct_by_category(category)
        @turns.count { |turn| turn.correct? && turn.card.category == category}
    end

    def percent_correct
        (@number_correct.to_f / @turns.size) * 100
    end

    def percent_correct_by_category(category)
        turns_in_category = @turns.select {|turn| turn.card.category == category}
        correct_in_category = turns_in_category.count {|turn| turn.correct?}
        (correct_in_category.to_f / turns_in_category.size) * 100
    end

end