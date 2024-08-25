class Deck
    attr_reader :cards, :turns
    
    def initialize(cards)
        
        @cards = cards
        @turns = []

    end

    def count
        @cards.length
    end

    def cards_in_category(category)
        matching_category = []

        @cards.each do |card|
            if card.category == category
                matching_category << card
            end
        end
        matching_category
    end
end