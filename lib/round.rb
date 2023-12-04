require "./lib/card"
require "./lib/turn"
require "./lib/deck"

class Round
    attr_reader :deck, :turns, :guess

    def initialize(deck)
        @deck = deck
        @guess = guess
        @turns = []
        @active_card = 0
    end

    def current_card
        @deck.cards[@active_card]
    end

    def take_turn(guess)
        new_turn = Turn.new(guess, current_card)
        @turns.push(new_turn)
        @active_card = @active_card + 1
        new_turn
    end
end