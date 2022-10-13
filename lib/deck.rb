class Deck

    attr_reader :cards

    def initialize(cards) #cards is an array of Card objects
        @cards = cards
    end

    def count
        @cards.size
    end

    def cards_in_category(specific_category)
        arr = []
        @cards.each do |card|
            if card.category == specific_category
                arr << card
            end
        end
        return arr
    end

end
