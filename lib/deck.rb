class Deck
    # Allow user to read/write cards after creation of deck
    attr_accessor :cards

    # Initialize deck using array of cards
    def initialize(cards)
        # If more than one card exists in the deck (i.e. cards are an array)
        if cards.class == Array
            @cards = cards
        # If only one card exists in the deck (cards.class == Card)
        else
            @cards = Array.new([cards])
        end
    end

    # Define method to count the number of cards in deck
    def count
        return cards.length
    end

    # Define method to count number of cards in a certain category
    def cards_in_category(category)
        # Initialize an empty array
        matches = Array.new

        # Iterate over cards and add card to matches array if category is same
        self.cards.each do |card|
            if card.category == category
                matches.push(card)
            end
        end

        # Return the matches array
        return matches
    end
end
