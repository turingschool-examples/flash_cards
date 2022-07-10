#   require './lib/card'
#   require './lib/turn'
#require 'pry'; binding.pry

class Deck

    attr_reader  :cards, :count, :cards_in_category

    def initialize(cards)
       @cards = cards

    end

    def count
        return @cards.count
    end

# ################*************************************NEED HELP HERE
# look for card category, if it matches, print that card.
    def cards_in_category (category)
        card_cat =[]
        @cards.each do |card|
            if @card.category == @category
                card_cat << card
            end
        end
        card_cat
    end


    # def cards_in_category(category)
    #     if cards.category == (":Geography")
    #         return [@card_1]
    #     elsif cards.category == (":STEM")
    #         return [@card_2, @card_3]
    #     else return [ ]
    #     end
    # end 



    # #    returned_cards= ()
    #     @cards.find_all do |card|
    #         card.category == catagory
    #         # returned_cards << card 
    #     end
        
end