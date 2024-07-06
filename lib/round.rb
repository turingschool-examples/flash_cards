require './lib/deck'
require './lib/turn'

class Round
   attr_reader :deck
    
    def initialize(deck)
        @deck = deck
        
    end
end