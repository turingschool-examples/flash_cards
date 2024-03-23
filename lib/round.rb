require './lib/deck'
require './lib/card'

class Round

    attr_reader :deck

    def initialize(deck)
        @deck = deck
    end

end