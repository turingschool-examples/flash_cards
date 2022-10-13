require './lib/turn'
require './lib/card'
require './lib/deck'

class Round
    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        current_card = @deck.cards
        current_card[0]
    end
end