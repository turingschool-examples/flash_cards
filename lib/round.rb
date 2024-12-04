class Round
    attr_reader :deck
    attr_reader :turns
    attr_reader :number_correct

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end

    def current_card
        deck.cards[0]
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)

        if turn.correct?
            @number_correct += 1
        end

        @deck.cards.shift()

        @turns << turn
        turn
    end

    def number_correct_by_category(category)
        correct = 0
        for turn in @turns
            if turn.card.category == category && turn.correct?
                correct += 1
            end
        end
        correct
    end
end