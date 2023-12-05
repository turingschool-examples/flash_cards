class Deck
    # attr_reader :cards
    def initialize(card1, card2, card3)
        @card1 = card1
        @card2 = card2
        @card3 = card3
    end
    
    def cards
        [@card1, @card2, @card3]
    end

    def count
        cards.length
    end

    def cards_in_category(category)
        cards.select { |card| card.category == category }
    end
end