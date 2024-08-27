class Deck
    attr_reader :cards
    def initialize(cards)
        @cards = cards 
    end

    def count
        cards.length
    end
     
    def cards_in_category(category)
        cards.select { |card| card.category.upcase == category.upcase}
    end

end
#make cads in category function that lists the cards by name in 
#an aray that are in the category given as an argument
