require './lib/card.rb'

class Deck
    attr_reader :cards
    def initialize(cards_input)
        @cards = cards_input
    end

    def count
        @cards.length
    end

    def cards_in_category(category)
        return_array = []
        @cards.each {|card|
            if card.category == category
                return_array.append(card)
            end
        }
        return_array
    end

    def add_card(card)
        @cards.append(card)
    end
end