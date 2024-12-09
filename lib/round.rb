class Round
    attr_reader :deck, :turns, :turns_taken, :number_correct
    def initialize(turn)
        @deck = deck
        @turns = []
        @turns_taken = 0
        @number_correct = 0
    end

    def current_card
        @deck.cards.first
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns << new_turn
        @turns_taken += 1
    end

    def number_correct
        guess == card.answer
        if guess.correct?
            @number_correct + 1
        end
    
    end
end
