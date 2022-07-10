class Deck
    attr_reader :cards, :category

    def initialize(cards)
        @cards = cards
    end

    def cards_in_deck
        cards.count
    end

    def cards_in_category(category)
        card_count = []
        cards.each do |card|
            card_count << card.category
        end
        card_count.count(category)
    end
end