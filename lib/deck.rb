class Deck
    attr_accessor :cards

    def initialize(cards) 
        @cards = cards
    end 

    def count
        @cards.count 
    end 

    def cards_in_category(specific_category)
        @cards.select{|card| card.category == specific_category}
    end   
    
    def categories
        @cards.map {|card| card.category}.uniq
    end 
end