class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def count
        @cards.count
    end

    def cards_in_category(category)
        category_cards = []
        @cards.find_all do |card|
            if card.category == category
                category_cards << card
            end
        end
        category_cards
    end
end