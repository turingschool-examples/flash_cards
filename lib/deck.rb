require './lib/card'
require './lib/turn'

class Deck
    attr_accessor :cards
                  
    attr_reader :count,
                :cards_in_category,
                :category_list

    def initialize(cards)
        @cards = cards
        @count = @cards.length
    end

    def cards_in_category(cat)
        matching_cards = []
        @cards.each {|x|
            if x.category == cat
                matching_cards.push(x)
            end
        }
        return matching_cards
    end
end