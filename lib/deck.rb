class Deck
    attr_reader :cards
    def initialize(cards)
        @cards = cards
    end

    def count
        cards.count
    end

    def cards_in_category(category)
        card_categories = []
        cards.each do |card|
            card_categories << card.category
        end
        card_categories.count(category)
    end
end