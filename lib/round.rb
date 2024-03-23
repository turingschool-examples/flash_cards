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
        @turns << new_turn #store_turn method?
        @number_correct += 1 if new_turn.correct?
        @deck.cards.rotate!
        new_turn
    end
end