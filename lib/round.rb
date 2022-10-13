require './lib/turn'
require './lib/card'
require './lib/deck'

class Round
    attr_reader :deck, :turns, :number_correct

    def initialize(deck)
        @deck = deck
        @turns = []
        @number_correct = 0
    end

    def current_card
        current_card = @deck.cards
        current_card[0]
    end

    def take_turn(answer)
        new_turn = Turn.new(answer, current_card)
        @turns << new_turn
        if new_turn.correct?
            @number_correct += 1
        end
        return new_turn
    end
end