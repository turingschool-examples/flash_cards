class Deck
    attr_reader :cards,
                :count,
                :categories
    
    def initialize(cards)
        @cards = cards
        @count = cards.count
        @categories = get_categories
    end

    def cards_in_category(category)
        cards_matched = @cards.select{|element| element.category == category}
    end

    def get_categories
        @categories = []
        cards.each do |card|
            @categories << card.category
        end
        @categories.uniq!
    end
end
