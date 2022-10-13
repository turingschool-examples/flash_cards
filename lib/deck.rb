require './lib/turn'
require './lib/card'

class Deck
    attr_reader :cards
    
    def initialize(cards)
        @cards = cards
    end

    def count
        cards.count
    end

    def cards_in_category(category)
        filtered_cards = []
        @cards.each do |card|
            if card.category == category
                filtered_cards << card
            end
        end
        filtered_cards
    end
end