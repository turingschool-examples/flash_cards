#  require './lib/card'
  require './lib/turn'

class Deck

    attr_reader  :cards

    def initialize(cards)
       @cards = cards
    end

    def count
        @cards.count
    end

    def cards_in_category (category)
        card_id = []
        @cards.each do |card|
            if card.category == category
                card_id << card 
            end
        end
        card_id
    end
end