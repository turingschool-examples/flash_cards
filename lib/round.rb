class Round
    attr_reader :deck, :turns, :number_correct

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end

    def current_card
        @deck.cards[0]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @number_correct += 1 if new_turn.correct?
        @deck.rotate_cards
        new_turn
    end

    def number_correct_by_category(category)
        @turns.map {|turn| turn.card.category if turn.correct?}.count(category)
    end

    def percent_correct
        (@number_correct.to_f / @turns.length) * 100
    end

    def percent_correct_by_category(category)
        cards_in_category = @turns.select {|turn| turn.card.category == category}.count
        (number_correct_by_category(category).to_f / cards_in_category) * 100
    end
end