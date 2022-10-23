

class Deck
    attr_reader :cards
    def initialize(cards)
    @cards = cards
    end 

    def count 
        cards.length
    end 

    def cards_in_category(category)
        final_count = []
        cards.each do |card|
            if card.category == category
                final_count << category
            end 
        end 
        final_count.count
        
    end 
end 

        
            
        
        