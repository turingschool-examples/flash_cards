class Deck 
    attr_reader :cards
    def initialize(cards)
        @cards = cards

    end

    def count
        cards.count
    end

    def cards_in_category(category)
         newarray = []
        @cards.each do |card|
            if card.category == category
                 newarray << card
            end
        end 
        newarray
        
    end
end