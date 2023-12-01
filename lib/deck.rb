
class Deck
    attr_reader :cards
    
    def initialize (cards)
        @cards = cards
    end

    def cards_in_category(cat)
        cards_in_cat = []
        
        @cards.each_index do |index|
           
            if (@cards[index].category) == cat
                cards_in_cat << @cards[index]
            end
       
        end
        
        cards_in_cat
    end
end