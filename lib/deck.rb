
class Deck
    attr_reader :cards
    
    def initialize (cards)
        @cards = cards
    end

    def cards_in_category(cat)
        cards_in_cat = []
        
        @cards.each do |card|
           
            if card.category == cat
                cards_in_cat << card
            end
       
        end
        
        cards_in_cat
    end

    def categories_in_deck
        cat_in_deck = []
        
        @cards.each do |card|
          cat_in_deck << card.category
        end
        
        cat_in_deck.uniq
    end
    
end