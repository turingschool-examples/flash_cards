class Deck
    attr_reader :cards
    def initialize(cards)
        @cards = cards
    end

    def count
        @cards.length
    end

    def cards_in_category(category)
        @cards.select{|card| card.category == category}
    end

    def categories
        cat = []
        @cards.each do |card|
            cat << card.category 
        end
        cat.uniq!
    end
end