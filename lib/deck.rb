
require './lib/card'

class Deck
    attr_reader :cards
    def initialize(cards = [])
        @cards = cards
    end

    def count
        return @cards.length
    end
    
    def cards_in_category(indexed_category)
        indexed_cards = []
        cards.find_all do |card|
            if card.category == indexed_category
                indexed_cards << card
            end
        end
    end


end