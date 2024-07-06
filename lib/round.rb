require './lib/deck'
require './lib/turn'

class Round
    attr_reader :deck,
                :turns, 
                :current_card
    
    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card = @deck.cards[0]
    end
end