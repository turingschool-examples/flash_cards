class Round
    attr_reader :deck,
                :turns

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        index = @turns.length
        @deck.cards[index]
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns << turn
        return turn
    end

    def number_correct
        @turns.find_all do |turn|
            turn.correct? == true
        end.length
    end

    def number_correct_by_category(category)
        @turns.find_all do |turn|
            turn.correct? == true && turn.card.category == category
        end.length
    end

    def percent_correct
        (number_correct.to_f/@turns.length)*100
    end

    def percent_correct_by_category(category)
        correct_count = number_correct_by_category(category)
        category_count = (@deck.cards_in_category(category)).length
        (correct_count.to_f/category_count)*100
    end
end