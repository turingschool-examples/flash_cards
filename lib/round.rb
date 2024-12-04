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
        @turns.each do |turn|
            if turn.card.category == category && turn.correct?
                correct += 1
            end
        end
        correct
    end

    def percent_correct
        correct = 0.00
        @turns.each do |turn|
            if turn.correct?
                correct += 1
            end
        end
        ((correct/turns.size) * 100).round(2)
    end

    def percent_correct_by_category(category)
        correct = number_correct_by_category(category).to_f
        turns = []
        @turns.each do |turn|
            if turn.card.category == category
                turns << turn
            end
        end
        ((correct/turns.length) * 100).round(2)
    end
end