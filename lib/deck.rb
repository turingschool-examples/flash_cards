require './lib/card'

class Deck

    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def count
        @cards.length
    end

    def cards_in_category(category)
        returned_cards = []
        @cards.each do |card|
            if card.category == category
                returned_cards << card
            end
        end
        returned_cards
    end
    
end
