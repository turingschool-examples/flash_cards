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

end