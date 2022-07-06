class Round
    attr_reader :deck, :turns, :number_of_rounds, :number_correct
    def initialize(deck)
        @deck = deck
        @turns = []
        @number_of_rounds = 0
        @number_correct = 0
    end

    def current_card
        deck.cards.at(number_of_rounds)
    end

    def take_turn(guess)
        current_turn = Turn.new(guess, current_card)
        turns << current_turn
        @number_of_rounds += 1
        if current_turn.correct? == true
            @number_correct += 1
        end
        return Turn.new(guess, current_card)
    end

end
