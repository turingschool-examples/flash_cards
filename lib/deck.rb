class Deck
    
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def count
        @cards.length
    end

    def cards_in_category(category)
        if @cards[0].category == category
            return @cards[0]
        end
    end

    # def cards_in_category(category)
    #     if cards.any?(category)
            
    #     end
    # end
end