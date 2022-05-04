require 'pry'

class Deck 
    attr_reader :cards, :count
    def initialize(cards)
        @cards = cards
    end

    def count
        @cards.length
    end

    def cards_in_category(category)
        card_same_category = []
            @cards.each do |card|
                if card.category == category
                    card_same_category << card
                end
            end
        card_same_category
    end
end