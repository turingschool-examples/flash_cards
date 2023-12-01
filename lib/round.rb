require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'

class Round

    attr_reader :deck, :turns

    def initialize(deck)
        @deck = deck
        @turns = []
    end

    def current_card
        @deck.cards.first
    end
end
