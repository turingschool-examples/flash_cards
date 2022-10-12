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
        card_storage = []
        if cards.include?(@category) == true then card_storage.push(card)
        else p card_storage
        end
    end
end
            