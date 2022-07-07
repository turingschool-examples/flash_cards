class Deck
    attr_reader :cards, :card_categories
    def initialize(cards)
        @cards = cards
        @card_categories = []
    end

    def count
        cards.count
    end

    def cards_in_category(category)
        cards.select { |card| card.category == (category) }
    end

    # def card_categories_count(category)
    #     card_categories.count(category)
    # end
end