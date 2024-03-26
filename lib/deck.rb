require './lib/card'

class Deck
    attr_reader :cards, :category

    def initialize(cards)
        @cards = cards
    end
    
    def cards_in_category(category)
        cards.find_all do |card|
            card.category == category
        end
    end

end

