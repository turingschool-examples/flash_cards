class Deck
    attr_reader :cards

    def initialize (cards)
        @cards = cards
    end

    def count
        @cards.length
    end

    def cards_in_category (category_entry)
        category_house = []
        @cards.each do |card|
        if card.category == category_entry
            category_house << card
            end
        end
        category_house
    
    end

end
