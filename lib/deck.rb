class Deck
    attr_reader :cards,
                :count
    
    def initialize(cards)
        @cards = cards
        @count = cards.count
    end

    def cards_in_category(category)
        cards_matched = @cards.select{|element| element.category == category}
    end


end
