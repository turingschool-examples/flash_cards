class Deck
    attr_reader :cards,
                :count

    def initialize(cards)
        @cards = cards
        @count = cards.length
    end

    def cards_in_category(specific_category)
        @cards.select do |card|
            card.category == specific_category
        end
    end
end

