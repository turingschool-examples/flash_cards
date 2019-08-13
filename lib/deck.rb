class Deck
    # Allow user to read/write cards after creation of deck
    attr_accessor :cards

    # Initialize deck using array of cards
    def initialize(cards)
        @cards = cards
    end
end
