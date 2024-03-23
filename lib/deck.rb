require './lib/card.rb'

class Deck

    attr_reader :cards, :count

    def initialize(cards)
        @cards = cards
        @count = count
    end

    def count
        @count = cards.count
    end

    def cards_in_category(category)
        @cards.select { |card| card.category == category }

    end

    def count_of_cards_in_category(category)
        @cards.count { |card| card.category == category }
    end
end