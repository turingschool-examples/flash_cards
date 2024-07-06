class Deck

    attr_reader :cards, :count, :category, :cards_in_category

    def initialize(cards)
        @cards = cards #cards should be an array
    end

    def count
        @cards.count
    end

    def cards_in_category(category)
        @cards.select {|card| card.category == category}        
    end

end