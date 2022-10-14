require './lib/turn'
require './lib/card'

class Round
    attr_reader :deck, 
                :turns

    def initialize(deck, turns = [])
        @deck = deck
        @turns = turns
    end

    def current_card
        @deck.cards[@turns.length]
    end

    def take_turn(guess)
        turn = Turn.new(guess, current_card)
        @turns << turn
        turn
    end
end