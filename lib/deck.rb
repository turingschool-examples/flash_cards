class Deck
    attr_reader :cards
    # attr_reader is a method.

    def initialize(array_of_card_objs)
        @cards = array_of_card_objs.to_a 
    end

    # def cards
    #     @array_of_card_objs
    #     # I think I did this wrong, because the attr_reader is supposed to get rid of the need for this method right?
    # end

    def count
        @cards.length
    end

    def cards_in_category(category_query)
        cards_in_category = []
        @cards.each do |card|
            # require 'pry'; binding.pry
            if category_query == card.category 
                cards_in_category << card
            end
        end
        return cards_in_category
    end



end
