require './card'

class Deck
    attr_reader :cards, :cards_in_category
    def initialize(cards)
        @cards = cards
        @cards_in_category = []
    end

    def count
        return cards.count
    end

    def cards_in_category(category)
        @cards.each do |card|
            if
                category.downcase == card.category.downcase
                @cards_in_category << card
            end
        end
        return @cards_in_category
    end
end