class Deck
    attr_reader :cards
    attr_reader :categories

    def initialize(cards)
        @cards = cards
        @categories = []

        for card in @cards
            if !@categories.include?(card.category)
                @categories << card.category
            end
        end
    end

    def count
        @cards.size
    end

    def cards_in_category(category)
        category_cards = []
        @cards.each do |card|
            if card.category == category
                category_cards << card
            end
        end
        category_cards
    end
end