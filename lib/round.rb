require './lib/deck'
require './lib/turn'

class Round

    attr_reader :deck,
                :current_card,
                :turns

    def initialize(deck)
        @deck = deck
        @current_card = deck.first
        @turns = []
    end

end