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
        correct_num = @turns.select {|turn| turn.correct?}
        correct_num.length
    end
        
end