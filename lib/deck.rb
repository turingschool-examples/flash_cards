class Deck 
    attr_reader :cards   

    def initialize(cards)
        @cards = cards 
    end 

    def cards_in_category(category)
        @cards.select do 
            |card| card.category == category
        end  
    end 

    def count 
        @cards.count 
    end 

end 