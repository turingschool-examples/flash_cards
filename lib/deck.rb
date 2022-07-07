class Deck
    attr_reader :cards

    def initialize(cards) 
        @cards = cards
    end 

    def count
        @cards.count 
    end 

    def cards_in_category(specific_category)
        @cards.select{|card| card.category == specific_category}
    end         
end