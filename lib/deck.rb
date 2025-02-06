class Deck
    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def count #counts the cards
        @cards.length
    end

    def cards_in_category(category) #which cards are in the category given
        match = []

        @cards.each do |card|
            if card.category == category
                match << card
            end
        end
    end


end