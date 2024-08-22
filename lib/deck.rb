class Deck
    attr_reader :deck

    def initialize(deck)
        @deck = deck
    end

    def cards_in_category(category_request)
        @deck.map do |card|
            in_category = []
            if category_request == card.category
               
            end
            in_category
        end
        
    end

end
