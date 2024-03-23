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
        cards_in_category = @cards.count { |card| card.category == category }
    end
end