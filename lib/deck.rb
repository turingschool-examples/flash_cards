require './lib/card'

class Deck
    attr_reader :cards, :count, :cards_in_category
    def initialize(card_1, card_2, card_3)
        @cards = [card_1, card_2, card_3]
    end
    def cards
        @cards
    end
   def count
    @cards.count
   end
   def cards_in_category(category)


   end
end