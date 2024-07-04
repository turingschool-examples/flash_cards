require './lib/card'
require './lib/turn'

class Deck
    attr_reader :cards,
                :length
    def initialize(cards)
        @cards = cards
        @count = @cards.length
    end
end