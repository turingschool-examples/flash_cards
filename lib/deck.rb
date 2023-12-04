class Deck
    attr_reader :cards
    
    def initialize(cards)
        @cards = cards
    end

    def return_cards_based_on_category(category)
        @cards.select { |card| card.category == category }
    end

    def cards
end