class Deck
    # Allow user to read cards after creation of deck
    attr_reader :cards

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
        @cards.length
    end

    # Define method to count number of cards in a certain category
    def cards_in_category(category)
        # Accumulate cards that match the input category using
        @cards.find_all do |card|
            card.category == category
        end
    end
end
