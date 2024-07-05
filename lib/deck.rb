require './lib/card'
require './lib/turn'

class Deck
    attr_reader :cards,
                :count,
                :cards_in_category

    def initialize(cards)
        @cards = cards
        @count = @cards.length
    end

    def cards_in_category(category)
        matching_cards = []
        @cards.each {|card|
            if card.category == category
                matching_cards.push(card)
            end
            puts "test"
        }
        return matching_cards
    end
end