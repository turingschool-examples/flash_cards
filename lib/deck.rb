require './lib/card.rb'

class Deck

    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def count
        @cards.count
    end

    def cards_in_category(category)
        matched_cards = []
        @cards.each do |card|
            if card.category == category
                matched_cards << card
            end
        end
        matched_cards
    end
end