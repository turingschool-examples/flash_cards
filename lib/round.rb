require './lib/card'

require './lib/turn'

require './lib/deck'

class Round
    def initialize(deck)
        @deck = deck
    end

    def current_card
        return @deck.cards[0]
    end
end