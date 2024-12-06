class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
            cards = []
        @card 
    end

    def count
        cards.count
    end

    def cards_in_category(category)
        cards.find_all do |card|
            card.category == category
        end
    end
end