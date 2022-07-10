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

    def cards_in_category(category)
      @cards.find_all do |card|
         card.category == category
         end
    end 
        
end