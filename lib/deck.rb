# require './lib/card'
# require './lib/turn'
# require 'pry'
#

class Deck
  attr_accessor :cards

    def initialize(deck)
        @cards = deck
    end
    def count
      @cards.length
    end
    def cards_in_category(category)
      @cards.find_all do |card|
     card.category == category
    end
  end
  #   def cards_in_category(category)
  #     @cards.each do |card|
  #     if card.category == category
  #         p card
  #       else
  #     end
  #   end
  # end
end
