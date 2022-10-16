class Round
    attr_reader :deck, :turns, :number_correct, :feedback

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
        @feedback
    end

    def current_card
        @deck.current_card
    end

    def take_turn(guess, card = current_card)
        turn = Turn.new(guess, card)
        @number_correct += 1 if turn.correct?
        @feedback = turn.feedback
        @turns << turn
        deck.change_card
        turn
    end

    def number_correct_by_category(category)
        turns.count{|turn| turn.correct? && turn.card.category == category} 
    end

    def percent_correct
        (@number_correct.fdiv(@turns.length) * 100.0).round(1)
    end

    def percent_correct_by_category(category)
        (number_correct_by_category(category).fdiv(@deck.category_data[category].length) * 100.0).round(1)
    end

end
