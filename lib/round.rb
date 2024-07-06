require './lib/deck'
require './lib/turn'

class Round
    attr_reader :deck,
                :turns
    
    def initialize(deck)
        @deck = deck
        @turns = []
        
    end
end