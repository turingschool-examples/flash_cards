class Deck
    attr_reader :card, :cards

    def initialize(cards)
        @cards = cards
    end

    def count
        @cards.length
    end

    def cards_in_category(category)
        @cards.select do |card|
        category == card.category
        end
    end
end