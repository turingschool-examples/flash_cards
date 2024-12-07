require 'pry'
class Deck
    attr_reader :cards, :count, :cards_in_category
    def initialize(cards)
        @cards = cards
    end
    def count
    @cards.count
    end
    def cards_in_category(category)
        specific_category = cards.find_all do |card|
            card.category == category
        end
    end
    #look at each card in @cards array
    #if the card has an identical category put it in an array (set up array cards_in_category[])
    #return an array of cards that match category
end