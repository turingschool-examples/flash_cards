class Round
    attr_reader :deck,
                :turns

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
        @deck.cards.rotate!
        new_turn
    end

    def number_correct
        correct_num = (@turns.select {|turn| turn.correct?}).length
    end
        
    def number_correct_by_category(category)
        correct_num = (@turns.select {|turn| turn.correct? && turn.card.category == category}).length
    end

    def percent_correct
        correct_num = (@turns.select {|turn| turn.correct?}).length

        ((correct_num.to_f / @turns.length) * 100).round(1)
    end

    def percent_correct_by_category(category)
        correct_num = (@turns.select {|turn| turn.correct? && turn.card.category == category}).length
        category_total = (@turns.select {|turn| turn.card.category == category}).length
        ((correct_num.to_f / category_total) * 100).to_f.round(1)
    end

end