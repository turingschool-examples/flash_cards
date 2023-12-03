
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

    def categories_in_deck
        n = 0
        cat_in_deck = []
        @cards.count.times do
          cat_in_deck << @cards[n].category
        n += 1
        end
        cat_in_deck.uniq
    end
    
end