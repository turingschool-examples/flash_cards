class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def count
        @cards.size
    end
end