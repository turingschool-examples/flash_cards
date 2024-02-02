require './lib/card'

class Deck
    attr_reader :cards

    def initialize(cards = [])
        @cards = cards
    end

    def cards_in_category(category_name)
        @cards.select do |card|
            card.category == category_name
        end
    end

end