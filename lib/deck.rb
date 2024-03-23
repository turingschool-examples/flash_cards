class Deck

    attr_reader :cards, :count

    def initialize(cards)
        @cards = cards
        @count = count
    end

    def count
        @count = cards.count
    end
end