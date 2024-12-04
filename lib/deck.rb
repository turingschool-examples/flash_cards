class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def count
        @cards.size
    end

    def cards_in_category(category)
        category_cards = []
        for card in @cards
            if card.category == category
                category_cards << card
            end
        end
        category_cards
    end
end