require './lib/deck'

class Round
    attr_accessor :deck,
                  :turns

    def initialize (deck)
        @deck = deck
        @turns = []
    end


end