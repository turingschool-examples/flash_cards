require "./lib/card"
require "./lib/turn"
require "./lib/deck"

class Round
    attr_reader :deck

    def initialize(deck)
        @deck = deck
    end
end