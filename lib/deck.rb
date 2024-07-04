class Deck
    attr_reader :cards,
                :count,
                :categories
    
    def initialize(cards)
        @cards = cards
        @count = cards.count
        @categories = []
    end

    def cards_in_category(category)
        cards_matched = @cards.select{|element| element.category == category}
    end

    def get_categories
        for card in @cards
            if !(@categories.include?(card.category)) 
                @categories.push(card.category)
            end
        end
    end
end
