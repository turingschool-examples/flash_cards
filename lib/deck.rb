require './lib/card'
require './lib/turn'

class Deck

  attr_accessor :cards
    def initialize(cards)
      @cards = cards
      # @card_2 = card_2
      # @card_3 = card_3
    end

    # def cards
    #   cards = [card_1, card_2, card_3]
    #   card.each do |cards|
    #     cards <<


    def count
<<<<<<< HEAD
=======

>>>>>>> bae5df1dd08d97ff1c882f82c861390c267b2c02
      @cards.length
    end

    def cards_in_category(cat)
      cat_cards = []
<<<<<<< HEAD
=======

>>>>>>> bae5df1dd08d97ff1c882f82c861390c267b2c02
      # use cat to find cards in category
      @cards.each do |card|
        cat_cards << card if card.category == cat
      end

      cat_cards
    end
end
