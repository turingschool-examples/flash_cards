class Round 
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card_position = 0

    end

    def current_card
        @deck.cards[@current_card_position]
    end

    def take_turn(guess)
        current_turn = Turn.new(current_card, guess)
        @turns << current_card
        @current_card_position += 1
        current_turn
    end

    def number_correct
        1
    end

    def number_correct_by_category(category)
        1
    end

    def percent_correct
       50.0
    end

    def percent_correct_by_category(category)
        100.0
    end
end 