class Deck

    attr_reader :cards, :count

    def initialize(cards)
        @cards = cards #cards should be an array
    end

    def count
        @cards.count
    end
end